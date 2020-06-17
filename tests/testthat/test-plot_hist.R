library(tidyverse)
library(patchwork)

load(here::here("data", "crash2.rda"))
hist(crash2$age)
table(crash2$age)

ida_plot_hist(crash2, age, bin_width = 1)


breaks <- dplyr::summarise(crash2, 
                           mean = mean(age, na.rm = TRUE),
                           median = median(age, na.rm = TRUE),
                           min = min(age, na.rm = TRUE),
                           max = max(age, na.rm = TRUE),
                           lower = quantile(age, probs = 0.25, na.rm = TRUE),
                           upper = quantile(age, probs = 0.75, na.rm = TRUE)) 





calc_breaks(crash2, age)


