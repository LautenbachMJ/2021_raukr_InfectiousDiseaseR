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
visits_number <- function(input, patient_id, visit_date){
  input %>% group_by(patient_id) %>% 
    arrange(vis_date) %>% 
    subset(input_param1 != "NA"  | input_param2 != "NA" | input_param3 != "NA" ) %>% 
    mutate(visit = 1:n())}
