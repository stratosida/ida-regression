#TODO: set up meta data

#' Title
#'
#' @param data
#' @param var
#' @param bin_width
#'
#' @return
#' @export
#'
#' @examples
ida_plot_hist <- function(data, var, bin_width = 0.1) {

  
  breaks <- dplyr::summarise(data, 
                             mean = mean({{var}}, na.rm = TRUE),
                             median = median({{var}}, na.rm = TRUE),
                             min = min({{var}}, na.rm = TRUE),
                             max = max({{var}}, na.rm = TRUE),
                             Q1 = as.numeric(quantile({{var}}, probs = 0.25, na.rm = TRUE)),
                             Q3 = as.numeric(quantile({{var}}, probs = 0.75, na.rm = TRUE))) 
  
  
  
    p1 <- ggplot(data, aes(x = {
    {
      var
    }
  })) +
    geom_histogram(binwidth = bin_width, alpha = 0.7) +
    # geom_histogram(binwidth = function(x) 2 * IQR(x) / (length(x)^(1/3))) +
#        scale_x_continuous(
          #limits = c(breaks$min, breaks$max),
#                           breaks = c(breaks$min, breaks$Q1, breaks$mean, breaks$median, breaks$Q3, breaks$max),
#                           guide = guide_axis(n.dodge = 2)) +
   # coord_cartesian(xlim = c(c(breaks$min, breaks$max))) + #, clip = "on") + 
  geom_rug() +
  ggplot2::theme_minimal()
#  +
#    theme(
#      panel.grid.major = element_blank(),
#      panel.grid.minor = element_blank(),
#      axis.title = element_blank(),
#      axis.text = element_blank()
#   )


p2 <- data %>%
  ggplot(aes(x = {{var}}, y = factor(1))) +
  geom_jitter(alpha = 0.2, colour = "firebrick") +
  #  geom_boxplot() +
  #    scale_x_continuous(
  #      limits = c(breaks$min, breaks$max)
  #      ,
  #      breaks = c(breaks$min, breaks$mean, breaks$median, breaks$max),
  #      guide = guide_axis(n.dodge = 2)
  #    ) +
  ggplot2::theme_minimal()

p3 <- data %>%
  ggplot(aes(x = {{var}}, y = factor(1))) +
  #    geom_jitter(alpha = 0.2, colour = "red") +
  geom_boxplot() +
  scale_x_continuous(
    #limits = c(breaks$min, breaks$max),
    breaks = c(round(breaks$min), round(breaks$Q1), round(breaks$mean), round(breaks$median), round(breaks$Q3), round(breaks$max)),
    guide = guide_axis(n.dodge = 2)) +
  ggplot2::theme_minimal()


layout <- c(
  patchwork::area(1, 1, 1, 3),
  patchwork::area(2, 1, 5, 3),
  patchwork::area(6, 1, 6, 3)
)

gg <- p2 / p1 / p3 +
  patchwork::plot_layout(design = layout)


return(gg)
}

#    scale_x_continuous(
#      limits = c(breaks$min, breaks$max)
#      ,
#      breaks = c(breaks$min, breaks$mean, breaks$median, breaks$max),
#      guide = guide_axis(n.dodge = 2)
#    ) +

#+
#  ggplot2::theme_minimal() +
#  theme(
#    panel.grid.major = element_blank(),
#    panel.grid.minor = element_blank(),
#    axis.title = element_blank(),
#    axis.text = element_blank()
#  )






#' Title
#'
#' Calculate 5 number summary in wide format
#'
#' @param data 
#' @param var 
#'
#' @return
#' @export
#'
#' @examples
calc_desc_summary <- function(data, var){
  breaks <- dplyr::summarise(data, 
                             min = min({{var}}, na.rm = TRUE),
                             Q1 = quantile({{var}}, 0.25, na.rm = TRUE),
                             mean = mean({{var}}, na.rm = TRUE),
                             median = median({{var}}, na.rm = TRUE),
                             Q3 = quantile({{var}}, 0.75, na.rm = TRUE),
                             max = max({{var}}, na.rm = TRUE)
  ) 
  
  return(tibble::as_tibble(breaks))
}



#' Title
#'
#' Calculate 5 number summary in wide format
#'
#' @param data 
#' @param var 
#'
#' @return
#' @export
#'
#' @examples
calc_summary_long <- function(data, var){
  breaks <- dplyr::summarise(data, 
                             min = min({{var}}, na.rm = TRUE),
                             Q1 = quantile({{var}}, 0.25, na.rm = TRUE),
                             mean = mean({{var}}, na.rm = TRUE),
                             median = median({{var}}, na.rm = TRUE),
                             Q3 = quantile({{var}}, 0.75, na.rm = TRUE),
                             max = max({{var}}, na.rm = TRUE)
  ) %>%
    tidyr::pivot_longer(dplyr::everything(),
                        names_to = "var",
                        values_to = "value")
  
  
  return(tibble::as_tibble(breaks))
}




