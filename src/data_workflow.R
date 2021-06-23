# Script with workflow
library(tidyverse)
source("src/overview_plot.R")
source("src/param_parsing.R")
source("src/time_parsing.R")
source("src/time_between.R")
source("src/date_from.R")
source("src/plot_param_per_day.R")
source("src/visits_number.R")

#load input data
input_data <- read_delim("data/input_data.csv", delim = ";")

# extract parameter names
param_mapping <- param_parsing(input_data = input_data, input_param1 = "cd4", input_param2 = "cd8", input_param3 = "viral_load")
time_mapping <- time_parsing(input_data = input_data, on_date = "onset_date", vis_date = "visit_date", treat_date = "treatment_date")

#Convert columns with dates from Character to Date
input_data <- date_from(input_data) #format same as default "%Y-%m-%d"

#calculates number of days between dates and adds column with treatment status
date_cols <- time_mapping %>% names()

input_data %>% 
  date_from() %>% 
  rename(time_mapping) %>% 
  rename(param_mapping) %>% 
  time_between(date_cols) %>% 
  visits_number()
#input_data_calc <- time_between(input_data, on_date = "onset_date", vis_date = "visit_date", treat_date = "treatment_date" )

##visits number
## requires param1, param2, param3 variables
input_data_calc_visit <- visits_number(input_data_calc)

## plot cohort overview
## requires param1, param2, param3 variables
overview_plot(parsed_data = data2, param_mapping = param_mapping)



## === Test of plot_param_per_day.R === ##

data3 <- read_csv("data/output_file.csv")
plot_param_per_day(data, y = cd4) + labs(col="Patient ID") + xlab("Days post onset") + ylab("CD4 levels")
plot_param_per_day(data, y = cd8) + labs(col="Patient ID") + xlab("Days post onset") + ylab("CD8 levels")
plot_param_per_day(data, y = viral_load) + labs(col="Patient ID") + xlab("Days post onset") + ylab("Viral load")


## manual mapping
#param_mapping <- c("param1" = "CD4","param2" = "CD8","param3" = "Viral_load")
