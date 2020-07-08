ida_plot_all <- function(data, var, n.dodge = 1) {
  
  ## summary statistics
  nmiss <- data %>% filter(is.na(.data[[var]])) %>% tally()
  bign <- data %>% filter(!is.na(.data[[var]])) %>% tally()
  
  # for calculating five number summary
  x <- as.numeric(data[[var]])
  
  # title for plot
  title <-
    paste0("Univariate summary of ", label(data[[var]]), " [", units(data[[var]]), "]")
  
  y_axis <- "Number of subjects"
  x_axis <- paste0(label(data[[var]]), " [", units(data[[var]]), "]")
  
  caption <-
    paste0(
      "All observed values, the distribution and the, min, max and interquartile range are reported\n",
      "n = ",
      bign,
      " subjects displayed. ",
      nmiss,
      " subjects with missing values are not presented."
    )
  
  
  p2 <-
    data %>%
    filter(!is.na(.data[[var]])) %>%
    ggplot2::ggplot(aes(as.numeric(.data[[var]]))) +
    geom_histogram(
      binwidth = 1,
      center = 0,
      alpha = 0.6,
      fill = "firebrick2"
    ) +
    geom_rug() +
   scale_x_continuous(limit = c(min(x), max(x)),
                       breaks = round(fivenum(x), 1),
                      guide = guide_axis(n.dodge = n.dodge)) +
    ylab(y_axis) +
    ggplot2::theme_minimal() +
    theme(
      #axis.title.y = element_text(angle = 0),
      #    panel.grid.major.y = element_blank(),
      panel.grid.major.x = element_line(colour = "grey", size = 0.5),
      panel.grid.minor = element_blank(),
      axis.title.x = element_blank()
      #    axis.text.x = element_blank()
    )
  

  p1 <-
    data %>%
    filter(!is.na(.data[[var]])) %>%
    ggplot(aes(x = as.numeric(.data[[var]]), y = 0)) +
    geom_jitter(
      width = 0.1,
      height = 0.1,
      alpha = 0.2,
      color = "firebrick2"
    ) +
    geom_rug(sides = "b") +
    scale_x_continuous(limit = c(min(x), max(x)),
                       breaks = round(fivenum(x), 1)) +
    ggplot2::theme_minimal() +
    ylab(y_axis) +
    theme(
      panel.grid.major.y = element_blank(),
      panel.grid.minor = element_blank(),
      axis.title = element_blank(),
      axis.text = element_blank()
    )
  


  p3 <-
    data %>%
    filter(!is.na(.data[[var]])) %>%
    ggplot(aes(x = as.numeric(.data[[var]]), y = 0)) +
    geom_boxplot(outlier.shape = NA, width = 0.1) +
    scale_x_continuous(limit = c(min(x), max(x)),
                       breaks = c(round(fivenum(x), 1))) +
    xlab(x_axis) +
    ggplot2::theme_minimal() +
    theme(
      panel.grid.major.y = element_blank(),
      panel.grid.minor = element_blank(),
      axis.title.y = element_blank(),
      axis.text = element_blank()
    )
      
  layout <- c(patchwork::area(1, 1, 1, 6),
              patchwork::area(2, 1, 5, 6),
              patchwork::area(6, 1, 6, 6))
  
  gg <- p1 / p2 / p3 +
    patchwork::plot_layout(design = layout) +
    patchwork::plot_annotation(title = title,
                               caption = caption)
  
  return(gg)
  
}
