---
title: "Bacteremia IDA plan"
author: "Georg Heinze"
date: "3 11 2020"
output: word_document
---



## Preparations

*1. Statistical analysis plan: as assumed above, the analysis strategy to answer the main research question has been prespecified. It comprises of the set of independent variables to be considered in a model, the outcome variable, and the analytical strategy to build the regression model.*


The aim of the analysis is to derive a parsimonious model to predict bacteremia status from age, gender, and 49 continuous laboratory variables. Logistic regression with consideration of nonlinear effects by fractional polynomials will be considered. The multivariable fractional polynomial algorithm will be employed considering first-order fractional polynomials for the continuous covariates. In a first step, optimal transformations for each covariate will be determined without variable selection. In the second step, we will apply the garrote to assign nonnegative shrinkage factors to the coefficients. The shrinkage factors will be determined by optimizing AIC in the second step. It is considered to impute missing values using multiple imputation with chained equations, and to generate a stacked data set for analysis. The number of imputations will be determined after initial data analysis. To assess internal performance of the diagnostic model, we will consider 10-fold cross-validation (CV), repeating the above-described model building steps. The folds will be built by dividing the patient cohort into 10 approximately equally-sized groups. All imputed observations of a patient will be assigned to the same fold. From the 10-fold CV, the area under the ROC, the calibration in the large and the calibration slope will be estimated and reported. The final regression model will be derived from analysing the full cohort with that strategy.      



*2. Data dictionary and metadata: a detailed data dictionary should be available which informs about the meaning of each variable in context of the research question, the units of measurement, the possible levels in case of categorical variables, or admissible values. More generally, metadata, also refer to information about the research study protocol and data collection processes.*


A data dictionary is available.

*3. Domain expertise and pivotal covariates ('very important predictors', VIPs)*

*3.1. In particular for analyses with a moderate to high number of covariates, domain expertise should guide assumptions which covariates are considered to be &#39;strongly related&#39; with the outcome and hence are 'very important predictors' in the regression model, and which variables have a weak or unknown association with the outcome (cf. Heinze et al, Biometrical Journal 2018). Depending on context and assumptions on strength of association with the outcome variable, two to three pivotal covariates should be defined (e.g., age and sex).*

Pivotal covariates:

Ratzinger et al (2014) cite 5 papers who have proposed a prediction model for bacteremia before. From these papers, the following knowledge could be extracted:

Covariates with assumed strong association with bacteremia:

* Jaimes (2004):
  + age
  + heart rate
  + temperature
  + leukocyte count
  + use of central venous catheter
  + length of hospitalization

* Bates 1997
  + Suspected or documented focal infection at onset
  + antibiotics before onset
  + any liver disease
  + Hickman catheter present
  + altered mental status within 24h
  + focal abdominal signs withing 24h

* Lee (2012)
  + age
  + presence of rigor
  + presence of chills
  + body temperature
  + blood urea nitrogen
  + blood urea nitrogen/creatinine ratio
  + thrombocytopenia

* Tudela (2010)
  + Charlson index
  + PCT

* Kuppermann (1998)
  + age
  + temperature
  + clinical score
  + WBC count
  + absolute neutrophil count
  + absolute band count

It has to be admitted that some of these selections are based on inappropriate methods, e.g., use of univariate logistic regression screening, or were derived for special settings or cohorts, e.g. use in emergency room, or use in children.

Out of the set of variables used in the models of the cited 5 papers, the following six variables also available in our data set and are considered as very important predictors (VIPs):

* age (mentioned in 3 papers)
* leukocytes (WBC) (2)
* blood urea neutrogen (BUN) (1)
* creatinine (KREA) (1)
* thrombocytes (PLT) (1)
* neutrophiles (NEU) (1)


Based on this review, we consider age and leukocytes (WBC) as pivotal covariates for the research question.


  *3.2. Domain expertise may also be useful to specify in advance which variables are expected to correlate with each other. This background knowledge could be summarized in a directed or undirected acyclic graph connecting the covariates with each other as also suggested by Heinze et al, 2018.*
  
  Correlations depend largely on the underlying condition, and are therefore difficult to anticipate. Domain expertise does not give rise to specific expectations.

  *3.3. Missing value mechanisms: if not already specified in meta data, domain experts should also be consulted to explain possible reasons for the occurrence of missing values for each variable, which may be categorized as systematic or unsystematic.*
  
  A certain proportion of missing values is expected because of the lab test request which is often specific to the underlying condition. No specific expectations can be made.

## IDA plan

### IDA domain: missing values

*1. Number and proportion of missing values for each independent variable, for the dependent variable and for the analysis as a whole.*

Number and proportion of missing values will be computed for age, sex,  the 49 laboratory variables, BloodCulture, as well as for the  analysis as a whole.

*2. Patterns of missing values across all independent variables, either as tables or appropriately visualized.*

We will create missing value indicators for each covariate and will then summarize patterns by means of a heat map and a dendogram. 


### IDA domain: univariate distributions

*3. For categorical variables (including the dependent variable): frequency and proportion for each category.*

Sex and BloodCulture will be described by frequencies and proportions.

*4. For continuous variables (including the dependent variable): high-resolution histogram, summary of main percentiles (1st, 10th, 25th, 50th, 75th, 90th, 99th) and interquartile range, 5 highest and 5 lowest values, first four moments (mean, variance, skewness, curtosis), standard deviation, number of distinct values.*

Summaries for all 50 continuous variables (age and 49 laboratory variables) will be created to depict their marginal distributions by means of high-resolution histograms. Furthermore, each continuous variable will be described by 1st, 10th, 25th, 50th, 75th, 90th, 99th percentiles,  interquartile range, the 5 highest and 5 lowest values, the first four moments (mean, variance, skewness, curtosis), standard deviation, and the number of distinct values.

The graphical summary for each variable will serve to suggest transformations for each variable:

* no transformation (in case of approximate symmetry);
* $\log_10(x+1)$ transformation (in case of skewness)

The distributions of transformed variables will be evaluated as well as described above.

### IDA domain: multivariate system of variables

*5. Matrix/heatmap of Pearson correlation coefficients between all independent variables.*

Using the suggested transformations for each variable, Pearson correlation coefficients will be computed between all independent variables. The correlation coefficients will be depicted by means of a (quadratic) heat map. Moreover, a network graph between all independent variables will be constructed, which will be thresholded at an absolute correlation coefficient of 0.3. 

Spearman correlation coefficients will be computed as well, and the 10 pairs of covariates with the largest absolute difference between Pearson and Spearman correlation coefficients will be flagged. These pairs will be graphically investigated by constructing separate scatterplots.

*6. Appropriate visual presentation of the association of each covariate with the two pivotal covariates.*

Also for this analysis, transformations of covariates will be used as identified in step 4.

First, the distribution of age will be depicted as histogram stratified for sex. 

Second, a scatterplot of leukocytes by age will be constructed, using different colours for the two sexes.

Third, age will be categorized into three groups: $\geq$ 65 years, 50-65 years, $<$ 50 years. Should this lead to a very imbalanced distribution of patients (the largest group containing more than four times as many patients as the smallest group), groups will be defined based on 25th and 75th percentiles. Each lab variable (or its transformation) will then be depicted in a scatterplot with leukocytes (or its transformation) in each of the three age groups, marking the dots with two different colours representing sex.

Fourth, a heat map of the raw data (or transformations) will be constructed. 

Fifth, a redundancy analysis will be conducted for each variable. This analysis identifies predictors that can be almost perfectly predicted by flexible parametric additive models performed on the companion covariates. As this analysis can only be conducted with complete data for all variables, it will be done 

* based on a flexible parametric additive model only involving the 5 above-mentioned pivotal covariates (complete cases)
* for the complete-cases set using the `rms::redun` function
* for each of 5 randomly selected imputed data sets (after multiple imputation has been conducted) using `rms::redun`

*7. If interactions between covariates were prespecified to be included in the regression model, special attention should be given to evaluate the bivariate distribution of the interacting covariates. Appropriate graphical displays (see 6) should be used to visualise these distributions.*

No interactions are assumed to be considered.

