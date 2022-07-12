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
library(stats)
library(gtsummary)

## Read data 
load(here::here("data", "bact_env_c.rda"))
source(here::here("R", "ida_trans.R"))
source(here::here("R", "tidy_mfp.R"))

key_predictors_orig  <- bact_variables$vip_vars %>%
  str_replace('WBC', 'WBC_noNEU')
key_predictors_trans <- bact_transformed$vip_vars %>%
  str_replace('WBC', 'WBC_noNEU')

# include only complete cases
model_df_complete <- c_bact[c('BC', unique(c(bact_variables$vip_vars, bact_transformed$vip_vars)))] %>%
  mutate(
    WBC_noNEU = WBC - NEU,
    t_WBC_noNEU = pseudo_log(WBC_noNEU, ida_trans(model_df_complete$WBC_noNEU)$const) 
  ) %>%
  na.omit

#fraction of cases used in complete case analysis
dim(model_df_complete)[1] / dim(c_bact)[1]

# end libs & data -------------------------------------------------------------


# global model ----------------------------------------------------------------
# fit full model with complete dataset, use these fp-transformations for all other analyses

global_formula <- paste0('BC ~ ', paste(paste0(paste0('fp(', key_predictors_trans), ',df=2)'), collapse = ' + '))

fit_mfp_complete <- mfp(as.formula(global_formula),
                        data = model_df_complete,
                        family = binomial)

summary(fit_mfp_complete)

# save global formula with fp-trafos
global_formula_fp <- paste('BC ~ ', paste0(tidy(fit_mfp_complete)$term[-1], collapse = ' + '))

# end global model ------------------------------------------------------------


# log reg with mfp using original and transformed variable --------------------
# 'Transformation of Variables'

fit_mfp_complete_notrans <- mfp(as.formula(global_formula %>% str_replace_all('t\\_', '')),
                     data = model_df_complete,
                     family = binomial)

tidy(fit_mfp_complete)
tidy(fit_mfp_complete_notrans)

model_df_medians <- model_df_complete[,unique(c(key_predictors_orig, key_predictors_trans))] %>%
  summarise_all(median)

for(i in 1:length(key_predictors_trans)){
  if(key_predictors_orig[i] != key_predictors_trans[i]){
  
    new_data <- bind_cols(
      model_df_medians,
      x_orig  = model_df_complete[,key_predictors_orig[i]],
      x_trans = model_df_complete[,key_predictors_trans[i]]
      ) %>%
      select(-key_predictors_orig[i], -key_predictors_trans[i]) %>%
      as_tibble() %>%
      distinct()
    
    pred_trans <- predict(fit_mfp_complete, 
                          newdata = new_data %>%
                            rename(  # is needed so predict finds the variables
                              !!key_predictors_orig[i] := x_orig,
                              !!key_predictors_trans[i] := x_trans), 
                          type = 'link', se.fit = TRUE)
    pred_original <- predict(fit_mfp_complete_notrans, 
                             newdata = new_data %>%
                               rename(
                                 !!key_predictors_orig[i] := x_orig,
                                 !!key_predictors_trans[i] := x_trans), 
                             type = 'link', se.fit = TRUE)
    
    plot_df <- cbind(
      new_data,
      yhat_original = pred_original$fit,
      yhat.lwr_original = pred_original$fit - 1.96*pred_original$se.fit,
      yhat.upr_original = pred_original$fit + 1.96*pred_original$se.fit,
      yhat_trans = pred_trans$fit,
      yhat.lwr_trans = pred_trans$fit - 1.96*pred_trans$se.fit,
      yhat.upr_trans = pred_trans$fit + 1.96*pred_trans$se.fit
      ) %>%
      as_tibble() %>%
      pivot_longer(
        cols = contains('yhat')
      ) %>%
      separate(name, c('var', 'model'), sep = '_') %>%
      pivot_wider(
        names_from = 'var', values_from = 'value'
      ) %>%
      mutate(
        model = ifelse(model == 'trans', 'transformed', model)
      )
    
    p_original <- plot_df %>% 
      ggplot(aes(x = x_orig, y = yhat, ymin = yhat.lwr, ymax = yhat.upr, color = model, fill = model)) +
      geom_ribbon(alpha = .2, color = NA) +
      geom_line() +
      geom_rug(data = new_data, aes(x = x_orig), inherit.aes = FALSE) +
      labs(
        y = 'log odds',
        title = 'on original scale',
        x = key_predictors_orig[i]
      ) +
      theme_minimal() +
      scale_color_ptol() +
      scale_fill_ptol()
    
    p_trans <- plot_df %>%
      ggplot(aes(x = x_trans, y = yhat, ymin = yhat.lwr, ymax = yhat.upr, color = model, fill = model)) +
      geom_ribbon(alpha = .2, color = NA) +
      geom_line() +
      geom_rug(data = new_data, aes(x = x_trans), inherit.aes = FALSE) +
      labs(
        y = 'log odds',
        title = 'on pseudo-log scale',
        x = key_predictors_trans[i]
      ) +
      theme_minimal() +
      scale_color_ptol() +
      scale_fill_ptol() 
    
    p <- p_original + (p_trans +
                    theme(
                      axis.title.y = element_text(color = NA)
                    )) +
      plot_layout(guides = 'collect')
    
    print(p)
  }
  
}
# end log reg with mfb using original and transformed variable ----------------


# log reg with mfp using complete vs. part of data ----------------------------
#'validity of predictions'

m_pct <- .5

for(i in 1:length(key_predictors_trans)){
  
  model_df_part <- model_df_complete[
      (model_df_complete[,key_predictors_trans[i]] > quantile(model_df_complete[,key_predictors_trans[i]], .5-m_pct/2)) &
      (model_df_complete[,key_predictors_trans[i]] < quantile(model_df_complete[,key_predictors_trans[i]], .5+m_pct/2)),]
  
  fit_mfp_part <- glm(as.formula(global_formula_fp), #use fp trafos from global model
                      data = model_df_part,
                      family = binomial) 
  
  summary(fit_mfp_complete)
  summary(fit_mfp_part)

  new_data <- bind_cols(
    model_df_medians,
    x_trans = model_df_complete[,key_predictors_trans[i]]
    ) %>%
    select(-key_predictors_trans[i]) %>%
    as_tibble() %>%
    distinct()
  
  pred_complete <- predict(fit_mfp_complete, 
                           newdata = new_data %>%
                             rename(!!key_predictors_trans[i] := x_trans),  # is needed so predict finds the variables
                           type = 'link', se.fit = TRUE)
  pred_part <- predict(fit_mfp_part, 
                       newdata = new_data %>%
                         rename(!!key_predictors_trans[i] := x_trans), 
                       type = 'link', se.fit = TRUE)
  plot_df <- cbind(
    new_data,
    yhat_full = pred_complete$fit,
    yhat.lwr_full = pred_complete$fit - 1.96*pred_complete$se.fit,
    yhat.upr_full = pred_complete$fit + 1.96*pred_complete$se.fit,
    yhat_part = pred_part$fit,
    yhat.lwr_part = pred_part$fit - 1.96*pred_part$se.fit,
    yhat.upr_part = pred_part$fit + 1.96*pred_part$se.fit
    ) %>%
    as_tibble() %>%
    pivot_longer(
      cols = contains('yhat')
    ) %>%
    separate(name, c('var', 'model'), sep = '_') %>%
    pivot_wider(
      names_from = 'var', values_from = 'value'
    )
  
  p <- plot_df %>%
    mutate(
      model = case_when(
        model == 'full' ~ 'complete data',
        model == 'part' ~ paste0('median +/- ', m_pct*100/2, '%')
      )
    ) %>%
    ggplot(aes(x = x_trans, y = yhat, ymin = yhat.lwr, ymax = yhat.upr, color = model, fill = model)) +
    annotate(
      'rect', 
       xmin = min(model_df_part[,key_predictors_trans[i]]), 
       xmax = max(model_df_part[,key_predictors_trans[i]]),
       ymin = -Inf, ymax = Inf, alpha = .1
    ) +
    geom_ribbon(alpha = .2, color = NA) +
    geom_line() +
    geom_rug(data = new_data, aes(x = x_trans), inherit.aes = FALSE, color = gray(.5)) +
    geom_rug(data = model_df_part, aes_string(x = key_predictors_trans[i]), inherit.aes = FALSE) +
    annotate(
      'text',
      label = 'data used for restricted model',
      x = median(model_df_part[,key_predictors_trans[i]])*1.1,
      y = -6, vjust = 0, hjust = -0.02
    ) +
    annotate(
      'segment',
      x = median(model_df_part[,key_predictors_trans[i]]), xend = median(model_df_part[,key_predictors_trans[i]])*1.1,
      y = -Inf, yend = -6
    ) +
    labs(
      y = 'log odds',
      color = 'model fitted with',
      fill = 'model fitted with',
      x = key_predictors_trans[i]
    ) +
    theme_minimal() +
    scale_color_ptol() +
    scale_fill_ptol() 
  
  print(p)

}

# end log reg with mfp using complete vs. part of data ------------------------


# multiple imputation of artificial missingness -------------------------------

tidy(fit_mfp_complete)

# create 50% missings for t_KREA
model_df_missings <- model_df_complete %>%
  mutate(
    t_KREA = ifelse(
      runif(dim(model_df_complete)[1]) < .5,  #~50%/50% TURE/FALSE
      t_KREA,
      NA
    )
  )

md.pattern(model_df_missings)

fit_mfp_missing <- glm(as.formula(global_formula_fp), #use same fp-trafos as in global model
                       data = model_df_missings,
                       family = binomial)

# impute
imp_data <- mice(model_df_missings %>%
                   select(BC, key_predictors_trans), 
                 m=50, maxit = 50, method='pmm')

# fit imputed data
imp_fits <- with(imp_data,
                 glm(as.formula(global_formula_fp), #use same fp-trafos as in global model
                 family = binomial)
  )

# pooled results
fit_pooled <- pool(imp_fits)

bind_rows(
  tidy(fit_mfp_complete)  %>% mutate(model = 'global'),
  tidy(fit_mfp_missing) %>% mutate(model = 'missing_complete'),
  summary(fit_pooled) %>% select(-df) %>% as_tibble() %>% mutate(model = 'missing_imputed')
  ) %>%
  pivot_longer(
    cols = c(-term, -model)
  ) %>%
  mutate(
    value = round(value, 3)
  ) %>%
  pivot_wider(
    names_from = model, 
    values_from = value
  ) %>%
  unite(combined, c(global, missing_complete, missing_imputed), sep = ' / ') %>%
  pivot_wider(
    names_from = name,
    values_from = combined
  )

# end multiple imputation of artificial missingness ---------------------------
