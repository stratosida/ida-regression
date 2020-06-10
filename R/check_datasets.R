library(here)
library(tidyverse)
library(janitor)
library(summarytools)

# crash2
#---------------------------------
load(here::here("data", "crash2.rda"))
crash2 %>% glimpse()

Hmisc::describe(crash2) 



# Bacterimia
#---------------------------------
bactermeia <- readr::read_csv(here::here("data", "Bacteremia_public.csv"))
bactermeia %>% glimpse()

# to lower case
bactermeia01 <- 
  bactermeia %>% janitor::clean_names()

bactermeia01 %>% glimpse()


# nhanes
#---------------------------------
load(here::here("data", "nhanesdat.rdata"))
nhanesdat %>% glimpse()

nhanesdat01 <- 
  nhanesdat %>% janitor::clean_names()

nhanesdat01 %>% glimpse()



