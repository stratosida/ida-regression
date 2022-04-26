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

# t_NEU and t_WBC are both highly significant (p<2e-16), create artificial NAs
# for 50% of t_NEU (or other variable, since correlation of t_NEU and t_WBC is very high?)

model_df_missings <- model_df_complete %>%
  mutate(
    t_NEU = ifelse(
      runif(dim(model_df_complete)[1]) > .5,  #~50%/50% TURE/FALSE
      t_NEU,
      NA
    )
  )

# end libs & data -------------------------------------------------------------


# log reg with mfp using original and transformed variable --------------------

fit_mfp_original <- mfp(BC ~ fp(WBC, df=2),
                        data = model_df_complete,
                        family = binomial)

fit_mfp_trans <- glm(BC ~ fp(t_WBC, df=2),
                     data = model_df_complete,
                     family = binomial)

summary(fit_mfp_original)
summary(fit_mfp_trans)

new_data <- tibble(
  WBC = 1:150) %>%
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
  )

p_original <- plot_df %>%
  pivot_longer(
    cols = c(-WBC, -t_WBC)
  ) %>%
  separate(name, c('var', 'model')) %>%
  pivot_wider(
    id_cols = c(WBC, t_WBC, model), names_from = 'var', values_from = 'value'
  ) %>%
  ggplot(aes(x = WBC, y = yhat, ymin = lwr, ymax = upr, color = model, fill = model)) +
  geom_ribbon(alpha = .1, color = NA) +
  geom_line() +
  geom_rug(data = model_df_complete, aes(x = WBC), inherit.aes = FALSE) +
  labs(
    y = 'log odds',
    title = 'on original scale'
  ) +
  theme_minimal()

p_trans <- plot_df %>%
  pivot_longer(
    cols = c(-WBC, -t_WBC)
  ) %>%
  separate(name, c('var', 'model')) %>%
  pivot_wider(
    id_cols = c(WBC, t_WBC, model), names_from = 'var', values_from = 'value'
  ) %>%
  ggplot(aes(x = t_WBC, y = yhat, ymin = lwr, ymax = upr, color = model, fill = model)) +
  geom_ribbon(alpha = .1, color = NA) +
  geom_line() +
  geom_rug(data = model_df_complete, aes(x = t_WBC), inherit.aes = FALSE) +
  labs(
    y = 'log odds',
    title = 'on pseudo-log scale'
  ) +
  theme_minimal()

p_original + p_trans +
  plot_layout(guides = 'collect')

# end log reg with mfb using original and transformed variable ----------------


# complete case log reg -------------------------------------------------------

# logistic regression model without fractional polynomials, complete cases
fit_linear_complete <- glm(BC ~ Alter + t_WBC_noNEU + # use t_WBC or t_WBC_noNEU?
                                t_BUN + t_KREA + 
                                t_NEU + PLT,
                           data = model_df_complete,
                          family = binomial)

# logistic regression model with fractional polynomials of order 1, complete cases
fp_df <- 2

fit_mfp_complete <- mfp(BC ~ fp(Alter, df=fp_df) + fp(t_WBC_noNEU, df=fp_df) + # use t_WBC or t_WBC_noNEU?
                             fp(t_BUN, df=fp_df) + fp(t_KREA, df=fp_df) + 
                             fp(t_NEU, df=fp_df) + fp(PLT, df=fp_df),
                        data = model_df_complete,
                        family = binomial)

summary(fit_linear_complete)
summary(fit_mfp_complete)

# end complete case log reg ---------------------------------------------------


# multiple imputation of artificial missingness -------------------------------
# end multiple imputation of artificial missingness ---------------------------


# backward elimination: complete case vs. imputed -----------------------------
# end backward elimination: complete case vs. imputed -------------------------


