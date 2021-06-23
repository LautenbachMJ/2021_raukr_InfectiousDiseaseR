
###plot check whether the parameter and sample collection days are normally distributed

# data is generated from function ==create_longerdf 

#' plot check whether the parameter and sample collection days are normally distributed
#'
#' @param value transposed from the param1 in the create_longerdf function
#' @param name  days_po and NA will be the parameter of interest
#' @param patient_id 
#' @param data 
#'
#' @return
#' @export
#' @import ggplot2
#'
#' @examples
norm_distr_plot <- function(data,value,name,patient_id) {
  
  data %>% ggplot2::ggplot (aes_string(x=value, fill=patient_id)) + 
    geom_histogram(bin=30) + 
    facet_wrap(reformulate(name), scales = "free")+
    theme_bw()+
    theme(legend.position = "none")
  
}