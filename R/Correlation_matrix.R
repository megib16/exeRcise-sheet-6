#' Plot a Correlation Matrix Heatmap
#'
#' Computes and visualizes the correlation matrix of numeric variables in a data frame.
#'
#' @param data A data frame containing the variables.
#' @param method Correlation coefficient method: one of "pearson" (default), "spearman", or "kendall".
#' @param title The title for the plot.
#'
#' @return A ggplot2 heatmap showing correlations.
#'
#' @examples
#' data(mtcars)
#' correlation_matrix_plot(mtcars, method = "pearson")
#'
#' @import ggplot2
#' @importFrom reshape2 melt
correlation_matrix_plot <- function(data, method = "pearson", title = "Correlation Matrix") {

  num_data <- data[sapply(data, is.numeric)] # In order to select only numericc data

  corr_mat <- cor(num_data, use = "pairwise.complete.obs", method = method)

  corr_melt <- reshape2::melt(corr_mat)

  ggplot(corr_melt, aes(Var1, Var2, fill = value)) +
    geom_tile(color = "white") +
    scale_fill_gradient2(
      low = "blue", high = "red", mid = "beige",
      midpoint = 0, limit = c(-1,1), space = "Lab",
      name = "Correlation"
    ) +
    theme_minimal() +
    ggtitle(title) +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
}
