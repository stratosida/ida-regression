Hmisc::redun( ~ hr + rr + age + sbp + sex , data = a_crash2)
Hmisc::varclus(~ hr + rr + age + sbp + sex , data = a_crash2)


plot(Hmisc::varclus(~ hr + rr + age + sbp + sex , data = a_crash2))
