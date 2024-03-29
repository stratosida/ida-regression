# CRASH-2 prediction model

**Description:** Clinical Randomisation of an Antifibrinolyticin Significant Haemorrhage(CRASH-2)  was a large randomised placebo controlled trial among trauma patients with, or at risk of, significant haemorrhage, of the effects of antifibrinolytic treatment on death and transfusion requirement. The study is described at [the original trial website](http://crash2.lshtm.ac.uk/). A public version of the data set is found at a [repository of public data sets](http://biostat.mc.vanderbilt.edu/wiki/Main/DataSets) hosted by the Vanderbilt University's Department of Biostatistics (Prof. Frank Harrell Jr.).

The data set includes 20,207 patients and 44 variables. 

**Hypothetical research aim for IDA:** Develop a multivariable model for early death (death within 28 days from injury) using 9 independent variables of mixed type (continuous, categorical, semicontinuous) with the primary aim of prediction and a secondary aim of describing the association of each variable with the outcome. The assumed analysis aim is in line with the prediction model presented by [Perel et al, BMJ 2012](https://doi.org/10.1136/bmj.e5166), [supplement available at](https://www.bmj.com/highwire/filestream/634478/field_highwire_adjunct_files/0/perp003158.ww1_default.pdf). However, in contrast to the analysis described there, variables describing the economic region and the treatment allocation are missing in the public version of the data set, and while the data set contains 20,207 patients, the research paper mentions 20,127 patients having been included in the study.


## Statistical analysis plan

**Outcome**: Early death, i.e. in-hospital death within 28 days from injury (binary variable)

**Statistical methods**: Logistic regression will be used to model early death by the following independent variables deemed important to predict early death:

* Age (`age`, years)
* Sex (`sex`, male or female)
* Systolic blood pressure (`sbp`, mmHg)
* Heart rate (`hr`, 1/min)
* Respiratory rate (`rr`, 1/min)
* Glasgow coma score (`gcs`, points)
* Central capillary refill time (`cc`, seconds)
* Time since injury (`injurytime`, hours)
* Type of injury (`injurytype`, 'blunt', 'penetrating' or 'blunt and penetrating')
 
Restricted cubic splines with 3 degrees of freedom with knots set to default values will be used for continuous variables. As the final prediction model should be parsimonious enough to simplify its application, a backward elimination algorithm with a significance level set at $\alpha=0.05$ will be applied to remove statistically insignificant effects. Finally, nonlinear representation of each continuous variable will be tested against linear representation at $\alpha=0.05$. In case of lacking added value of a nonlinear effect, the model will be refitted with a linear effect for that variable.

*Remarks*: 

* Regarding type of injury, the original paper describes its treatment in the model as follows: 'Type of injury had three categories—-penetrating, blunt, or blunt and penetrating—but we analysed it as 'penetrating' or 'blunt and penetrating.' ' It is not clear from that description what happened to the 'blunt' group. (I assume they were collapsed with 'blunt and penetrating'.)

* The original paper describes the modeling approach as follows: 'We used a backward stepwise approach. Firstly, we included all potential prognostic factors and interaction terms that users considered plausible. These interactions included all potential predictors with type of injury, time since injury, and age. We then removed, one at a time, terms for which we found no strong evidence of an association, judged according to the P values (<0.05) from the Wald test.'  This would mean they tested at least 24 interaction terms, each possibly using several degrees of freedom! In the final model, only an interaction of Glasgow coma score and type of injury was included.


**Preparations:**

The outcome variable, early death (i.e., death within 28 days from injury) must be computed from the time span between date of death and date of randomisation using the following code:

```{r}
# transform ddeath and trandomisation into an interpretable date format and then compute the difference
# interpret NAs as 'not died within study period, at least not within 28 days'
# if patients died after 28 days, treat as alive 
crash2$time2death <- as.numeric(as.Date(crash2$ddeath) - as.Date(crash2$trandomised))

crash2$earlydeath[!is.na(crash2$time2death)] <- (crash2$time2death[!is.na(crash2$time2death)] <= 28) + 0   
# +0 to transform it from TRUE/FALSE to 1/0

crash2$earlydeath[is.na(crash2$time2death)] <- 0    # NA in time2death means alive at day 28

table(crash2$earlydeath)
```

The number of deaths computed in the data set coincides with the number reported in [Perel et al, BMJ 2012](https://doi.org/10.1136/bmj.e5166).


**Source:** 

Data obtained from http://biostat.mc.vanderbilt.edu/DataSets

[LINK to data set](http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/crash2.rda)

**Data dictionary:**  [LINK](http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/Ccrash2.html)

**References:**

* CRASH-2 Collaborators. Effects of tranexamic acid on death, vascular occlusive events, and blood transfusion in trauma patients with significant haemorrhage (CRASH-2): a randomised, placebo-controlled trial. Lancet 2010;376:23-32

* Perel P, Prieto-Merino D, Shakur H, Clayton T, Lecky F, Bouamra O, Russell R, Faulkner M, Steyerberg EW, Roberts I. Predicting early death in patients with traumatic bleeding: development and validation of prognostic model. BMJ 2012; 345(aug15 1): e5166.