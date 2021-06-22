## Function to plot overview figure
#' Title
#'
#' @param parsed_data 
#' @param param_mapping 
#'
#' @return cohort overview plot (ggplot object)
#' @export
#'
#' @examples
overview_plot <- function(parsed_data, param_mapping) {
  
  require(tidyverse)
  require(RColorBrewer)
  ## plot
  parsed_data %>% 
    ggplot2::ggplot() +
    coord_flip() +
    ## plot time included in study after symptom onset
    geom_linerange(data = .%>% group_by(patient_id) %>% slice_max(days_po), aes(x = patient_id, ymin = 0, ymax = days_po), color="green",shape=4, alpha = .2, size=2) +
    ## plot visit time points
    geom_point(aes(x = patient_id, y = days_po, col=visit), col="grey50",alpha = .3, size=1.5) + 
    ## plot start of treatment
    geom_point(data = .%>% filter(days_pt == 0), aes(x=patient_id, y = days_po, col=visit), col = "blue", size = 3, shape=8) +
    ## plot last available sample post treatment
    geom_point(data = . %>% group_by(patient_id) %>% slice_max(days_pt), aes(x = patient_id, y= days_po-days_pt), color="red", alpha = .9, size=3) +
    geom_hline(yintercept = 0) +
    # mark visits with available parameter
    geom_point(data = . %>% gather(parameter, value, param1:param3) %>% na.omit(value), aes(x=patient_id, y=days_po, fill=parameter), 
               shape=23, size = 3,position = position_jitterdodge(jitter.width = 0.02)) +
    scale_fill_manual(values= c(RColorBrewer::brewer.pal(length(unique(3)),"PiYG")), name = "Experimental parameters", labels = param_mapping) +
    facet_grid(site ~ ., 
               scales = "free",
               space = "free") +
    theme(text = element_text(size=20),
          strip.text.y = element_text(angle = 0),
          axis.title.y = element_blank(),
         # axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          axis.text.x  = element_blank(),
          axis.ticks.x = element_blank(),
          legend.position="bottom",
          panel.background = element_rect(fill = "white", colour = "grey50")) +
    labs(title = "Cohort overview",
         subtitle = paste0('# of patients included: ',length(unique(parsed_data$patient_id))),
         y = "Time",
         color = "") +
    guides(colour = guide_legend(nrow = 1))
}



