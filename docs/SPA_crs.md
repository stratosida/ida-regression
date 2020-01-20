# Rectal cancer surgery dataset 

**Description:** The data sets includes 345 patients undergoing minimally invasive resection for rectal cancer 
from 2005 to 2011. The 44 variables describe patient characteristics (age, bmi, current smoker, 
ASA, prior abdominal surgery), surgical and treatment variables (primary procedure, preop chemo, preop radiation), post-surgical complications (ileus, wound infection, death30, readmission30, ), and comorbidities (COPD, diabetes), and time to complications and time to follow-up. Complications include post-operative ileus, abscess, leak, wound infection, small bowel obstruction, reoperation for bleeding, and renal failure. 

**Hypothetical research aim for IDA:** Describe risk factors associated with the outcome ‘any complication’ developing within 30 days post surgery. 

**Statistical analysis plan:**
Outcome: All-cause complications within 30 days post surgery defined as binary variable.
Statistical methods: Logistic regression will be used to model all-cause complications by the following independent variables: age, sex, bmi, ASA, prior abdominal surgery, minimal invasive surgery, preop chemo, preop radiation, primary procedure, diabetes, copd, current smoker. 
Categorical variables with more than two levels will enter the analyses as several dummy variables. The reference category for those variables will be chosen according to the most frequent group.
For continuous variables, a linear or quadratic relationship with log odds of complications will be assumed.
Results will be described by a table containing odds ratios and associated 95% confidence intervals for each variable. For nonlinearly modelled continuous variables, the log odds ratio as a function of the continuous variable will be graphically displayed, along with corresponding pointwise 95% confidence intervals. Moreover, odds ratios for comparisons between 90th, 75th, 25th and 10th percentile compared to median will be presented. A calibration plot comparing the agreement of predicted probabilities for the event and observed event rates will be constructed to check internal validity of the model. Overall model fit will be described by the area under the ROC curve and the explained variation (EV) based on the squared correlation of the predicted probabilities and the binary outcome variable. Partial explained variation (drop in EV after omitting a variable) will be computed for each variable to assess relative importance.

*Comments from 2019-12-17 conference call
Marginal distribution of outcome variable to see about number of events and variables. Degrees of freedom. Known strong predictors vs predictors with unclear role.
Possible actions:
-	Combine comorbidities as number 
-	ASA: as numeric or collapsed (1,2 vs 3,4) or categorical 1-4
-	Degrees of freedom (can reduce age and bmi to linear).
-	Combine preop chemo+radiation as preop trt*


**Source:** Mayo Clinic data courtesy of Dr. David Larson. [LINK](https://github.com/stratos-ida/ida-regression/blob/master/data/crs.csv)

**Data dictionary:**  [LINK](https://github.com/stratos-ida/ida-regression/blob/master/docs/crs.html)

**References:**
* Khreiss W, Huebner M, Cima R, Dozois E, Chua H, Pemberton JH, Harmson W,  Larson DW. Improving Conventional Recovery With Enhanced Recovery in Minimally Invasive Surgery for Rectal Cancer. Diseases of the Colon & Rectum 57 (5), 557-563
* Huebner M, Huebner M, Cima RR, Larson DW. Timing of complications and length of stay after rectal cancer surgery. Journal of the American College of Surgeons 218 (5), 914-919
