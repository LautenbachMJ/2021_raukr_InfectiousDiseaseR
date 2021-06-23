# Script with workflow
library(tidyverse)
source("src/overview_plot.R")
source("src/param_parsing.R")
source("src/time_parsing.R")
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
#input_data_calc_visit <- visits_number(input_data_calc)

## plot cohort overview
## requires param1, param2, param3 variables
overview_plot(parsed_data = parsed_data, param_mapping = param_mapping)

<<<<<<< HEAD


=======
param_mapping <- param_parsing(input_data = input_data,  input_param1 = "cd4", input_param2 = "cd8", input_param3 = "viral_load")
>>>>>>> 4b71acaf1a505f35bb129888fd998431eed24926

## edditing input data: convert columns with dates character to date, 
## then calculates number of days between dates and adds column with 
## treatment status and finally visits number per pacient
input_data_ed <- param_parsing(input_data) %>% 
  time_between(on_date = "onset_date", vis_date = "visit_date", treat_date = "treatment_date") %>% 
  visits_number()

param_mapping <- param_parsing(input_data = input_data, input_param1 = "cd4", input_param2 = "cd8", input_param3 = "viral_load")
time_mapping <- time_parsing(input_data = input_data, on_date = "onset_date", vis_date = "visit_date", treat_date = "treatment_date")

param_mapping <- param_parsing(input_data = input_data,input_param1 = "cd4", input_param2 = "cd8", input_param3 = "viral_load")

View(input_data)

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

##input_data_ed
input_data_ed <- param_parsing(input_data) %>% time_between(on_date = "onset_date", vis_date = "visit_date", treat_date = "treatment_date") %>% visits_number()

## plot
overview_plot(parsed_data = data2, param_mapping = param_mapping)

#####------------------------added here

##plot parameter by patient
plot_fun(param1 = "param3", days_po = "days_po", patient_id = "patient_id", data = parsed_data )

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

<<<<<<< HEAD



=======
>>>>>>> 4b71acaf1a505f35bb129888fd998431eed24926
## === Test of plot_param_per_day.R === ##

data3 <- read_csv("data/output_file.csv")
plot_param_per_day(data, y = cd4) + labs(col="Patient ID") + xlab("Days post onset") + ylab("CD4 levels")
plot_param_per_day(data, y = cd8) + labs(col="Patient ID") + xlab("Days post onset") + ylab("CD8 levels")
plot_param_per_day(data, y = viral_load) + labs(col="Patient ID") + xlab("Days post onset") + ylab("Viral load")

<<<<<<< HEAD
=======

## manual mapping
#param_mapping <- c("param1" = "CD4","param2" = "CD8","param3" = "Viral_load")

## manual mapping
#param_mapping <- c("param1" = "CD4","param2" = "CD8","param3" = "Viral_load")
#Convert columns with dates from Character to Date
input_data <- date_from(input_data) #format same as default "%Y-%m-%d"

#calculates number of days between dates and adds column with treatment status
date_cols <- time_mapping %>% names()
>>>>>>> 4b71acaf1a505f35bb129888fd998431eed24926
