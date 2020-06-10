test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


library(here)
library(tibble)
library(dplyr)
load(here("data", "nhanesdat.rdata"))


names(nhanesdat) <- make.names(casefold(names(nhanesdat)), allow = FALSE)
nhanesdat %>% glimpse()


## explictly recode male / female
data01 <- nhanesdat %>%
  dplyr::mutate(
    id_1c = as.character(seqn),
    gender_1n = dplyr::case_when(
      gender == "Male" ~ 1,
      gender == "Female" ~ 2
    ),
    gender_1l = dplyr::case_when(
      gender_1n == 1 ~ "male",
      gender_1n == 2 ~ "female"
    ),
    gender_1l = factor(gender, levels = c("male", "female") ),
    bmi_1n = as.numeric(bmi.cat),
    bmi_1l = factor(bmi.cat, levels = c("Underweight", "Normal", "Overweight", "Obese")))


data01 %>% glimpse()


data02 <- Hmisc::upData(
  data01,
  labels = c(
    seqn = "ID",
    mortstat = "final mortality status",
    permth.exm = "Person Months of Follow-up from MEC/Exam Date",
    lbxtc = "Total cholesterol",
    tac = "total activity counts per day",
    tlac = "total log activity count",
    mvpa = "total minutes of moderate/vigorous physical activity",
    wt = "total accelerometer wear time",
    satp = "sedentary/sleep/non-wear to active transition probability"
  ),
  units = c(lbxtc = 'mg/dl', tac = 'day')
)

data02 %>% glimpse()
library(ggplot2)
data02 %>% 
  ggplot(aes(bmi)) +
  geom_histogram(binwidth = 0.1, alpha = 0.4)




breaks <- data02 %>% 
  select(bmi) %>% 
  summarise(mean = mean(bmi, na.rm = TRUE),
            median = median(bmi, na.rm = TRUE),
            min = min(bmi),
            max = max(bmi),
            lower = quantile(bmi, probs = 0.25, na.rm = FALSE),
            upper = quantile(bmi, probs = 0.75, na.rm = FALSE)) %>%
  mutate(id = "bmi")

a <- breaks$median

breaks
breaks2 <- breaks %>% 
  tidyr::pivot_longer(-id, names_to = var, values_to = val)

mean <- median(data02$bmi, na.rm = TRUE)
mean



a <- data02 %>% select(bmi)
a
b <- as.numeric(a$bmi)
median(a$bmi)
median(b)





#ida_plot_hist(bactermeia01, crp, bin_width = 0.1)


