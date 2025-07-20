#' Export a Pretty Table from a Data Frame
#'
#' @param df Data frame to export.
#' @param file Path to the output file.
#' @param format Output format: "html" or "markdown".
#' @return The file is written as a side effect.
#' @examples
#' export_pretty_table(mtcars, "mtcars.html", format = "html")
#' export_pretty_table(mtcars, "mtcars.md", format = "markdown")
#' @importFrom knitr kable
#' @importFrom kableExtra kable_styling
#' @importFrom magrittr %>%
#' @export
export_pretty_table <- function(df, file, format = "html") {
  if (!format %in% c("html", "markdown")) {
    stop('Format must be "html" or "markdown"')
  }

  if (format == "html") {
    tab <- knitr::kable(df, format = "html") %>%
      kableExtra::kable_styling(full_width = TRUE, bootstrap_options = c("striped", "hover", "condensed"))
    writeLines(as.character(tab), file)
  } else if (format == "markdown") {
    tab <- knitr::kable(df, format = "markdown")
    writeLines(as.character(tab), file)
  }
}
