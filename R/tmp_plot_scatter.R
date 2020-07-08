library(here)
library(tidyverse)
library(rmarkdown)
library(ggplot2)
library(dplyr)
library(tidyr)
library(Hmisc)
library(here)
library(tidyverse)
library(summarytools)

load(here("data","a_crs.Rdata"))
load(here::here("data", "crash2.rda"))

bigN <- nrow(crs)
bigN <- nrow(crash2)

bigN

crash2 %>% glimpse()

crash2 %>%
  select(sex, bmi, entryid ) %>%
  mutate(bmi = as_factor(bmi), 
         sex = as_factor(sex)) %>%
  pivot_longer(-entryid, names_to = "variable", values_to = "value") 




a_crs %>% mutate(
  chf = as_factor(chf),
  afib = as_factor(afib),
  diabetes = as_factor(diabetes),
  mi = as_factor(mi),
  copd  = as_factor(copd),
  crohn  = as_factor(crohn),
  ulcercol  = as_factor(ulcercol),
  ibd = as_factor(ibd)
) %>%
  select(id, chf, afib, diabetes, mi, copd, crohn, ulcercol, ibd) %>%
  pivot_longer(-id, names_to = "comorb", values_to = "value") %>%
  mutate(
    comorb = case_when(
      comorb == "chf" ~ "Congestive heart failure",
      comorb == "afib" ~ "Atrial fibrillation",
      comorb == "diabetes" ~ "Diabetes",
      comorb == "copd" ~ "COPD",
      comorb == "mi" ~ "Myocardial infarction",
      comorb == "crohn" ~ "Crohn's disease",
      comorb == "ulcercol" ~ "Ulcerative colitis",
      comorb == "ibd" ~ "Inflammatory bowel disease"
    ),
    value = case_when(value == "0" ~ "no",
                      value == "1" ~ "yes")
  ) %>%
  group_by(comorb, value) %>%
  summarise(n = n()) %>%
  mutate(
    inc = n / bigN,
    perc = n / bigN * 100,
    plot_lab = paste0('(', n, ', ', round(perc, digits = 1), '%)'),
    axis_lab = paste0(comorb, ' ', '(', n, ', ', round(perc, digits = 1), '%)')
  ) %>%
  filter(value == "yes") %>%
  ggplot(aes(reorder(axis_lab, inc), inc)) +
  geom_point() +
  coord_flip() +
  ggtitle("Proportion of patients reporting a comorbidity at diagnosis") +
  theme_minimal(base_size = 10) +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_blank(),
    axis.title = element_blank()
  )

d <- Hmisc::describe(crash2)
plot(d)

table(crash2$bmi)





library(DataExplorer)
library(ggplot2)
#create_report(crash2, y = "outcomeid")


#plot_bar(crash2)


crash2 <- Hmisc::upData(crash2,
                        labels = c(age = 'Age'),
                        units = c(age = "years"))


crash2 %>% dplyr::filter(!is.na(sbp)) %>% tally()
crash2 %>% dplyr::filter(is.na(sbp)) %>% tally()

bigN <- crash2 %>% dplyr::filter(!is.na(sbp) & !is.na(age)) %>% tally()
n_miss <- crash2 %>% dplyr::filter(is.na(sbp) | is.na(age)) %>% tally()

title <-
  paste0("Plot of ", Hmisc::label(crash2$age), " and ", Hmisc::label(crash2$sbp))

caption <-
  paste0(
    "n = ",
    bigN,
    " subjects displayed.\n",
    n_miss,
    " subjects with a missing value in at least one of the variables."
  )


x_axis <- paste0(Hmisc::label(crash2$sbp), " [", Hmisc::units(crash2$sbp), "]")
y_axis <- paste0(Hmisc::label(crash2$age), " [", Hmisc::units(crash2$age), "]")

p1 <- crash2 %>%
  dplyr::filter(!is.na(sbp) & !is.na(age)) %>%
  mutate(sbp = as.numeric(sbp), 
         age = as.numeric(age)) %>%
  ggplot(aes(x = sbp, y = age)) +
  ylab(x_axis) +
  xlab(y_axis) +
  labs(
    title = title,
    caption = caption
  ) +
  geom_point(shape = 16, #size = 0.5,
             alpha = 0.5,
             color = "firebrick2") +
  geom_rug() +
  theme_minimal()


p1

#gg <- p1 +
#  patchwork::plot_annotation(title = title,
                             caption = caption)

#gg

#satp   
#astp

library(ggalt)
library(viridis)
library(patchwork)

p1 <- 
  crash2 %>% 
  filter(!is.na(sbp) & !is.na(age)) %>%
  ggplot(aes(x = as.numeric(sbp), y = as.numeric(age))) + 
  geom_point(shape=16, alpha = 0.5, color = "firebrick2") +
#  stat_bkde2d(aes(fill=..level..), geom="polygon") +
#  geom_bkde2d(bandwidth=c(0.5, 4)) +
#  scale_fill_viridis() +
#  geom_point(shape=16, size=0.5, show.legend = FALSE, alpha = 0.4) +
  geom_rug() + 
  theme_minimal()

p1

p2 <- crash2 %>% 
  ggplot(aes(x = sbp, y = hr)) + 
  geom_point(shape=16, size=0.5, show.legend = FALSE, alpha = 0.4) +
  stat_bkde2d(aes(fill=..level..), geom="polygon") +
  scale_fill_viridis() +
  #  geom_rug() + 
  theme_minimal()




p3 <- crash2 %>% 
  ggplot(aes(x = sbp, y = rr)) + 
  geom_point(shape=16, size=0.5, show.legend = FALSE, alpha = 0.4) +
  geom_bkde2d(bandwidth=c(0.5, 4)) +
  theme_minimal()




p1 
p2
p3
