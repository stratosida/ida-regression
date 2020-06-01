plot_hist <- function(data, var, bin_width = 0.1){

min <- min(data %>% select({{var}}))  
max <- max(data %>% select({{var}}))  
mean <- mean(data %>% select({{var}})) 

  data %>% 
    ggplot(aes({{var}})) +
    geom_histogram(binwidth = bin_width, alpha = 0.4) +
    scale_x_continuous(limits = c(min,mean, max), 
                       breaks= c(min, mean,max)) +
    theme_minimal()
  
}

plot_hist(data02, bmi)

