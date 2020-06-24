

##################################################3
#  test plot
###################################################
library(patchwork)
x <- as.numeric(crash2$age)

p1 <-
  crash2 %>%
  ggplot2::ggplot(aes(age)) +
  geom_histogram(binwidth = 1, center = 0, alpha = 0.6) +
  geom_rug() +
  scale_x_continuous(limit=c(min(x), max(x)), 
                     breaks=round(fivenum(x),1)) +  
  ggplot2::theme_minimal()  +
   theme(
     panel.grid.major.y = element_blank(),
     panel.grid.major.x = element_line(colour = "grey", size = 1),
     panel.grid.minor = element_blank(),
     axis.title = element_blank(),
     axis.text.y = element_blank()
   )

p2 <- 
  crash2 %>%
  ggplot(aes(x = age, y = 0)) +
  geom_boxplot(outlier.shape = NA, width = 0.1) + 
  scale_x_continuous(limit=c(min(x), max(x)), 
                     breaks=round(fivenum(x),1)) +  
  ggplot2::theme_minimal() 
# +
#   theme(
#     panel.grid.major.y = element_blank(),
#     panel.grid.minor = element_blank(),
#     axis.title.y = element_blank(),
#     axis.text.y = element_blank()
#   )

p3 <- 
  crash2 %>%
  ggplot(aes(x = age, y = 0)) +
  geom_jitter(width = 0.1, height = 0.1, alpha = 0.4, colour = "gray") +
  geom_rug(sides="b") +
  scale_x_continuous(limit=c(min(x), max(x)), 
                     breaks=round(fivenum(x),1)) +  
  ggplot2::theme_minimal() +
  theme(
    panel.grid.major = element_blank(),
 #   panel.grid.major.x = element_line(colour = "grey", size = 1),
    panel.grid.minor = element_blank(),
    axis.title.x = element_blank(),
    axis.text.y = element_blank()
  )


# layout <- c(
#   patchwork::area(1, 1, 1, 3),
#   patchwork::area(2, 1, 5, 3),
#   patchwork::area(6, 1, 6, 3)
# )
# 
# gg <- p3 / p1 / p2 +
#   patchwork::plot_layout(design = layout)
# 
# gg

 layout <- c(
   patchwork::area(1, 1, 1, 5),
   patchwork::area(2, 1, 5, 5)
 )


p3 / p1 + patchwork::plot_layout(design = layout)

#### add info on missing data 


