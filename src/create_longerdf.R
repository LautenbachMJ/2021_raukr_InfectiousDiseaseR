
#' Generate a dataframe used to check whether the parameters are normally distributed
#'
#' @param param1 can be viral load, cd4
#' @param days_po 
#' @param patient_id 
#' @param art_status 
#' @param data 
#'
#' @return
#' @export
#' @import dplyr
#' @import tidyr
#'
#' @examples
create_longerdf <- function(data,param1, 
                            days_po,
                            patient_id, 
                            art_status){
  data %>% dplyr::filter(art_status == "yes")%>%
    dplyr::ungroup() %>%
    dplyr::select(patient_id, days_po, param1) %>%
    #mutate(log10vload=log10(param1), sqrtday=sqrt(days_po)) %>%
    tidyr::pivot_longer(!patient_id) %>%
    tidyr::mutate(name=factor(name, c("days_po", "param_1")))
  
}