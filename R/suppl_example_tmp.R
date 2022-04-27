# script for supplement, turn into Rmarkdown file later

# libs & data -----------------------------------------------------------------

library(here)
library(tidyverse)
library(Hmisc)
library(ggplot2)
library(mfp)
library(effects)
library(mice)
library(patchwork)
library(ggthemes)

## Read data 
load(here::here("data", "bact_env_c.rda"))
source(here::here("R", "ida_trans.R"))

vars_vip <- unique(c(bact_transformed$vip_vars, bact_variables$vip_vars))

# include only complete cases
model_df_complete <- c_bact[c('BC', vars_vip, 'WBC')] %>%
  mutate(
    t_WBC_noNEU = t_WBC - t_NEU 
  ) %>%
  na.omit

#fraction of cases used in complete case analysis
dim(model_df_complete)[1] / dim(c_bact)[1]

# end libs & data -------------------------------------------------------------


# log reg with mfp using original and transformed variable --------------------
# 'Transformation of Variables'

fit_mfp_original <- mfp(BC ~ fp(WBC, df=2),
                        data = model_df_complete,
                        family = binomial)

fit_mfp_trans <- mfp(BC ~ fp(t_WBC, df=2),
                     data = model_df_complete,
                     family = binomial)

summary(fit_mfp_original)
summary(fit_mfp_trans)

new_data <- tibble(
  WBC = 0:150) %>%
  mutate(
  t_WBC = pseudo_log(WBC, sigma = sigma_values['WBC'])
  )

pred_original <- predict(fit_mfp_original, newdata = new_data, type = 'link', se.fit = TRUE)
pred_trans <- predict(fit_mfp_trans, newdata = new_data, type = 'link', se.fit = TRUE)

plot_df <- cbind(
  new_data,
  yhat_original = pred_original$fit,
  lwr_original = pred_original$fit - 1.96*pred_original$se.fit,
  upr_original = pred_original$fit + 1.96*pred_original$se.fit,
  yhat_trans = pred_trans$fit,
  lwr_trans = pred_trans$fit - 1.96*pred_trans$se.fit,
  upr_trans = pred_trans$fit + 1.96*pred_trans$se.fit
  ) %>%
  pivot_longer(
    cols = c(-WBC, -t_WBC)
  ) %>%
  separate(name, c('var', 'model')) %>%
  pivot_wider(
    id_cols = c(WBC, t_WBC, model), names_from = 'var', values_from = 'value'
  ) %>%
  mutate(
    model = ifelse(model == 'trans', 'transformed', model)
  )

p_original <- plot_df %>% 
  ggplot(aes(x = WBC, y = yhat, ymin = lwr, ymax = upr, color = model, fill = model)) +
  geom_ribbon(alpha = .2, color = NA) +
  geom_line() +
  geom_rug(data = model_df_complete, aes(x = WBC), inherit.aes = FALSE) +
  labs(
    y = 'log odds',
    title = 'on original scale'
  ) +
  theme_minimal() +
  scale_color_ptol() +
  scale_fill_ptol()

p_trans <- plot_df %>%
  ggplot(aes(x = t_WBC, y = yhat, ymin = lwr, ymax = upr, color = model, fill = model)) +
  geom_ribbon(alpha = .2, color = NA) +
  geom_line() +
  geom_rug(data = model_df_complete, aes(x = t_WBC), inherit.aes = FALSE) +
  labs(
    y = 'log odds',
    title = 'on pseudo-log scale'
  ) +
  theme_minimal() +
  scale_color_ptol() +
  scale_fill_ptol() 

p_original + (p_trans +
  theme(
    axis.title.y = element_text(color = NA)
  )) +
  plot_layout(guides = 'collect') +
  plot_annotation(caption = 'using fp(WBC) and fp(t_WBC) with df=2')

# not sure if WBC is the best choice to show this, try others?

# end log reg with mfb using original and transformed variable ----------------


# log reg with mfp using complete vs. part of data ----------------------------
#'validity of predictions'

fit_mfp_full <- mfp(BC ~ fp(t_WBC, df=2),
                    data = model_df_complete,
                    family = binomial)

m_pct <- .25

model_df_part <- model_df_complete %>%
                      filter(
                        t_WBC > quantile(t_WBC, .5-m_pct/2),
                        t_WBC < quantile(t_WBC, .5+m_pct/2)
                      )

fit_mfp_part <- mfp(BC ~ fp(t_WBC, df=2),
                    data = model_df_part,
                    family = binomial) 


new_data <- tibble(
  WBC = 0:150) %>%
  mutate(
    t_WBC = pseudo_log(WBC, sigma = sigma_values['WBC'])
  )

pred_full <- predict(fit_mfp_full, newdata = new_data, type = 'link', se.fit = TRUE)
pred_part <- predict(fit_mfp_part, newdata = new_data, type = 'link', se.fit = TRUE)

plot_df <- cbind(
  new_data,
  yhat_full = pred_full$fit,
  lwr_full = pred_full$fit - 1.96*pred_full$se.fit,
  upr_full = pred_full$fit + 1.96*pred_full$se.fit,
  yhat_part = pred_part$fit,
  lwr_part = pred_part$fit - 1.96*pred_part$se.fit,
  upr_part = pred_part$fit + 1.96*pred_part$se.fit
) %>%
  pivot_longer(
    cols = c(-WBC, -t_WBC)
  ) %>%
  separate(name, c('var', 'model')) %>%
  pivot_wider(
    id_cols = c(WBC, t_WBC, model), names_from = 'var', values_from = 'value'
  )

plot_df %>%
  mutate(
    model = case_when(
      model == 'full' ~ 'complete data',
      model == 'part' ~ paste0('median +/- ', m_pct*100/2, '%')
    )
  ) %>%
  ggplot(aes(x = t_WBC, y = yhat, ymin = lwr, ymax = upr, color = model, fill = model)) +
  annotate(
    'rect', 
     xmin = min(model_df_part$t_WBC), 
     xmax = max(model_df_part$t_WBC),
     ymin = -Inf, ymax = Inf, alpha = .1
  ) +
  geom_ribbon(alpha = .2, color = NA) +
  geom_line() +
  geom_rug(data = model_df_complete, aes(x = t_WBC), inherit.aes = FALSE, color = gray(.5)) +
  geom_rug(data = model_df_part, aes(x = t_WBC), inherit.aes = FALSE) +
  # annotate(
  #   'text',
  #   label = 'data used for restricted model',
  #   x = median(model_df_part$t_WBC),
  #   y = Inf, vjust = .5, hjust = 1.1, angle = 90
  # ) +
  annotate(
    'text',
    label = 'data used for restricted model',
    x = median(model_df_part$t_WBC)*1.1,
    y = -6, vjust = 0, hjust = -0.02
  ) +
  annotate(
    'segment',
    x = median(model_df_part$t_WBC), xend = median(model_df_part$t_WBC)*1.1,
    y = -Inf, yend = -6
  ) +
  labs(
    y = 'log odds',
    color = 'model fitted with',
    fill = 'model fitted with'
  ) +
  theme_minimal() +
  scale_color_ptol() +
  scale_fill_ptol() 

# end log reg with mfp using complete vs. part of data ------------------------


# multiple imputation of artificial missingness -------------------------------

fp_df <- 2

fit_mfp_complete <- mfp(BC ~ fp(Alter, df=fp_df) + fp(t_WBC_noNEU, df=fp_df) + # use t_WBC or t_WBC_noNEU?
                          fp(t_BUN, df=fp_df) + fp(t_KREA, df=fp_df) + 
                          fp(t_NEU, df=fp_df) + fp(PLT, df=fp_df),
                        data = model_df_complete,
                        family = binomial)

summary(fit_mfp_complete)

# t_NEU and t_WBC are both highly significant (p<2e-16), create artificial NAs
# for 50% of t_NEU (or other variable, since correlation of t_NEU and t_WBC is very high?)

# introduce missingness
model_df_missings <- model_df_complete %>%
  mutate(
    t_WBC = ifelse(
      runif(dim(model_df_complete)[1]) < .5,  #~50%/50% TURE/FALSE
      t_WBC,
      NA
    )
  )

md.pattern(model_df_missings)

# impute
imp_data <- mice(model_df_missings %>%
                   select(-t_WBC_noNEU, -t_NEU), 
                 m=5, maxit = 50, method='pmm')

# fit imputed data
imp_fits <- with(imp_data,
     mfp(BC ~ fp(Alter, df=fp_df) + fp(t_WBC, df=fp_df) + # use t_WBC or t_WBC_noNEU?
       fp(t_BUN, df=fp_df) + fp(t_KREA, df=fp_df) + fp(PLT, df=fp_df),
     family = binomial)
)

# define tidy function for mfp-models
tidy.mfp <- function(x, conf.int = FALSE, conf.level = 0.95, ...) {
  
  #warn_on_subclass(x, "tidy")
  
  ret <- as_tibble(summary(x)$coefficients, rownames = "term")
  colnames(ret) <- c("term", "estimate", "std.error", "statistic", "p.value")
  
  # summary(x)$coefficients misses rank deficient rows (i.e. coefs that
  # summary.lm() sets to NA), catch them here and add them back
  coefs <- tibble::enframe(stats::coef(x), name = "term", value = "estimate")
  coefs$term <- ret$term
  ret <- left_join(coefs, ret, by = c("term", "estimate"))
  
  #if (conf.int) {
  if (FALSE) {
    ci <- broom_confint_terms(x, level = conf.level)
    ret <- dplyr::left_join(ret, ci, by = "term")
  }
  
  ret
}

# pooled results
summary(pool(imp_fits))

# end multiple imputation of artificial missingness ---------------------------


# backward elimination: complete case vs. imputed -----------------------------
# end backward elimination: complete case vs. imputed -------------------------


