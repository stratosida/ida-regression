#satp   
#astp

library(ggalt)
library(viridis)


p1 <- data02 %>% 
  ggplot(aes(x = satp, y = astp)) + 
  geom_point(shape=16, size=0.5, show.legend = FALSE, alpha = 0.4) +
#  geom_rug() + 
  theme_minimal()


p2 <- data02 %>% 
  ggplot(aes(x = satp, y = astp)) + 
  geom_point(shape=16, size=0.5, show.legend = FALSE, alpha = 0.4) +
  stat_bkde2d(aes(fill=..level..), geom="polygon") +
  scale_fill_viridis() +
  #  geom_rug() + 
  theme_minimal()




p3 <- data02 %>% 
  ggplot(aes(x = satp, y = astp)) + 
  geom_point(shape=16, size=0.5, show.legend = FALSE, alpha = 0.4) +
  geom_bkde2d(bandwidth=c(0.5, 4)) +
  theme_minimal()




p1 + p2 

