library(readr)
library(here)
library(dplyr)
library(ggplot2)
library(tidyr)
library(Hmisc)
library(gtsummary)
library(ggforce)

data <- read_csv(here::here("data", "Bacteremia_public.csv"))

data %>% glimpse()

d <- describe(data)
d
plot(d)


data %>% skimr::skim()


data %>%
  gtsummary::tbl_summary() %>%
  add_n() %>%
  bold_labels() %>%
  as_gt()


## convert to long data format
#binwidth = 1
long_data <-
  data %>%
  pivot_longer(-c(ID, sex, BloodCulture), names_to = "variable", values_to = "value")
  

agg_data <-
  long_data %>%
  dplyr::group_by(variable) %>%
  dplyr::summarise(
    mean = mean(value, na.rm = T),
    median = median(value, na.rm = T),
    min = min(value, na.rm = T),
    max = min(value, na.rm = T), 
    nmiss = sum(is.na(value))
  )


  
agg_data %>% glimpse()
long_data %>% glimpse()

long_data %>%  
  ggplot(aes(value)) + 
  geom_histogram(bins = 50, alpha = 0.4) + 
  geom_vline(aes(xintercept = mean), data = agg_data, colour = "red") +
  facet_wrap(~variable, scales = "free") + 
  theme_minimal(base_size = 10) 
  

long_data %>%  
  ggplot(aes(value)) + 
  geom_histogram(bins = 50, alpha = 0.4) + 
  geom_vline(aes(xintercept = mean), data = agg_data, colour = "red") +
  facet_wrap(~variable, scales = "free") + 
  theme_minimal(base_size = 10) 


names(data)
data %>% glimpse()
ggplot(data) + geom_autopoint(aes(AP, ASAT))
data %>%
  filter(!is.na(AP) & !is.na(sex)) %>%
  ggplot() + 
  geom_autopoint(aes(AP, factor(sex)))

data %>%
  ggplot() +
  geom_autopoint() +
  facet_matrix(vars(c(MCHC, RDW, MPV, LYM , MONO)))


data %>%
  select(MCHC, RDW, MPV ) %>%
  filter(!is.na(MCHC) & !is.na(RDW) & !is.na(MPV)) %>%
  ggplot(aes(x = .panel_x, y = .panel_y)) + 
  geom_point(alpha = 0.2, shape = 16, size = 0.5) + 
  geom_autodensity() +
  geom_density2d() +
  facet_matrix(vars(everything()), layer.diag = 2, layer.upper = 3, 
               grid.y.diag = FALSE) + 
  theme_minimal(base_size = 10) 





library(corrr)
dist_matrix <- correlate(data %>% select(-sex, -ID, -BloodCulture ) , quiet = TRUE)

dist_matrix %>% 
  filter(PLT > .7)

dist_matrix %>%
  shave(upper = FALSE) %>% # Remove the upper triangle
  fashion() %>%  # Print in nice format 
  rplot()     # Plot


dist_matrix %>% 
  shave(upper = FALSE) %>%
  rplot(shape = 15)


dist_matrix %>% network_plot()



library(tidyverse)
library(corrr)
library(igraph)
library(ggraph)

dist_matrix <- correlate(data %>% select(-sex, -ID, -BloodCulture ) , quiet = TRUE) %>%
  stretch()


graph_cors <- dist_matrix %>% 
  filter(abs(r) > 0.6) %>% 
  graph_from_data_frame(directed = FALSE)


ggraph(graph_cors) +
  geom_edge_link() +
  geom_node_point() +
  geom_node_text(aes(label = name), repel = TRUE) +
  theme_graph()

ggraph(graph_cors) +
  geom_edge_link(aes(edge_alpha = abs(r), edge_width = abs(r), color = r)) +
  guides(edge_alpha = "none", edge_width = "none") +
  scale_edge_colour_gradientn(limits = c(-1, 1), colors = c("firebrick2", "dodgerblue2")) +
  geom_node_point(color = "white", size = 5) +
  geom_node_text(aes(label = name), repel = TRUE) +
  theme_graph() +
  labs(title = "Correlations between variables")


ggraph(graph_cors) +
  geom_edge_link(aes(edge_alpha = abs(r), edge_width = abs(r), color = r)) +
  guides(edge_alpha = "none", edge_width = "none") +
  scale_edge_colour_gradientn(limits = c(-1, 1), colors = c("firebrick2", "dodgerblue2")) +
  geom_node_point(color = "white", size = 5) +
  geom_node_text(aes(label = name), repel = TRUE) +
  theme_graph() +
  labs(title = "Correlations between variables")


