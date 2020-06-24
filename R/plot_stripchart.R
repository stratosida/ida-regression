library(ggrepel)
set.seed(42)


crash2, age
breaks <- data02 %>% 
  select(bmi) %>% 
  summarise(mean = mean(bmi, na.rm = TRUE),
            median = median(bmi, na.rm = TRUE),
            min = min(bmi),
            max = max(bmi),
            lower = quantile(bmi, probs = 0.25, na.rm = FALSE),
            upper = quantile(bmi, probs = 0.75, na.rm = FALSE)) %>%
  mutate(id = "bmi")

p <- ggplot(mtcars, aes(y = wt, x = 1, label = rownames(mtcars))) +
  geom_point(color = "red") +
  ylim(1, 5.5) +
  theme(
    axis.line.x  = element_blank(),
    axis.ticks.x = element_blank(),
    axis.text.x  = element_blank(),
    axis.title.x = element_blank()
  )

p1 <- p +
  xlim(1, 1.375) +
  geom_text_repel(
    force        = 0.5,
    nudge_x      = 0.15,
    direction    = "y",
    hjust        = 0,
    segment.size = 0.2
  ) +
  ggtitle("hjust = 0")

p2 <- p +
  xlim(1, 1.375) +
  geom_text_repel(
    force        = 0.5,
    nudge_x      = 0.2,
    direction    = "y",
    hjust        = 0.5,
    segment.size = 0.2
  ) +
  ggtitle("hjust = 0.5 (default)")

p3 <- p +
  xlim(0.25, 1) +
  scale_y_continuous(position = "right") +
  geom_text_repel(
    force        = 0.5,
    nudge_x      = -0.25,
    direction    = "y",
    hjust        = 1,
    segment.size = 0.2
  ) +
  ggtitle("hjust = 1")

gridExtra::grid.arrange(p1, p2, p3, ncol = 3)



breaks %>% glimpse()
dat <- breaks  %>%
  pivot_longer(cols = -id,
               names_to = "var",
               values_to = "val")

dat

p <- dat %>%
  ggplot(aes(y = val, x = 1, label = var)) +
  geom_point(color = "red") +
  geom_jitter(data = data02, aes(y = bmi, x = 1, label = NULL), alpha = 0.1, width = 0.01) + 
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

p1 + coord_flip()
