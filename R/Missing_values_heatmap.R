#' Plot a Heatmap of Missing Data
#'
#' Visualizes the pattern of missing data in a data frame.
#'
#' @param df A data frame.
#' @return A ggplot object showing a heatmap of missingness.
#' @examples
#' plot_missing_heatmap(airquality)
#' @import ggplot2
#' @importFrom tidyr pivot_longer
#' @export
plot_missing_heatmap <- function(df) {
  df$row <- seq_len(nrow(df))
  long <- tidyr::pivot_longer(df,
                              -row,
                              names_to = "variable",
                              values_to = "value")

  long$missing <- is.na(long$value)

  ggplot(long, aes(x = variable,
                   y = row,
                   fill = missing)
         ) +
    geom_raster() +
    scale_fill_manual(values = c("#FFFFEC",
                                 "red"),
                      labels = c("Present",
                                 "Missing")) +
    labs(x = "Variable",
         y = "Row",
         fill = "Missing data?",
         title = "Missing Data Heatmap") +

    theme_minimal() +
    theme(axis.text.y = element_blank(),
          axis.ticks.y = element_blank())
}
