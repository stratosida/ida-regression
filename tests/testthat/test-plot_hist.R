library(tidyverse)
library(patchwork)

load(here::here("data", "crash2.rda"))
hist(crash2$age)
table(crash2$age)


crash2 %>% glimpse()


ida_plot_hist(crash2, age, bin_width = 1)


hist(crash2$gcs)

breaks <- dplyr::summarise(crash2, 
                           mean = mean(age, na.rm = TRUE),
                           median = median(age, na.rm = TRUE),
                           min = min(age, na.rm = TRUE),
                           max = max(age, na.rm = TRUE),
                           Q1 = quantile(age, probs = 0.25, na.rm = TRUE),
                           Q3 = quantile(age, probs = 0.75, na.rm = TRUE)) 





five_num_sum <- calc_desc_summary(crash2, age)

dat <-
  five_num_sum %>%
  pivot_longer(everything(),
               names_to = "var",
               values_to = "val")

p <- dat %>%
  ggplot(aes(y = val, x = 1, label = var)) +
  geom_point(color = "brickred") +
  geom_jitter(data = crash2, aes(y = age, x = 1, label = NULL), alpha = 0.1, width = 0.01) + 
  theme(
    axis.line.x  = element_blank(),
    axis.ticks.x = element_blank(),
    axis.text.x  = element_blank(),
    axis.title.x = element_blank()
  )

p1 <- p +
  xlim(0.6, 1.4) +
  geom_text_repel(
    force        = 0.5,
    nudge_x      = 0.15,
    direction    = "x",
    hjust        = 0,
    segment.size = 0.2
  ) +
  ggtitle("hjust = 0")

p1

p1 + coord_flip()



#####
StatDensityCommon <- ggproto("StatDensity2", Stat, 
                             required_aes = "x",
                             default_aes = aes(y = stat(density)),
                             
                             compute_group = function(data, scales, bandwidth = 1) {
                               d <- density(data$x, bw = bandwidth)
                               data.frame(x = d$x, density = d$y)
                             }  
)

ggplot(mpg, aes(displ, drv, colour = stat(density))) + 
  stat_density_common(bandwidth = 1, geom = "point")


crash2 %>%
  select(age, sbp , cc, hr, rr) %>%
  mutate(
    age = as.numeric(age),
    sbp = as.numeric(sbp),
    rr = as.numeric(rr),
    cc = as.numeric(cc),
    hr = as.numeric(hr)
  ) %>%
  tidyr::pivot_longer(dplyr::everything(),
                      names_to = "var",
                      values_to = "value") %>%
  ggplot(aes(value)) + 
  geom_histogram(binwidth = 1) +
  geom_rug() +
#  scale_x_continuous(limit=c(min(crash2$value, na.rm = TRUE), max(crash2$value,na.rm = TRUE)), 
#                     breaks=round(fivenum(crash2$value,na.rm = TRUE),1)) +  
  facet_wrap(~ var, scales = "free", ncol = 2)




crash3 <- Hmisc::upData(crash2,
               labels = c(age = 'Age [years]'),
               units = c(age = "years"))


crash3 %>%
  select(age, sbp , cc, hr, rr) %>%
  mutate(
    age = as.numeric(age),
    sbp = as.numeric(sbp),
    rr = as.numeric(rr),
    cc = as.numeric(cc),
    hr = as.numeric(hr)
  ) %>%
  tidyr::pivot_longer(dplyr::everything(),
                      names_to = "var",
                      values_to = "value") %>%
  ggplot(aes(value)) + 
  geom_histogram(binwidth = 1) +
  geom_rug() +
  #  scale_x_continuous(limit=c(min(crash2$value, na.rm = TRUE), max(crash2$value,na.rm = TRUE)), 
  #                     breaks=round(fivenum(crash2$value,na.rm = TRUE),1)) +  
  facet_wrap(~ var, scales = "free", ncol = 2)



label(crash3$age)
units(crash3$age)



