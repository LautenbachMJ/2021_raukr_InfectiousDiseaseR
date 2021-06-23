# Script with workflow
library(tidyverse)
source("src/overview_plot.R")
source("src/time_between.R")
source("src/date_from.R")
source("src/plot_param_per_day.R")

#test
#load input data
input_data <- read.csv("data/input_data.csv", stringsAsFactors = FALSE, sep=";")
<<<<<<< HEAD
input_data <- as.tibble(input_data)
=======
input_data <- as.tibble(input_data) ### Comment julius: I think, read_delim() (readr/tidyverse function) reads it automatically into a tibble

#input_data <- read_delim("data/input_data.csv", delim = ";")

>>>>>>> ef2f6e2b18987bba415b33519d43e9f839b22c01

#Convert columns with dates from Character to Date
input_data <- date_from(input_data) #format same as default "%Y-%m-%d"

#calculates number of days between dates and adds column with treatment status
input_data_calc <- time_between(input_data,on_date = "onset_date", vis_date = "visit_date", treat_date = "treatment_date" )

<<<<<<< HEAD




=======
>>>>>>> ef2f6e2b18987bba415b33519d43e9f839b22c01
