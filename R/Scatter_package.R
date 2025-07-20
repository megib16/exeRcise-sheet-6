#' Create a scatter plot with optional color and shape aesthetics
#'
#' This function creates a customizable scatter plot using ggplot2.
#'
#' @param data A data frame containing the data to plot.
#' @param x_param The variable for the x-axis.
#' @param y_param The variable for the y-axis.
#' @param color_var An optional variable to color the points.
#' @param shape_var An optional variable to adjust the shape of the points.
#' @param title The title of the plot.
#' @param x_label A custom label for the x-axis.
#' @param y_label A custom label for the y-axis.
#'
#' @return A ggplot object representing the scatter plot.
#'
#' @examples
#' data(mtcars)
#' create_scatter_plot(mtcars, "mpg", "hp", color_var = "cyl", shape_var = "gear")
#'
#' @import ggplot2
#' @export

create_scatter_plot <- function(data,
                                x_param,
                                y_param,
                                color_var = NULL,
                                shape_var = NULL,
                                title = "Scatter Plot",
                                x_label = NULL,
                                y_label = NULL)
{
  if (!is.null(shape_var) && !is.factor(data[[shape_var]])) {
    data[[shape_var]] <- as.factor(data[[shape_var]])
  }

  p <- ggplot(data,
              aes_string(x = x_param,
                         y = y_param,
                         color = color_var,
                         shape = shape_var)
  ) +
    geom_point(size = 3) +
    ggtitle(title) +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5))
  if (!is.null(x_label)) {
    p <- p + xlab(x_label)
  }

  if (!is.null(y_label)) {
    p <- p + ylab(y_label)
  }

  return(p)
}

