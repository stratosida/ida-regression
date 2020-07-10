library(naniar)

vis_miss(crash2)

crash2 %>%
  select(sex, age, sbp, hr, gcs) %>%
  gg_miss_upset()

  vis_miss()

  
crash2 %>%
    select(sex, age, sbp, hr, gcs) %>%
  gg_miss_var()

crash2 %>%
  select(sex, age, sbp, hr, gcs) %>%
  gg_miss_var(show_pct = TRUE, facet = sex)



crash2 %>%
  select(sex, age, sbp, hr, gcs)

dist_matrix <- correlate(crash2 %>% select(age, sbp, hr, gcs ) , quiet = TRUE) %>%
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



crash2 %>%
  select(sex, age, sbp, hr, gcs) %>%
  gg_miss_case(order_cases = TRUE)

crash2 %>%
  select(sex, age, sbp, hr, gcs) %>%
  gg_miss_fct(fct = sex)


library(DataExplorer)

crash2 %>%
  select(sex, age, sbp, hr, gcs) %>%
  DataExplorer::plot_str()

library(inspectdf)
crash2 %>% inspectdf::inspect_cat() %>%
  show_plot()

inspect_num(crash2, breaks = 10) %>%
  show_plot()
