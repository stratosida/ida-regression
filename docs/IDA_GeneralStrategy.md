---
output:
  word_document: default
  html_document: default
---
**Generic Strategy**

Georg Heinze, Mark Baillie and Marianne Huebner

20 10 2020

# Seven elements of a strategy for IDA to support regression analysis

## Introduction

In this document, we outline a generic IDA strategy to support regression analyses. We will first list a number of assumptions that underly the outlined strategy, and will state some preparatory steps. The generic strategy, consisting of seven elements, is then presented, followed by possible optional extensions that depend on the context of the analysis. Subsequently, we list some possible consequences of such an IDA, which may affect the statistical analysis plan, the interpretation of results but also the presentation of the regression model in a research report. We conclude with some final remarks.

## Scope

This section lists some assumptions for the general strategy. Extensions are possible but were not considered here.

| Aspect | Assumption |
| --- | --- |
| Purpose of analysis | Descriptive, explanatory or predictive model to relate an outcome variable with a set of independent variables |
| Type of analysis | Regression analysis with one outcome variable |
| Type of outcome variable | Continuous, binary or count (no survival-type, multivariate or longitudinal outcome variable is considered) |
| Number of independent variables | 3 – 50; the number should be less than the number of effective observations (low-dimensional setting) |
| Data cleaning | has completed; we assume that the data does not contain any entry errors etc. |
| Statistical analysis plan | has been written such that the model building strategy is fully defined. It should comprise, e.g., the type of regression model that should be used, the set of variables that is considered as predictors, the way possible nonlinear effects of continuous variables should be handled, which interactions should be considered, any planned selection of variables etc. |
| Background knowledge | We assume that the analyst collaborates with a domain expert who can give advise, based on previous studies or personal experience, which independent variables are considered very important (pivotal) in an analysis, which correlation between independent variables can be assumed (e.g. because of known causal relationships or knowledge about the recruitment process), etc. |
| Key principle of IDA | We assume that IDA prepares the data for regression analysis, but we explicitly exclude typical model building steps from IDA such as evaluating associations of the dependent variable with independent variables. |

## Preparations

We suggest that the following preparatory steps should precede IDA:

1. Statistical analysis plan: as assumed above, the analysis strategy to answer the main research question has been prespecified. It comprises of the set of independent variables to be considered in a model, the outcome variable, and the analytical strategy to build the regression model.
2. Data dictionary and metadata: a detailed data dictionary should be available which informs about the meaning of each variable in context of the research question, the units of measurement, the possible levels in case of categorical variables, or admissible values. More generally, metadata, also refer to information about the research study protocol and data collection processes.
3. Domain expertise and pivotal covariates (VIPs)

  1. In particular for analyses with a moderate to high number of covariates, domain expertise should guide assumptions which covariates are considered to be &#39;strongly related&#39; with the outcome and hence are pivotal in the regression model, and which variables have a weak or unknown association with the outcome (cf. Heinze et al, Biometrical Journal 2018). Depending on context and assumptions on strength of association with the outcome variable, two to three pivotal covariates should be defined (e.g., age and sex).

  1. Domain expertise may also be useful to specify in advance which variables are expected to correlate with each other. This background knowledge could be summarized in a directed or undirected acyclic graph connecting the covariates with each other as also suggested by Heinze et al, 2018.

  1. Missing value mechanisms: if not already specified in meta data, domain experts should also be consulted to explain possible reasons for the occurrence of missing values for each variable, which may be categorized as systematic or unsystematic.

## A generic strategy for IDA in regression analyses

Here we outline a strategy for IDA. The strategy is restricted to the main elements of an IDA to prepare regression analysis but does not specify specific procedures or software packages to conduct the analyses. It can be understood as a minimum basic set of analyses that can be extended depending on context.

### IDA domain: missing values

1. Number and proportion of missing values for each independent variable, for the dependent variable and for the analysis as a whole.
2. Patterns of missing values across all independent variables, either as tables or appropriately visualized.

### IDA domain: univariate distributions

3. For categorical variables (including the dependent variable): frequency and proportion for each category.
4. For continuous variables (including the dependent variable): high-resolution histogram, summary of main percentiles (1st, 10th, 25th, 50th, 75th, 90th, 99th) and interquartile range, 5 highest and 5 lowest values, first four moments (mean, variance, skewness, curtosis), standard deviation, number of distinct values.

### IDA domain: multivariate system of variables

5. Matrix/heatmap of Pearson correlation coefficients between all independent variables.
6. Appropriate visual presentation of the association of each covariate with the two pivotal covariates.
7. If interactions between covariates were prespecified to be included in the regression model, special attention should be given to evaluate the bivariate distribution of the interacting covariates. Appropriate graphical displays (see 6) should be used to visualise these distributions.

## Further aspects and possible extensions

### IDA domain: missing values

- Currently a framework for the treatment and analysis of missing values in observational studies (TARMOS framework) is being developed by STRATOS-TG1, and here we quote some further aspects of that framework that could be considered as parts of an IDA:
- &quot;A table of characteristics for the &#39;complete&#39; versus &#39;incomplete&#39; (or all) participants, or by whether variables with substantial missingness are observed.&quot; (Lee et al, 2020)
- &quot;An assessment of the predictors of missingness, e.g. using a logistic regression model fitted to an indicator for being a complete record, and predictors of missing values i.e. associations with the incomplete variables.&quot; (Lee et al, 2020). data availability, a logistic regression model could be fit for each independent variable with the binary outcome variable missing/not missing, and using all other independent variables as independent variables. Each independent variable in that model could be represented by two design variables, one indicator for missing/non-missing, and one continuous or binary variable representing the measured values in case of non-missingness, or the mean of the measured values in case of missingness. Assuming a missing-at-random mechanism, such a regression model could identify the main predictors of missingness of a variable. Alternatively, a CART model could be fit.

### IDA domain: univariate distributions

- Interactive distributional plots may be useful to allow identification of areas with no data, or to identify identification codes of outliers.

- If an unexpected distribution is identified in the &#39;IDA domain: univariate distributions&#39;, special attention should be given to evaluate bivariate distributions of covariates with this variable. A skewed univariate distribution of a covariate might be a result of strong correlation with other covariates. Multimodality (&#39;red flag for measurement error&#39;) in a distribution might lead to further investigations.

### IDA domain: multivariate system of variables

- The correlation matrix may be complemented by Spearman correlation coefficients. Large differences between Pearson and Spearman correlation coefficients may indicate unusual type of association or outliers in a bivariate data cloud.
- Depending on the scale of measurement, association between independent variables could be visualized by scatterplots (continous by continous), or dotplots of original values (continuous by categorical) or frequencies (categorical by categorical). Ideally, these graphical displays should show the association of a covariate with both pivotal covariates simultaneously. For example, to display associations of a covariate X with age and sex one could show scatterplots of X by age for males and females in two panels, or superimpose the two scatterplots using different symbols for males and females. If among the pivotal covariates there are two continuous ones, one of them could be categorized, but that bears to risk of overlooking patterns in the association of the covariate with that pivotal covariate.
- In situations with &#39;many&#39; covariates, a heat map may be a useful summary of the correlation structure of the independent variables. The pivotal covariates could be highlighted in the heat map.
- Variable clustering: identifies clusters of variables that are closely associated (also contained as dendogram in the heat map).
- Redundancy analysis: identifies if a variable is (almost) entirely represented by a linear combination of other independent variables.

## Possible consequences of IDA

IDA may support later decisions for the statistical analysis. Here we list possible consequences of the IDA results on the statistical analysis plan, the interpretation of results, and the presentation of the data and model(s) in the research report.

### Some results of IDA that may lead to updates of the SAP

- IDA domain: missing values
  - Variable omission could be considered if a variable exhibits an excessive number of missing values.
  - Knowledge about patterns of missing data or potential influence of missingness on pivotal covariates support decisions on the type of handling of missing values in the analysis, e.g. complete case analysis or multiple imputation (see also TARMOS framework, Lee et al 2020, arXiv:2004.14066 [stat.ME]).
- IDA domain: univariate distributions
  - Unexpected shapes of the distribution of the outcome variable may indicate changes of the analysis model, in particular if the variation of the outcome variable is smaller than expected; e.g. transformation of the outcome variable, switching from a Poisson model to a zero-inflated Poisson model in case of excess zero counts, or considering a bias correction/shrinkage method and/or reducing the number of covariates in case of rare outcome events.
  - IDA may identify variables with a very narrow distribution, e.g., binary variables with a very rare level. Depending on context this may lead to collapsing several binary variables (by counting the number of &#39;exposed&#39; levels or by connecting them with an logical &#39;OR&#39;). For ordinal or categorical variables, rare categories may be suitably collapsed to increase stability of a model. Also continuous covariates may exhibit narrower distributions than anticipated, and hence may be assumed to be less predictive or even irrelevant. An update of the SAP may then specify that such covariates be omitted from consideration in modeling.
  - IDA may identify further aspects in the distribution of continuous variables: skewed distributions, multi-modality (clusters), or data points that could be highly influential in regression models. Possible consequences of such discoveries include further exclusion or may trigger specific pre-planned sensitivity analysis (e.g. with transformed covariates or in subgroups)
  - IDA may guide how nonlinear modeling should proceed (transformation, location of knots for spline analysis, suitable standardization if needed).
- IDA domain: multivariate system of covariates
  - IDA may detect that some variables are clustered and could result in the definition of a single &#39;cluster representative&#39; to be included in the model instead of all variables individually.
  - IDA may identify redundant variables which, depending on context, may be candidates for omission.
  - IDA may identify sparse areas in the bivariate distribution of covariates originally considered to form an interaction term. For example, if the range of age is considerably larger for women than for men, or if the number of women by far exceeds the number of men, an interaction term for age and sex may have only small likelihood to improve a model&#39;s fit, and consequently the analyst may choose to omit the interaction.
- For all domains, IDA may give rise to sensitivity analyses (see Thabane et al, 2013, BMC Med Res Meth)

### Guide interpretation of results

- Interpretation of regression coefficients changes if covariates have been omitted due to excessive missingness
- Interpretation of regression coefficients changes if covariates have been omitted due to near-collinearity with others
- Estimated effect sizes and associated confidence intervals have to be interpreted in context with the distribution of the covariate:

  - For continuous covariates with a narrow distribution, effect sizes may seem to be very large.
  - For categorical covariates with some rare levels, effect sizes are more likely to be extreme and associated with wider confidence intervals.

- A high correlation between covariates may explain wide confidence intervals for regression coefficients, or diverging results (changing signs of regression coefficients) if during model building several models with varying sets of included covariates are estimated (body fat example by height and weight).

### Guide presentation of results

- For categorical variables, IDA may guide the choice of reference category for presentation of the model.
- For continuous variables IDA may suggest scaling factors to obtain more interpretable regression coefficients.
- For continuous variables modeled using nonlinear methods such as splines or fractional polynomials, IDA may suggest a suitable reference point or values for which contrasts are presented.

### Guide presentation of data

- A data dictionary describing the variables, units of measurements, format, and values
- A table of characteristics of study participants describes the variables included in the regression model with their units of measurements, including missingness, overall and stratified by the pivotal covariates or important subpopulations. IDA guides the appropriate choice of statistical measures for concise description of distributions.
- An updated flow chart of the study reporting the number of participants with inclusion/exclusion criteria due to missing data, impossible values or other reasons.
- A description of findings showing deviations of expected and observed data properties, for example that indicated measurement errors or a problem in the recruitment process. A statement should be included to confirm no violated expectations, if appropriate.

## Concluding remarks

A general strategy should have enough utility to detect features of a data set that could affect the analysis by regression, or the interpretation or presentation of results. It should also be reduced to only necessary steps, as in too lengthy default reports important findings could be overlooked.

Here we devised a strategy which balances utility and parsimony. The strategy could be seen as a minimum set of analyses that an IDA should comprise in order to prepare regression analysis. Depending on the context of the analysis, an analyst may choose to add further elements, or to declare more than three covariates as pivotal. Some of these IDA elements could be modified if in a specific study they are found to be unsuitable. For example, in case of very small sample size, one could replace histograms or boxplots by dotplots, or reduce the number of statistics to be computed. Other simplifications, in particular in the domain of multivariate analyses, could be indicated if only few covariates are considered.

Although we the list of IDA tasks could be worked down according to our outline, specific projects may require a different sequence or it may even be necessary to cycle between specific tasks until &#39;convergence&#39;, e.g., once it has been decided that a variable should be omitted because of its distribution, the number of nonmissing cases available for the analysis may have to be recomputed, which could then lead to a different strategy to handle missing values.

We included the dependent variable in univariate evaluations, but intentionally excluded it from any multivariate analysis, as this may violate the principle that IDA should not touch the research question.

All changes to the SAP should be explicitly reported.

## Acknowledgment

We are grateful to comments of Alexandra Kaider, Andreas Gleiss and Daniela Dunkler on an earlier version of this document.

## References

Thabane, L., Mbuagbaw, L., Zhang, S., Samaan, Z., Marcucci, M., Ye, C., Thabane, M., Giangregorio, L., Dennis, B., Kosa, D., & et al. (2013). A tutorial on sensitivity analyses in clinical trials: the what, why, when and how. [BMC Medical Research Methodology, 13(1).](https://bmcmedresmethodol.biomedcentral.com/articles/10.1186/1471-2288-13-92)

Katherine J Lee, Kate Tilling, Rosie P Cornish, Roderick JA Little, Melanie L Bell, Els Goetghebeur, Joseph W Hogan, & James R Carpenter. (2020). Framework for the Treatment And Reporting of Missing data in Observational Studies: The TARMOS framework. [arXiv:2004.14066](https://arxiv.org/abs/2004.14066)