library(here)
library(tidyverse)
library(Hmisc)

## Read data 
load(here::here("data", "a_crash2.rda"))

a_crash2_agec <- a_crash2 %>%
  mutate(age_C = case_when(is.na(age) ~ "NA", 
                           age < 30 ~ "<30",
                            age < 45 ~ "30-44",
                            age < 60 ~ "45-59",
                            age >= 60 ~ "60+"))




table(a$age_C)

mutate(cg = case_when(carb <= 2 ~ "low",
                      carb > 2  ~ "high"))

30-44, 45-59, 60+