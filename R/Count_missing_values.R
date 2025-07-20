#' Count Missing (NA) Values in Each Column
#'
#' @param df A data frame.
#' @return A data frame with the count of missing values per column.
#' @examples
#' count_missing(mtcars)
#' count_missing(airquality)
#' df <- data.frame(a = c(1, NA, 3), b = c(NA, NA, 3))
#' count_missing(df)
#' @export
count_missing <- function(df) {
  missing_counts <- sapply(df,
                           function(x) sum(is.na(x))
                           )
  data.frame(
    Variable = names(missing_counts),
    Missing = as.integer(missing_counts),
    row.names = NULL
  )
}
