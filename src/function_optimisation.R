library(tidyverse)
library(lubridate)
library(rlang)


input_data <- read_delim("data/input_data.csv", delim = ";")
input_data <- read.csv2("data/input_data.csv", stringsAsFactors = FALSE)
input_data_tb <- as.tibble(input_data)


date_form <- function(x, formats){
  x %>% mutate(across(matches("date"),as.Date, formats))
} 

input_data_tb <- date_form(input_data_tb, "%Y-%m-%d")



  
time_between_mg_edit <- function(input, on_date, vis_date, treat_date){
  if(is.Date(input[[treat_date]])==FALSE ||is.Date(input[[vis_date]])==FALSE ||is.Date(input[[on_date]])==FALSE){
    stop("No dates detected, check if class is correct")
  } else {
    input %>% 
      mutate(
        days_po ={{vis_date}} - {{on_date}}, 
        days_pt ={{vis_date}} - {{treat_date}}, 
        days_pt = replace(days_pt, days_pt<=0, NA),
        art_status = ifelse(is.na(days_pt), "no", "yes"),
      ) 
  }
}


input <- input_data_tb
on_date <- sym("onset_date")
vis_date <- sym("visit_date")
treat_date <- sym("treatment_date")

input %>% 
  mutate(
    days_po ={{vis_date}} - {{on_date}}, 
    days_pt ={{vis_date}} - {{treat_date}}, 
    days_pt = replace(days_pt, days_pt<=0, NA),
    art_status = ifelse(is.na(days_pt), "no", "yes"),
  ) 

time_between_mg_edit(input_data_tb, onset_date ,visit_date , treatment_date)



time_between <- function(input, on_date, vis_date, treat_date){
  if(is.Date(input[[treat_date]])==FALSE ||is.Date(input[[vis_date]])==FALSE ||is.Date(input[[on_date]])==FALSE){
    stop("No dates detected, check if class is correct")
  } else {
    input %>% 
      mutate(
        days_po =.[[vis_date]] - .[[on_date]], 
        days_pt =.[[vis_date]] - .[[treat_date]],
        days_pt = replace(days_pt,days_pt<=0, NA),
        art_status = ifelse(is.na(days_pt), "no", "yes"),
      )
  }
}

input_data_tb_calc <- time_between(input_data_tb, "onset_date" ,"visit_date" , "treatment_date")


write.csv(input_data_tb_calc, "data/output_file.csv", row.names = FALSE)

