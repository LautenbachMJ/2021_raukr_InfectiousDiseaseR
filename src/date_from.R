
#' Converts columns with dates from character to class Date
#'
#' @param x A tibble with columns containing the string "date" that will get converted to class Date.
#' @param formats the format in which the dates are, eg "%Y-%m-%d" etc.
#'
#' @return return same tibble with columns containing dates coverted to dates
#' @export
#'
#' @examples
#' date_form(df, "%Y-%m-%d")
date_from <- function(x, formats){
  x %>% mutate(across(matches("date"),as.Date, formats))
} 
