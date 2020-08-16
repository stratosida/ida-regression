#####################
##  ISCB 2020 plots
#####################

library(here)
library(tidyverse)
library(Hmisc)
source(here("R", "ida_plot_univar.R"))  ## function to 

# Define sets of predictors by type - helpful for selection
demog_vars <- c("age", "sex")
pyhiso_vars <- c("sbp", "hr", "rr", "gcs", "cc")
injury_vars <- c("injurytime", "injurytype")

## Load the dataset.
load(here::here("data", "a_crash2.rda"))

###############################
##  Hours since injury
###############################
# vector of variable for calculating five number summary
x <- as.numeric(a_crash2$injurytime)

# title for plot
title <-
  paste0("Univariate summary of ", label(a_crash2$injurytime), " [", units(a_crash2$injurytime), "]")

# labels for histogram
y_axis <- "Number of subjects"
x_axis <-
  paste0(label(a_crash2$injurytime), " [", units(a_crash2$injurytime), "]")

# caption to summarise missing data
caption <-
  paste0(
    "All observed values, the distribution and the, min, max and interquartile range are reported\n",
    "n = ",
    bign,
    " subjects displayed. ",
    nmiss,
    " subjects with missing values are not presented."
  )

## strip plot
p1 <-
  a_crash2 %>%
  filter(!is.na(injurytime)) %>%
  ggplot(aes(x = as.numeric(injurytime), y = 0)) +
  geom_jitter(size = 1.5,
    width = 0.1,
    height = 0.1,
    alpha = 0.45,
    color = "red"
  ) +
  geom_rug(sides = "b") +
  scale_x_continuous(limit = c(min(x), max(x)),
                     breaks = round(fivenum(x), 1)) +
  ggplot2::theme_minimal(base_size = 14) +
  ylab(y_axis) +
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.major.x = element_line(colour = "grey", size = 0.75),
    panel.grid.minor = element_blank(),
    axis.title = element_blank(),
    axis.text = element_blank()
  )

p1


## plot histogram
p2 <-
  a_crash2 %>%
  filter(!is.na(injurytime)) %>%
  ggplot2::ggplot(aes(as.numeric(injurytime))) +
  geom_histogram(
    bins = 200,
    center = 0,
    alpha = 0.7,
    fill = "red"
  ) +
  geom_rug() +
  scale_x_continuous(limit = c(min(x), max(x)),
                     breaks = round(fivenum(x), 1),
                     guide = guide_axis(n.dodge = 3)) +
  ylab(y_axis) +
  ggplot2::theme_minimal(base_size = 14) +
      theme(
        panel.grid.major.x = element_line(colour = "grey", size = 0.75),
        panel.grid.minor = element_blank(),
        axis.title.x = element_blank()
      )

p2

# layout for combined plot
# histogram has more area
layout <- c(patchwork::area(1, 1, 1, 6),
            patchwork::area(2, 1, 5, 6))

## combine plots
gg <- p1 / p2  +
  patchwork::plot_layout(design = layout) +
  patchwork::plot_annotation(title = title,
  theme = theme(plot.title = element_text(size = 18)))

page_width <- 260
page_height <- 90
d_dpi <- 300
ggsave(file = paste0("iscb-figures/hours.png"), 
       width = page_width, height = page_height, 
       units = "mm", dpi = d_dpi)
###############################



################################
## Age and RR
################################

a_crash2 %>%
  dplyr::select(age, hr) %>%
  dplyr::mutate() %>%
  dplyr::mutate_all(as.numeric) %>%
  tidyr::pivot_longer(dplyr::everything(),
                      names_to = "var",
                      values_to = "value") %>%
  dplyr::mutate(
    var_label = case_when(
      var == "age" ~ "Age (years)",
      var == "hr" ~  "Heart rate (1/min)"
    )) %>%
  ggplot(aes(value)) +
  ylab("Number of subjects") +
  geom_histogram(bins = 200, alpha = 0.6, fill = "red") +
  facet_wrap(~ var_label, scales = "free", ncol = 1) +
  theme_minimal(base_size = 18) +
  theme(axis.title.x = element_blank(),
        panel.grid.minor = element_blank())


page_width <- 200
page_height <- 150
d_dpi <- 300
ggsave(file = paste0("iscb-figures/age-hr.png"), 
       width = page_width, height = page_height, 
       units = "mm", dpi = d_dpi)

################################



################################
## GCS
################################
a_crash2 %>%
  dplyr::select(gcs) %>%
  dplyr::mutate(gcs = as_factor(gcs)) %>%
  tidyr::pivot_longer(
    dplyr::everything(),
    names_to = "var",
    values_to = "value",
    values_drop_na = FALSE
  ) %>%
  dplyr::group_by(var, value) %>%
  dplyr::summarize(N = n()) %>%
  dplyr::mutate(
    freq = N / sum(N),
    pct = round((freq * 100), 1),
    value = as_factor(value),
    axis_lab = as_factor(paste0(value))
  ) %>%
  ggplot(aes(
    x = axis_lab,
    y = pct,
    label = pct
  )) +
  geom_pointrange(aes(ymin = 0, ymax = pct), alpha = 1, size = 1.15, color = "grey") +
  geom_point(color = "red",
             alpha = 0.6,
             size = 3) +
  geom_text(nudge_y = 4) +
  ylab("Percentage (%)") +
  scale_y_continuous(limits = c(0, 100)) +
  labs(title = "Glasgow coma score (point scale)",
       caption = "\nNA = missing") +
  coord_flip() +
  theme_minimal(base_size = 18) +
  theme(axis.title.y = element_blank(),
        panel.grid.minor = element_blank())


page_width <- 200
page_height <- 150
d_dpi <- 300
ggsave(file = paste0("iscb-figures/gcs.png"), 
       width = page_width, height = page_height, 
       units = "mm", dpi = d_dpi)

##########################################
