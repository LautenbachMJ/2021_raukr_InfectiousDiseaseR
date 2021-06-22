#' Takes columns of dates and calculates number of days between these dates.
#'
#' @param input file containing columns of type Date and calculates number of days between the dates
#' @param on_date column with date for disease onset
#' @param vis_date column with date for visits
#' @param treat_date column with date for start of treatment
#'
#' @return
#' @export
#' @import tidyverse
#' @examples
time_between <- function(input, on_date, vis_date, treat_date){
  if(is.Date(input[[treat_date]])==FALSE ||is.Date(input[[vis_date]])==FALSE ||is.Date(input[[on_date]])==FALSE){
    stop("No dates detected, check if class is correct")
  } else {
    input_calc <- input %>% 
      mutate(days_po =.[[vis_date]] - .[[on_date]])
    input_calc <- input_calc %>% 
      mutate(days_pt =.[[vis_date]] - .[[treat_date]])
    input_calc <- input_calc %>% 
      mutate(days_pt = replace(days_pt,days_pt<=0, NA))
  }
  
  return(input_calc)
}
