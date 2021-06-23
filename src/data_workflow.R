# Script with workflow
library(tidyverse)
source("src/overview_plot.R")
source("src/param_parsing.R")

source("src/time_between.R")
source("src/date_from.R")
source("src/plot_param_per_day.R")
source("src/visits_number.R")

source("src/plot_per_param_patient.R")
source("src/plot_patient_treatmentStatus.R")
source("src/create_longerdf.R")
source("src/norm_distr_plot.R")
source("src/smoothing_spline_regression.R")
source("src/smooth_spline_plot.R")


#load input data
input_data <- read_delim("data/input_data.csv", delim = ";")

# extract parameter names
param_mapping <- param_parsing(input_data = input_data, input_param1 = "cd4", input_param2 = "cd8", input_param3 = "viral_load")
time_mapping <- time_parsing(input_data = input_data, on_date = "onset_date", vis_date = "visit_date", treat_date = "treatment_date")

## ============ 
## data wrangling
## ============ 
parsed_data <-
  input_data %>% 
  ## transform "_date" columns into date format
  date_from() %>% 
  ## mapping input variable names to function "under-the-hood" variables
  rename(time_mapping) %>% 
  rename(param_mapping) %>%
  ## calculate days between time points
  time_between(names(time_mapping)) %>% 
  ## calculate numbers of visits
  visits_number()
  

## ============ 
## downstream 
## ============ 
parsed_data %>% 
  ## plot cohort overview
  ## requires param1, param2, param3 variables
  overview_plot()
  visits_number(param_mapping = param_mapping)

##visits number
## requires param1, param2, param3 variables
input_data_calc_visit <- visits_number(input_data_calc)

## plot cohort overview
## requires param1, param2, param3 variables
overview_plot(parsed_data = data2, param_mapping = param_mapping)




## edditing input data: convert columns with dates character to date, 
## then calculates number of days between dates and adds column with 
## treatment status and finally visits number per pacient
input_data_ed <- param_parsing(input_data) %>% 
  time_between(on_date = "onset_date", vis_date = "visit_date", treat_date = "treatment_date") %>% 
  visits_number()

## plot
overview_plot(parsed_data = data2, param_mapping = param_mapping)

<<<<<<< HEAD
###------------------------added here

##plot parameter by patient
plot_fun(param1 = "viral_load", days_po = "days_po", patient_id = "PatientID", data = data )

## plot patient and the period on treatment 
plot_art(param1 = "viral_load", days_po = "days_po", patient_id = "PatientID", art_status = "art_status", data = data )

## Generate a dataframe used to check whether the parameters are normally distributed 
#and then plot to check distribution
longer_data<- create_longerdf(param1 = "viral_load", days_po = "days_po", patient_id = "PatientID", art_status = "art_status", data = data )
norm_distr_plot(value = "value", name = "name", patient_id = "PatientID", data = longer_data)

## Perform smoothing spline regression in tidy models and join predicted values to the original dataframe 
#plot the predicted values
spldata<-spl.fun(param1 = "viral_load", days_po = "days_po", data = data1)
spl.plot(spldata = spldata, param1 = "viral_load", days_po = "days_po", patient_id = "PatientID" )



=======
>>>>>>> 95fbe31b1e693110e63eb4af637b23a1f7024e9a
>>>>>>> 34f600c8368386913dd26ad979f117a1f887ffbd
## === Test of plot_param_per_day.R === ##

data3 <- read_csv("data/output_file.csv")
plot_param_per_day(data, y = cd4) + labs(col="Patient ID") + xlab("Days post onset") + ylab("CD4 levels")
plot_param_per_day(data, y = cd8) + labs(col="Patient ID") + xlab("Days post onset") + ylab("CD8 levels")
plot_param_per_day(data, y = viral_load) + labs(col="Patient ID") + xlab("Days post onset") + ylab("Viral load")

