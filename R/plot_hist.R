library(tidyverse)
plot_hist <- function(data, var, bin_width = 0.1){

min <- min(data %>% select({{var}}))  
max <- max(data %>% select({{var}}))  

#mean <- data02 %>% 
#  select({{var}}) %>% 
#  summarise(mean({{var}})) 

mean <- 30
median <- 32

  data %>% 
    ggplot(aes({{var}})) +
    geom_histogram(binwidth = bin_width, alpha = 0.4) +
    scale_x_continuous(limits = c(min,max), 
                       breaks= c(min,median, mean, max),
                       guide = guide_axis(n.dodge = 2)) +
    theme_minimal()
  
}

plot_hist(data02, bmi)

