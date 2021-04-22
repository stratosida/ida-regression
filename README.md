# Initial data analysis in the context of regression modeling

<!-- badges: start -->
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Lifecycle:experimental](https://img.shields.io/badge/lifecycle-maturing-green.svg)](https://www.tidyverse.org/lifecycle/#maturing)
<a alt = "Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public." href="http://www.repostatus.org/#wip"><img src="http://www.repostatus.org/badges/latest/wip.svg" height = 20 /></a>
<!-- badges: end -->

This bookdown book is a *work in progress*. We'll update this `README` and the repo status when ready! 

#### -- Project Updates: 

* last updated: 2021-04-17 by Marianne Huebner. Update: Added NHANES Example
* Date: 2021-03-30 by Georg Heinze. Update: Created bact_dev branch with Bacteremia Example
* Date: 2020-06-30 by Mark Baillie. Update: Create Bookdown and added Crash-2 Example

#### Abbreviations
SAP - statistical analysis plan </br>
IDA - initial data analysis </br>
IDAP - initial data analysis plan 


# Repository for IDA for regression modeling 
The focus of this document/website is to provide examples on conducting initial data analysis in a reproducible manner in the context of intended regression analyses.


## Project Description

**Objective:**  Develop initial data analysis plan (IDAP) and provide sample reports for IDA before executing the statistical analysis plan (SAP) for regression modeling.

Six steps of the IDA framework [Ref 1] are

1. Meta data set-up
2. Data cleaning
3. Data screening
4. Initial data reporting
5. Updating/refining the statistical analysis plan
6. Reporting of IDA findings in research papers [Ref 2]

For our objective, we assume that meta data exist and data cleaning has already been done. We created hypothetical statistical analyses plans for each of the data sets. 
 
## Project Outcomes
 
1. Sample IDA plans and IDA reports to illustrate data screening and initial reporting (steps 3 and 4 of the IDA framework)
2. Recommendations for numerical and graphical summaries (step 3 of IDA framework) 
2. Explanation and elaboration of potential consequences to the SAP as a result of IDA findings (step 5 of IDA framework)
3. Recommendations for reporting of IDA for regression analyses (step 6 of IDA framework)
4. Manuscript with scope of regression model, generic IDA strategy, examples with IDA discoveries and consequences
 
## Installation instructions

The IDA reports are created with R, Rstudio, and Bookdown. 
Here are the requirements to preview the site locally: 

1. Get a local copy of the website source.
   
2. Start R in your new directory. 
   
3. Install the required packages. This can be achieved through the use pak or similar to install the needed packages (only the ones that you don't already have) using the [pak package](https://pak.r-lib.org/index.html).
```r
pkg_list <- c("bookdown", "devtools", "glue", "gridExtra",  "htmltools",
              "httr", "knitr", "RColorBrewer", "rebird", "rmarkdown",
              "tidyverse", "usethis", "rstudio/gt")

# install.packages("pak")
pak::pkg_install(pkg_list)
```

You should now be able to render the site in all the usual ways for bookdown, such as `bookdown::render_book()` or *Addins > Preview Book*.

Beware: the package list above is currently static, so consider that it may not be up to date.


## Structure  


* main - General files
    * Explanation of the IDA framework ("IDA_framework.Rmd")
    * Scope of the regression models for this project ("scope.Rmd")
    * Description of possible IDA actions ("data_screen.Rmd")
    * General IDA strategy for regression models within this scope ("GeneralStrategy.md")
    * Introduction of each of the three data sets  ("_intro_.Rmd") with appropriate naming extensions ("bact_", "CRASH2_", "nhanes_")
    * Initial data analysis plan for each data set ("_IDAP.Rmd")
    * Missingness IDA for each data set ("_missing_.Rmd")
    * Univariate IDA for each data set("_univar.Rmd")
    * Multivariate IDA for each data set ("_multivar.Rmd")
    * Global file that includes these files as chapters ("bookdown.yml", "index.Rmd")
    
* data-raw - Repository for original data sets and their data dictionaries 
    * Crash-2  (Publication [Ref 3], Data sets from Vanderbilt University](http://biostat.mc.vanderbilt.edu/wiki/Main/DataSets; on this github repository)
    * Bacteremia  (Publication [Ref 4] modified from original per Medical University of Vienna, Austria; on this github repository) 
    * NHANES  (Publications [Ref 6 and 7], downloaded from CDC [Ref 5];  on this github repository)

* data - Repository for analysis data sets
    * a_bact.rda  
    * a_crash2.rda  
    * a_nhanes.rda  
    
* docs - IDA reports
    * html outputs of IDA
    * references
    
* R - R functions for data visualization and transformations used in the R markdown files

* assets - style files and images

* js - functions needed to build book

* Misc
  * Data dictionaries for the data sets
  * References for research studies using the data sets
  * older files

## References

### Initial data analysis
[1] Huebner M, le Cessie S, Schmidt CO, Vach W . A contemporary conceptual framework for initial data analysis. Observational Studies 2018; 4: 171-192. [Link](https://obsstudies.org/contemporary-conceptual-framework-initial-data-analysis/)

[2] Huebner M, Vach W, le Cessie S, Schmidt C, Lusa L. Hidden Analyses: a review of reporting practice and recommendations for more transparent reporting of initial data analyses. BMC Med Res Meth 2020; 20:61 [Link](https://bmcmedresmethodol.biomedcentral.com/track/pdf/10.1186/s12874-020-00942-y)

### CRASH-2 data set
[3] Perel P, Prieto-Merino D, Shakur H, Clayton T, Lecky F, Bouamra O, Russell R, Faulkner M, Steyerberg EW, Roberts I. Predicting early death in patients with traumatic bleeding: development and validation of prognostic model. BMJ 2012; 345(aug15 1): e5166. http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/crash2.rda

### Bacteremia data set
[4] Ratzinger F, Dedeyan M, Rammerstorfer M, Perkmann T, Burgmann H, et al. (2014) A Risk Prediction Model for Screening Bacteremic Patients: A Cross Sectional Study. PLoS ONE 9(9): e106765. doi:10.1371/journal.pone.0106765

### NHANES dataset
[5] Centers for Disease Control and Prevention: National Health and Nutrition Examination Survey (NHANES). https://cdc.gov/nhanes/index.htm

[6] Leroux A, Di J, Smirnova E, Mcguffey EJ, Cao Q, Bayatmokhtari E, Tabacu L, Zipunnikov V,  Urbanek JK, Crainiceanu C. Organizing and Analyzing the Activity Data in NHANES. Statistics in Biosciences 2019 (11), 262–287. (https://doi-org.proxy1.cl.msu.edu/10.1007/s12561-018-09229-9)

[7] Smirnova E, Leroux A, Cao Q, Tabacu L, Zipunnikov V, Crainiceanu C, Urbanek JK. The Predictive Performance of Objective Measures of Physical Activity Derived From Accelerometry Data for 5-Year All-Cause Mortality in Older Adults: National Health and Nutritional Examination Survey 2003-2006. J Gerontol A Biol Sci Med Sci. 2020 Sep 16;75(9):1779-1785. doi: 10.1093/gerona/glz193. 





## Funding

None. </br>
Contributors are from the [STRATOS Initiative](https://stratos-initiative.org).

-TG2: Selection of variables and functional forms in multivariable analyses.</br>
-[TG3](https://www.stratosida.org): Initial data analysis

## Authors

Mark Baillie </br>
Novartis, </br>
Email: mark.baillie@novartis.com

Georg Heinze </br>
Medical University, Vienna, Austria</br>
Email: georg.heinze@meduniwien.ac.at

Marianne Huebner </br>
Department of Statistics and Probability, Michigan State University, East Lansing, MI, USA</br>
Email: huebner@msu.edu


