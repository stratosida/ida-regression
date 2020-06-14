#TODO: set up meta data

ida_plot_hist <- function(data, var, bin_width = 0.1){
  
  breaks <- dplyr::summarise(data, 
                             mean = mean({{var}}, na.rm = TRUE),
                             median = median({{var}}, na.rm = TRUE),
                             min = min({{var}}, na.rm = TRUE),
                             max = max({{var}}, na.rm = TRUE),
                             lower = quantile({{var}}, probs = 0.25, na.rm = TRUE),
                             upper = quantile({{var}}, probs = 0.75, na.rm = TRUE)) 
  
  lim_labels <- breaks %>%
    tidyr::pivot_longer(dplyr::everything(),
                 names_to = "var",
                 values_to = "val")
  
  p1 <- ggplot(data, aes(x = {{var}})) +
    geom_histogram(binwidth = bin_width, alpha = 0.7) +
    # geom_histogram(binwidth = function(x) 2 * IQR(x) / (length(x)^(1/3))) +
    scale_x_continuous(limits = c(breaks$min, breaks$max), 
                       #                       breaks = c(breaks$min, breaks$mean, breaks$median, breaks$max),
                       #                       guide = guide_axis(n.dodge = 2)
    ) +
    geom_rug() +
    ggplot2::theme_minimal() +
    theme(
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(), 
      axis.title = element_blank(),
      axis.text = element_blank()
    )
  
  
  p2 <- data %>% 
    ggplot(aes(x = {{var}}, y = factor(1))) + 
    geom_boxplot() +
    scale_x_continuous(
      limits = c(breaks$min, breaks$max), 
      breaks = c(breaks$min, breaks$mean, breaks$median, breaks$max),
      guide = guide_axis(n.dodge = 2)
    ) +
    ggplot2::theme_minimal()  
  
  ## TODO: specify depenencies
  layout <- c(
    area(1, 1, 4, 3),
    area(5, 1, 5, 3)
  )
  
  gg <- p1 / p2 + 
    patchwork::plot_layout(design = layout) +
    ggplot2::theme_minimal() +
    theme(
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(), 
      axis.title = element_blank(),
      axis.text = element_blank()
    )
  
  
  
  return(gg)
}



cacl_breaks <- function(data, var){
  breaks <- dplyr::summarise(data, 
                             mean = mean({{var}}, na.rm = TRUE),
                             median = median({{var}}, na.rm = TRUE),
                             min = min({{var}}, na.rm = TRUE),
                             max = max({{var}}, na.rm = TRUE),
                             lower = quantile({{var}}, probs = 0.25, na.rm = TRUE),
                             upper = quantile({{var}}, probs = 0.75, na.rm = TRUE)) 
  
  return(breaks)
}



