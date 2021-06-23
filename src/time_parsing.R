#' Function to parse time/date columns from input file
#'
#' @param on_date 
#' @param vis_date 
#' @param treat_date 
#' @param input_data 
#'
#' @return
#' @export
#'
#' @examples
time_parsing <- function(input_data, on_date, vis_date, treat_date){

  time_mapping <- c(on_date = {{on_date}}, vis_date = {{vis_date}}, treat_date = {{treat_date}})
  time_mapping
}

#param_parsing(input_data, input_param1 = "cd4", input_param2 = "cd8", input_param3 = "viral_load")