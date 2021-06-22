## short script to test functions on example data
library(tidyverse)
source("src/cohort_overview.R")
source("src/time_between.R")
source("src/date_from.R")

## === Test of Cohort overview function === ##

# parse data
# data2 <- read_csv("data/output_file.csv") %>% 
#   rename(sample_id = SampleID,
#          patient_id = PatientID,
#          site = Site,
#          param1 = cd4,
#          param2 = cd8,
#          param3 = viral_load) %>% 
#   mutate(patient_id = as.character(patient_id)) %>% 
#   mutate(visit = as.numeric(gsub("*._","",sample_id)))

data2 <- read_csv("data/output_file (1).csv") %>% 
  select(-c("X1")) %>% 
  rename(param1 = cd4,
         param2 = cd8,
         param3 = viral_load) %>% 
  mutate(patient_id = as.character(patient_id)) 

## manual mapping
param_mapping <- c("param1" = "CD4","param2" = "CD8","param3" = "Viral_load")

## plot
overview_plot(parsed_data = data2, param_mapping = param_mapping)
