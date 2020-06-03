library(tidyverse)
library(patchwork)





plot_hist <- function(data, var, bin_width = 0.1){

breaks <- dplyr::summarise(data, 
            mean = mean({{var}}, na.rm = TRUE),
            median = median({{var}}, na.rm = TRUE),
            min = min({{var}}),
            max = max({{var}}),
            lower = quantile({{var}}, probs = 0.25, na.rm = TRUE),
            upper = quantile({{var}}, probs = 0.75, na.rm = TRUE)
            )

p1 <- ggplot(data, aes({{var}})) +
    geom_histogram(binwidth = bin_width, alpha = 0.4) +
   # geom_histogram(binwidth = function(x) 2 * IQR(x) / (length(x)^(1/3))) +
    scale_x_continuous(limits = c(breaks$min, breaks$max), 
                       breaks = c(breaks$min, breaks$mean, breaks$median, breaks$max),
                       guide = guide_axis(n.dodge = 2)) +
    theme_minimal()


p2 <- data %>% ggplot(aes(x = {{var}}, y = factor(1))) + 
  geom_boxplot() + 
  geom_rug() +
 # geom_point() +
  theme_minimal()

  
  
  layout <- c(
    area(1, 1, 1, 3),
    area(2, 1, 4, 3)
  )

gg <- p2 / p1 + patchwork::plot_layout(design = layout)


  
    return(gg)
}

plot_hist(data02, bmi)

crash2 %>% glimpse()
plot_hist(crash2, cc)


b <- data02 %>% ggplot(aes(x = bmi, y = "BMI")) + 
  geom_boxplot() + 
  geom_point() +
  theme_minimal()


library(patchwork)
a / b




layout <- c(
  area(1, 1, 2, 3),
  area(3, 1, 3, 3)
)

plot(layout)
a / b + plot_layout(design = layout)


test <- function(data, var){
  a<-data[,var]
  b<-median(a)
  return(b)
}

test(data02, bmi)

breaks <- data02 %>% 
  select(bmi) %>% 
  summarise(mean = mean(bmi, na.rm = TRUE),
            median = median(bmi, na.rm = TRUE),
            min = min(bmi),
            max = max(bmi),
            lower = quantile(bmi, probs = 0.25, na.rm = FALSE),
            upper = quantile(bmi, probs = 0.75, na.rm = FALSE)) %>%
  mutate(id = "bmi")

a <- breaks$median

breaks
breaks2 <- breaks %>% 
  tidyr::pivot_longer(-id, names_to = var, values_to = val)

mean <- median(data02$bmi, na.rm = TRUE)
mean



a <- data02 %>% select(bmi)
a
b <- as.numeric(a$bmi)
median(a$bmi)
median(b)
