# script to generate figures for 'regression without regrets' manuscript and supplement

# libs and data ---------------------------------------------------------------

library(here)
library(tidyverse)
library(Hmisc)
library(ggplot2)
library(mfp)
library(mice)
library(patchwork)
library(ggthemes)
library(ggExtra)
library(gt)
library(stats)
library(pROC)

source(here("R", "ida_plot_univar.R"))  ## function to plot univariate summaries. 
source(here("R", "ida_plot_univar_orig_vs_trans.R"))  ## function for side-by-side comparison of original vs. transformed scale, calls ida_plot_univar.R
source(here("R", "ida_trans.R"))  ## function to determine transformation (log(x+c) or identity). 

load(here::here("data", "bact_env_b.rda"))
load(here::here("data", "bact_env_c.rda"))

# end libs and data -----------------------------------------------------------


# figure 1: dendrogram of missingness -----------------------------------------

s_bact <- b_bact[sample(1:nrow(b_bact), size=10000, repl=FALSE),]
is_bact <- is.na(b_bact)*1
exl_vars <- which(colnames(is_bact) %in% c("BC","BloodCulture","ID"))
perc_miss <- round(apply(is_bact, 2, mean)*100,0)
colnames(is_bact)<-paste(colnames(is_bact),"(",perc_miss,")",sep="")
hobj <- hclust(dist(t(is_bact[,-exl_vars])))

tiff(file=here('misc/figures_regression_without_regrets/p_fig1.tiff'),
    res = 250, width = 1500, height = 900)

plot(hobj, cex=0.5)

dev.off()

# end figure 1: dendrogram of missingness -------------------------------------


# figure 2: original vs. pseudo-log -------------------------------------------

var_sel <- c('BUN', 'GGT', 'BASO')

res<-sapply(var_sel, function(X) ida_trans(c_bact[,X])$const)

p_fig2_1 <- ida_plot_univar_orig_vs_trans(c_bact, var_sel[1], sigma=res[1], n_bars=100)
p_fig2_2 <- ida_plot_univar_orig_vs_trans(c_bact, var_sel[2], sigma=res[2], n_bars=100)

p_fig2 <- (p_fig2_1 / p_fig2_2) #this supresses titles & captions, don't know why

ggsave(here('misc/figures_regression_without_regrets/p_fig2_1.png'), p_fig2_1, width = 8, height = 5)
ggsave(here('misc/figures_regression_without_regrets/p_fig2_2.png'), p_fig2_2, width = 8, height = 5)
ggsave(here('misc/figures_regression_without_regrets/p_fig2.png'), p_fig2, width = 8, height = 9)

# end figure 2: original vs. pseudo-log ---------------------------------------


# figure 3: t_WBC & ALB by age and sex ----------------------------------------

c_bact$Agegroup <- factor(cut(c_bact$AGE, c(min(c_bact$AGE), 50, 65, max(c_bact$AGE))))
c_bact$Sex=factor(c_bact$SEX, levels=c(1,2), labels=c("male","female"))

p_fig3 <- c_bact %>% 
  filter(!is.na(Agegroup)) %>% 
  ggplot(c_bact, mapping=aes(x=t_WBC,y=ALB)) + 
  geom_point(alpha=.1) + 
  geom_smooth() +  
  geom_rug(alpha=.1) +
  facet_grid(Sex ~ Agegroup, labeller=label_both) +
  theme_minimal()

ggsave(here('misc/figures_regression_without_regrets/p_fig3.png'), p_fig3, width = 9, height = 6)

# end figure 3: t_WBC & ALB by age and sex ------------------------------------

#comment: figure 4 is a screenshot of a reduandancy analysis, not included here

# figure 5: basophiles, original vs. pseudo-log -------------------------------

p_fig5 <- ida_plot_univar_orig_vs_trans(c_bact, var_sel[3], sigma=res[3], n_bars=100)

ggsave(here('misc/figures_regression_without_regrets/p_fig5.png'), p_fig5, width = 8, height = 5)

# end figure 5: basophiles, original vs. pseudo-log ---------------------------


# figure S1: functional forms of reference model ------------------------------

# define key predictors without pseudo-log trafo ('orig') and transformed ('trans'), replace WBC with WBC_noNEU
key_predictors_orig  <- bact_variables$key_predictors %>%
  str_replace('WBC', 'WBC_noNEU')
key_predictors_trans <- bact_transformed$key_predictors %>%
  str_replace('WBC', 'WBC_noNEU')

model_df_complete <- c_bact[c('BC', unique(c(bact_variables$key_predictors, bact_transformed$key_predictors)))] %>%
  mutate(
    WBC_noNEU = WBC - NEU
  ) %>%
  na.omit %>%
  mutate(
    t_WBC_noNEU = pseudo_log(WBC_noNEU, ida_trans(WBC_noNEU)$const) 
  )

reference_formula <- paste0('BC ~ ', paste(paste0(paste0('fp(', key_predictors_trans), ',df=2)'), collapse = ' + '))

set.seed(1)
fit_mfp_complete <- mfp(as.formula(reference_formula),
                        data = model_df_complete,
                        family = binomial)

# save reference formula with fp-trafos
reference_formula_fp <- paste('BC ~ ', paste0(tidy(fit_mfp_complete)$term[-1], collapse = ' + '))

# medians of all key predictors, selected variables will be adjusted to these medians in effect plots
model_df_medians <- model_df_complete[,unique(c(key_predictors_orig, key_predictors_trans))] %>%
  summarise_all(median)

p_figS1_list <- list(length=length(key_predictors_trans))
for(i in 1:length(key_predictors_trans)){
  
  new_data <- bind_cols(
    model_df_medians,
    x = model_df_complete[,key_predictors_trans[i]]
  ) %>%
    select(-key_predictors_trans[i]) %>%
    as_tibble() %>%
    distinct()
  
  pred_complete <- predict(fit_mfp_complete, 
                           newdata = new_data %>%
                             rename(!!key_predictors_trans[i] := x),  # is needed so predict finds the variables
                           type = 'link', se.fit = TRUE)
  
  plot_df <- cbind(
    new_data,
    yhat = pred_complete$fit,
    yhat.lwr = pred_complete$fit - 1.96*pred_complete$se.fit,
    yhat.upr = pred_complete$fit + 1.96*pred_complete$se.fit
  ) %>%
    as_tibble() %>% 
    mutate(model = "reference model")
  
  p <- plot_df %>% 
    ggplot(aes(x = x, y = yhat, ymin = yhat.lwr, ymax = yhat.upr, color=model, fill=model)) +
    geom_ribbon(alpha = .2, color = NA) +
    geom_line() +
    geom_rug(
      data = fit_mfp_complete$X %>% as.data.frame, 
      aes_string(x = key_predictors_trans[i]), 
      inherit.aes = FALSE) +
    labs(
      y = 'log odds',
      x = key_predictors_trans[i]
    ) +
    theme_minimal() +
    scale_color_discrete(guide = "none") +
    scale_fill_discrete(guide = "none")
  
  print(p)
  
  p_figS1_list[[i]] <- p
  
  if(key_predictors_trans[i] == 'PLT'){ p_effect_PLT <- p} # save for example 5
}

p_figS1 <- wrap_plots(p_figS1_list, ncol=2, nrow=3, byrow = TRUE)

ggsave(here('misc/figures_regression_without_regrets/p_figS1.png'), p_figS1, width = 7, height = 9)

# end figure S1: functional forms of reference model --------------------------


# figure S2: transfo vs. untrafo ----------------------------------------------

fit_mfp_complete_notrans <- mfp(as.formula(reference_formula %>% str_replace_all('t\\_', '')),
                                data = model_df_complete,
                                family = binomial)

p_figS2_list <- list(length=sum(key_predictors_trans != key_predictors_orig))
j <- 1
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
        model = case_when(
          model == 'trans' ~ 'pseudo-log transformed',
          model == 'original' ~ 'original scale'
        )
      )
    
    
    p_original <- plot_df %>% 
      ggplot(aes(x = x_orig, y = yhat, ymin = yhat.lwr, ymax = yhat.upr, color = model, fill = model)) +
      geom_ribbon(alpha = .2, color = NA) +
      geom_line() +
      geom_rug(data = fit_mfp_complete_notrans$X %>% as.data.frame, 
               aes_string(x = key_predictors_orig[i]), 
               inherit.aes = FALSE
      ) +
      labs(
        y = 'log odds',
        x = key_predictors_orig[i],
        color = 'model with data on',
        fill = 'model with data on'
      ) +
      theme_minimal() +
      scale_color_ptol() +
      scale_fill_ptol()+
      theme(legend.position="none")
    
    p_trans <- plot_df %>%
      ggplot(aes(x = x_trans, y = yhat, ymin = yhat.lwr, ymax = yhat.upr, color = model, fill = model)) +
      geom_ribbon(alpha = .2, color = NA) +
      geom_line() +
      geom_rug(data = fit_mfp_complete$X %>% as.data.frame, 
               aes_string(x = key_predictors_trans[i]), 
               inherit.aes = FALSE
      ) +
      labs(
        y = 'log odds',
        x = key_predictors_trans[i],
        color = 'model with data on',
        fill = 'model with data on'
      ) +
      theme_minimal() +
      scale_color_ptol() +
      scale_fill_ptol()+
      theme(legend.position="none")
    
    p_figS2_list[[j*2-1]] <- p_original
    p_figS2_list[[j*2]]   <- p_trans + theme(axis.title.y = element_text(color = NA))
    
    j <- j+1
    
  }
  
}

p_figS2 <- wrap_plots(p_figS2_list, ncol=2, nrow=4, byrow = TRUE) +
  theme(legend.position = 'bottom') + 
  guides(color=guide_legend(nrow=2, byrow=TRUE))

ggsave(here('misc/figures_regression_without_regrets/p_figS2.png'), p_figS2, width = 7, height = 9)

# end figure S2: transfo vs. untrafo ------------------------------------------


# figure S3: support of model -------------------------------------------------

m_pct <- .5

sel_central <- (model_df_complete$WBC_noNEU > quantile(model_df_complete$WBC_noNEU, 0.5-m_pct/2)) & 
  (model_df_complete$WBC_noNEU < quantile(model_df_complete$WBC_noNEU, 0.5+m_pct/2)) #needed later

set.seed(2)
sel_sample <- as.logical(round(runif(dim(model_df_complete)[1]))) # 50% random selection, needed later

pred_complete <- predict(fit_mfp_complete, 
                         newdata = model_df_complete,
                         type = 'response')
y_complete <- fit_mfp_complete$y

pred_central <- predict(fit_mfp_complete, 
                        newdata = model_df_complete[sel_central,],
                        type = 'response')
y_central <- fit_mfp_complete$y[sel_central]

pred_sample <- predict(fit_mfp_complete, 
                       newdata = model_df_complete[sel_sample,],
                       type = 'response')
y_sample <- fit_mfp_complete$y[sel_sample]


r_squared_efron <- function(y, prediction){
  n <- length(y)
  1-(((1/n)*sum((y-prediction)^2))/((1/n)*sum((y-mean(y))^2)))
}

p_figS3 <- rbind(
  tibble(
    BC = y_complete,
    prediction = pred_complete,
    model = 'complete data'
  ),
  tibble(
    BC = y_central,
    prediction = pred_central,
    model = 'within IQR (WBC_noNEU)'
  ),
  tibble(
    BC = y_sample,
    prediction = pred_sample,
    model = 'random 50% subsample'
  )) %>%
  mutate(model = factor(model, levels = c('complete data', 'within IQR (WBC_noNEU)', 'random 50% subsample'))) %>%
  ggplot(aes(x = factor(BC), y = prediction, group = BC)) +
  geom_boxplot() + 
  facet_grid(~model) +
  theme_minimal() +
  labs(x = 'Bacteremia')

ggsave(here('misc/figures_regression_without_regrets/p_figS3.png'), p_figS3, width = 7, height = 3)

# end figure S3: support of model ---------------------------------------------


# figure S4: histogram of trafo -----------------------------------------------

p_figS4 <- model_df_complete %>%
  select(key_predictors_trans[str_detect(key_predictors_trans, 't_')]) %>%
  mutate_all(as.numeric) %>%
  pivot_longer(cols = everything()) %>%
  ggplot(aes(x = value, group = name)) + 
  facet_wrap(~name, scales = 'free', strip.position = "bottom") +
  geom_histogram(fill = 'firebrick2', color = NA, alpha = 0.5) +
  theme_minimal() +
  theme(strip.placement = 'outside')

ggsave(here('misc/figures_regression_without_regrets/p_figS4.png'), p_figS4, width = 8, height = 4)

# end figure S4: histogram of trafo -------------------------------------------


# fig S5 ----------------------------------------------------------------------

fit_linear_complete <- glm(as.formula(paste0('BC ~ ', paste(key_predictors_trans, collapse = '+'))),
                           data = model_df_complete,
                           family = 'binomial') 

new_data <- bind_cols(
  model_df_medians[,names(model_df_medians) != 't_WBC_noNEU'],
  t_WBC_noNEU = model_df_complete[,'t_WBC_noNEU']
) %>%
  as_tibble() %>%
  distinct()

pred_linear <- predict(fit_linear_complete,
                       newdata = new_data,  # is needed so predict finds the variables
                       type = 'link', se.fit = TRUE)

pred_complete <- predict(fit_mfp_complete, 
                         newdata = new_data,  # is needed so predict finds the variables
                         type = 'link', se.fit = TRUE)

plot_df <- 
  rbind(
    cbind(
      new_data,
      yhat = pred_linear$fit,
      yhat.lwr = pred_linear$fit - 1.96*pred_linear$se.fit,
      yhat.upr = pred_linear$fit + 1.96*pred_linear$se.fit,
      model = 'linear'
    ),
    cbind(
      new_data,
      yhat = pred_complete$fit,
      yhat.lwr = pred_complete$fit - 1.96*pred_complete$se.fit,
      yhat.upr = pred_complete$fit + 1.96*pred_complete$se.fit,
      model = 'mfp'
    )
  ) %>%
  as_tibble() 

p_figS5_1 <- plot_df %>% 
  ggplot(aes(x = t_WBC_noNEU, y = yhat, ymin = yhat.lwr, ymax = yhat.upr, color = model, group = model)) +
  geom_ribbon(alpha = .2, color = NA) +
  geom_line(size = 1) +
  geom_rug(
    data = fit_mfp_complete$X %>% as.data.frame, 
    aes(x = t_WBC_noNEU), 
    inherit.aes = FALSE) +
  labs(
    y = 'log odds'
  ) +
  theme_minimal() +
  scale_color_ptol()

p_figS5 <- p_figS5_1  + (p_figS5_1 + coord_cartesian(xlim = quantile(model_df_complete$t_WBC_noNEU, c(.05,.95)), ylim = c(-4.5, -0.5))) +
  plot_layout(guides = 'collect')

ggsave(here('misc/figures_regression_without_regrets/p_figS5.png'), p_figS5, width = 8, height = 4)

# end figure S5 ---------------------------------------------------------------

