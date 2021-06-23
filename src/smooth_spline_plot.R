###plot the smoooth spline regression with the original values use the spl function to generate the dataframe needed
#' Title plot the predicted values with the original values use the spl function to generate the dataframe needed
#'
#' @param spldata dataframe with fitted values using the smoothing_spline_regression
#' @param param1 viral load
#' @param days_po 
#' @param patient_id 
#'
#' @return
#' @export
#' @import gglot2
#'
#' @examples
spl.plot <- function(spldata,param1,days_po,patient_id){
  spldata %>% ggplot2::ggplot (aes_string(x=days_po, y= param1)) + 
    geom_point() + 
    geom_line() + 
    facet_wrap(reformulate(patient_id))+
    theme_bw()
}