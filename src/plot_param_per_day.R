#' Title
#'
#' @param data 
#' @param x 
#' @param y 
#' @param category 
#' @param treated 
#'
#' @return
#' @export
#'
#' @examples
#' plot_param_per_day(data, y = cd4) for example
plot_param_per_day <- function(data = data, x = days_po, y = param1, category = patient_id) 
{
  ggplot(data, aes({{x}}, {{y}}, group = {{category}}, color = as.factor({{category}}))) +
    geom_smooth(na.rm = TRUE, se = FALSE)
}
