Hmisc::redun( ~ hr + rr + age + sbp + sex , data = a_crash2)
Hmisc::varclus(~ hr + rr + age + sbp + sex , data = a_crash2)
plot(Hmisc::varclus(~ hr + rr + age + sbp + sex , data = a_crash2))




a_crash2 %>% 
  ggplot(aes(x = age )) + 
geom_histogram(bins = 200) + 
  facet_grid(injurytype ~ earlydeath)
