#' visits number
#'
#' @param input the global study tibble with all raw data
#' @param PatientID column with the identification number for each patient
#' @param vis_date  column with dates for visits
#'
#'
#' @return Colum named visits with the visits number that row corresponds per patient
#' @export
#' @import tidyverse
#'
#' @examples
visit_number <- function(input, PatientID, vis_date){
  input %>% group_by(PatientID) %>% 
    arrange(vis_date) %>% 
    subset(viral_load != "NA"  | cd4 != "NA" | cd8 != "NA" ) %>% 
    mutate(visit = 1:n())}