library(tidyverse)
plot_hist <- function(data, var, bin_width = 0.1){

min <- min(data %>% select({{var}}))  
max <- max(data %>% select({{var}}))  
mean <- mean(data %>% select({{var}}), na.rm = TRUE)
median <- 30

#median(data %>% select({{var}}), na.rm = TRUE)
lower <- quantile(data %>% select({{var}}), probs = 0.25, na.rm = FALSE)
upper <- quantile(data %>% select({{var}}), probs = 0.75, na.rm = FALSE)

  data %>% 
    ggplot(aes({{var}})) +
    geom_histogram(binwidth = bin_width, alpha = 0.4) +
    scale_x_continuous(limits = c(min,max), 
                       breaks= c(min, lower, mean, median, upper, max),
                       guide = guide_axis(n.dodge = 2)) +
    theme_minimal()
  
}


breaks <- data02 %>% 
  select(bmi) %>% 
  summarise(mean = mean(bmi, na.rm = TRUE),
            min = min(bmi),
            max = max(bmi),
            lower = quantile(bmi, probs = 0.25, na.rm = FALSE),
            upper = quantile(bmi, probs = 0.75, na.rm = FALSE)) 
breaks

plot_hist(data02, bmi)
