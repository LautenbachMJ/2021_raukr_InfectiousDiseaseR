#plot parameter by patient

#' plot_patient_parameter
#'
#' @param param1 can be viral load, CD4
#' @param days_po 
#' @param patient_id 
#' @param data 
#'
#' @return
#' @export plot_fun
#' @import ggplot2

#'
#' @examples
plot_fun <- function(data,param1,days_po,patient_id){
  data %>% ggplot2::ggplot (aes_string(x=days_po, y= param1)) + 
    geom_point() + 
    geom_line() + 
    facet_grid(reformulate(patient_id))+
    theme_bw()
}