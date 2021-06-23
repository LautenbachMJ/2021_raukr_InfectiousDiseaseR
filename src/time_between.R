#' Takes columns of dates and calculates number of days between these dates. 
#'
#' @param input file containing columns of class Date 
#' @param on_date column name of column with dates for disease onset
#' @param vis_date column name of column with dates for visits
#' @param treat_date column name of column with dates for start of treatment
#'
#' @return Columns named days_po, days_pt and art_status with number of days from onset and start of treatment as well as treatment status
#' @export
#' @import tidyverse
#' @examples
time_between <- function(input, on_date, vis_date, treat_date){
  if(lubridate::is.Date(input[[treat_date]])==FALSE ||lubridate::is.Date(input[[vis_date]])==FALSE ||lubridate::is.Date(input[[on_date]])==FALSE){
    stop("No dates detected, check if class is correct")
  } else {
    input %>% 
      mutate(
        days_po =.[[vis_date]] - .[[on_date]], 
        days_pt =.[[vis_date]] - .[[treat_date]],
        days_pt = replace(days_pt,days_pt<=0, NA),
        art_status = ifelse(is.na(days_pt), "no", "yes"),
      )
  }
}
