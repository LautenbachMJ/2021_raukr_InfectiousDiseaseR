#Predicted values # smoothing spline regression

#' smoothing spline regression #join predicted values to the original dataframe
#'
#' @param data 
#' @param param1 
#' @param days_po 
#'
#' @return
#' @export
#' @import broom
#' @import magrittr
#' @import dplyr
#' @examples
#' 
spl.fun <- function(data,param1,days_po){
  data %>% filter(!is.na((.)[param1]))%>%
    dplyr::bind_cols (
      data %>% filter(!is.na((.)[param1]))%$% 
        broom::smooth.spline(days_po, viral_load) %>%
        broom::augment()
    )
}