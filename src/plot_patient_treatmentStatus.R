#' plot_patient_treatmentStatus
#'
#' @param param1 can be viral load, CD4, CD8
#' @param days_po 
#' @param patient_id 
#' @param art_status 
#' @param data 
#'
#' @return
#' @export
#' @import ggplot2
#'
#' @examples
plot_art <- function(data,param1, days_po, patient_id, art_status){
  data %>% ggplot2::ggplot (aes_string(x=days_po, y= param1, color = art_status)) + 
    geom_point() + 
    geom_line() + 
    facet_grid(reformulate(patient_id))+
    theme_bw()
}