library(tidyext)
library(tidyverse)
load(here::here("data", "a_crash2.rda"))

ards <- 
  a_crash2 %>%
  tidyext::describe_all_num(extra = TRUE)



