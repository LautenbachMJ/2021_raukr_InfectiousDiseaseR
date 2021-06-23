#' Function to parse parameters from input file
#'
#' @param input_data 
#' @param input_param1 
#' @param input_param2 
#' @param input_param3 
#'
#' @return
#' @export
#'
#' @examples
param_parsing <- function(input_data, input_param1, input_param2, input_param3){
  param1 <- input_param1
    param2 <- input_param2
    param3 <- input_param3
  mapping <- c(param1 = {{input_param1}}, param2 = {{input_param2}}, param3 = {{input_param3}})
  mapping
}

#param_parsing(input_data, input_param1 = "cd4", input_param2 = "cd8", input_param3 = "viral_load")