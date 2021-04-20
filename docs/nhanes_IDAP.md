# Initial data analysis plan (IDAP)




Since a key principle of IDA is not to touch the research questions, before IDA commences the research aim and statistical analysis plan needs to be in place. 
IDA may lead to an update or refinement of the analysis plan. To demonstrate the workflow and content of IDA, we created a hypothetical research aim and corresponding statistical analysis plan.

IDA follows the generic IDA plan developed in this project and is adapted to the data set given the hypothetical research aim.
 


## Statistical methods 






## Initial data analysis strategy

<span style="color:blue">1. Statistical analysis plan: as assumed above, the analysis strategy to answer the main research question has been prespecified. It comprises of the set of independent variables to be considered in a model, the outcome variable, and the analytical strategy to build the regression model. </span>


The aim is to develop develop a multivariable model for MVPA (minutes of moderate/vigorous physical activity).The continuous outcome variable MVPA will be predicted with linear regression models from explanatory variables  age, gender, education, smoking, alcohol consumption, BMI, comorbidities (cancer, CHF, stroke).  Partial R-squared will be used to identify an appropriate set of variables to predict MVPA.




<span style="color:blue">2. Data dictionary and metadata: a detailed data dictionary should be available which informs about the meaning of each variable in context of the research question, the units of measurement, the possible levels in case of categorical variables, or admissible values. More generally, metadata, also refer to information about the research study protocol and data collection processes.</span>


A data dictionary was included in the previous section.


<span style="color:blue">3. Domain expertise and pivotal covariates ('very important predictors', VIPs)</span>

<span style="color:blue">3.1. In particular for analyses with a moderate to high number of covariates, domain expertise should guide assumptions which covariates are considered to be &#39;strongly related&#39; with the outcome and hence are 'very important predictors' in the regression model, and which variables have a weak or unknown association with the outcome (cf. Heinze et al, Biometrical Journal 2018). Depending on context and assumptions on strength of association with the outcome variable, two to three pivotal covariates should be defined (e.g., age and gender).</span>

Pivotal covariates:

It has been shown that physical activity declines with age and men report higher levels of activity than women.  

Keadle S et al. Prevalence and trends in physical activity among older adults in the United States: A comparison across three national surveys. Prev Med. 2016 Aug; 89: 37–43. https://doi.org/10.1016/j.ypmed.2016.05.009 

Clarke TC,  Norris T, and Schiller JS. Early Release of Selected Estimates Based on Data From the 2018 National Health Interview Survey. https://www.cdc.gov/nchs/nhis/releases/released201905.htm#7a

<span style="color:blue"> 3.2. Domain expertise may also be useful to specify in advance which variables are expected to correlate with each other. This background knowledge could be summarized in a directed or undirected acyclic graph connecting the covariates with each other as also suggested by Heinze et al, 2018.</span>

We define groups of variables: socio-demographic variables, health and behavior variables, and physical activity data.

  
<span style="color:blue">3.3. Missing value mechanisms: if not already specified in meta data, domain experts should also be consulted to explain possible reasons for the occurrence of missing values for each variable, which may be categorized as systematic or unsystematic.</span>
  
Missing values are expected due to the nature of survey research. Domain expertise would be helpful in identifying specific expectations. This will be considered in the IDA domain 'Missing values' to identify approaches or updates to the statistical analysis plan.


### IDA domain: missing values  

<span style="color:blue">1. Number and proportion of missing values for each independent variable, for the dependent variable and for the analysis as a whole.</span>

Number and proportion of missing values will be computed for all variables and groups of variables (demographics, lifestyle, health).

<span style="color:blue">2. Patterns of missing values across all independent variables, either as tables or appropriately visualized.</span>

We will create missing value indicators for each covariate and will then summarize patterns by means of a heat map and a dendogram. 




### IDA domain: univariate distributions

<span style="color:blue">3. For categorical variables (including the dependent variable): frequency and proportion for each category.</span>

Demographic variables, smoking status, alcohol consumption, comorbidities, and mortality status  will be described by frequencies and proportions.

<span style="color:blue">4. For continuous variables (including the dependent variable): high-resolution histogram, summary of main percentiles (1st, 10th, 25th, 50th, 75th, 90th, 99th) and interquartile range, 5 highest and 5 lowest values, first four moments (mean, variance, skewness, curtosis), standard deviation, number of distinct values. </span>



Summaries for all continuous variables (age, BMI, physiological variables, physical activity) will be created to depict their marginal distributions by means of high-resolution histograms. Furthermore, each continuous variable will be described by 1st, 10th, 25th, 50th, 75th, 90th, 99th percentiles,  interquartile range, the 5 highest and 5 lowest values, the first four moments (mean, variance, skewness, curtosis), standard deviation, and the number of distinct values.

While the outcome variable MVPA is the only physical activity variable in the analysis plan, since it is a  derived variables from some of the other physical activity variables, others will be looked at in the univariate step to identify potential issues of skewness or unusual values.

The graphical summary for each variable will serve to suggest transformations for each variable:

* no transformation (in case of approximate symmetry);
* $\log_{10}(x+1)$ transformation (in case of skewness)

The distributions of transformed variables will be evaluated as well as described above.

It is assumed that the data have been cleaned, but unusual values will be identified and possibly excluded.

### IDA domain: multivariate system of variables

<span style="color:blue">5. Matrix/heatmap of Pearson correlation coefficients between all independent variables.</span>

Pearson correlation coefficients will be computed between all independent variables. The correlation coefficients will be depicted by means of a (quadratic) heat map. Moreover, a network graph between all independent variables will be constructed, which will be thresholded at an absolute correlation coefficient of 0.3. 

Spearman correlation coefficients will be computed as well, and the 10 pairs of covariates with the largest absolute difference between Pearson and Spearman correlation coefficients will be flagged. These pairs will be graphically investigated by constructing separate scatterplots.

<span style="color:blue">6. Appropriate visual (and numerical) presentations of the association of each covariate with the two pivotal covariates.</span>

A redundancy analysis will be conducted for each variable. This analysis identifies predictors that can be almost perfectly predicted by flexible parametric additive models performed on the companion covariates. 

Categorical and continuous variables will be summarized with counts and proportions or medians and quartiles, as appropriate, in a table stratified by sex and age groups.

Scatterplots of continuous variables by age will be constructed stratified by gender.


<span style="color:blue">7. If interactions between covariates were prespecified to be included in the regression model, special attention should be given to evaluate the bivariate distribution of the interacting covariates. Appropriate graphical displays (see 6) should be used to visualise these distributions.</span>

Interactions between age and gender will be considered. The distribution of age will be depicted as histogram stratified for gender. 


<span style="color:blue">8. For a derived outcome variable, the bivariate distribution of these variables  with the outcome variable should be evaluated with appropriate visualizations.. </span>

Scatter plots of the physical activity variables with MVPA will be constructed with trend lines.



