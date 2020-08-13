# Initial data analysis in the context of regression modeling

<!-- badges: start -->
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Lifecycle:experimental](https://img.shields.io/badge/lifecycle-maturing-green.svg)](https://www.tidyverse.org/lifecycle/#maturing)
<a alt = "Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public." href="http://www.repostatus.org/#wip"><img src="http://www.repostatus.org/badges/latest/wip.svg" height = 20 /></a>
<!-- badges: end -->

This bookdown book is a *work in progress*. We'll update this `README` and the repo status when ready! 

#### -- Project Updates: 

* last updated: 2020-07-01 by Marianne Huebner. Update: Add Readme file
* Date: 2020-06-30 by Mark Baillie. Update: Create Bookdown

#### Abbreviations
IDA - initial data analysis </br>
SAP - statistical analysis plan


# Repository for IDA for regression modeling 
The focus of this document/website is to provide examples on conducting initial data analysis in a reproducible manner in the context of intended regression analyses.


## Project Description

**Objective:**  provide sample reports for initial data analyses (IDA) before executing the statistical analysis plan (SAP) for regression modeling.

Six steps of the IDA framework [Ref 1] are

1. Meta data set-up
2. Data cleaning
3. Data screening
4. Initial data reporting
5. Updating/refining the statistical analysis plan
6. Reporting of IDA findings in research papers

For our objective, we assume that meta data exist and data cleaning has already been done. We created hypothetical statistical analyses plans for each of the data sets. 
 
## Project Outcomes
 
1. Sample IDA reports to illustrate data screening and initial reporting (steps 3 and 4 of the IDA framework)
2. Recommendations for IDA (step 3 of IDA framework) 
2. Explanation and elaboration of potential consequences to the SAP as a result of IDA findings (step 5 of IDA framework)
3. Recommendations for reporting of IDA for regression analyses (step 6 of IDA framework)
4. Manuscript with scope of regression model, results, and consequences of IDA 

 
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

Note: the package list above is currently static, so consider that it may not be up to date.


## Structure  


* main - General files
    * Statistical analysis plan (SAP) for three data sets  ("_bacteremia", "_crash2", "_nhanes")
    * univariate IDA Rmarkdown ("univar_.Rmd")
    * multivariate IDA Rmarkdown files ("multivar_.Rmd")
    * missingness IDA Rmarkdown files ("multivar_.Rmd")
    * bookdown file ("bookdown.yml")
    
* data - Repository for example data sets and their data dictionaries *(add data sets to Open Science Framework?)*
    * Bacteremia
    * Crash2  [Data sets from Vanderbilt University](http://biostat.mc.vanderbilt.edu/wiki/Main/DataSets) 
    * NHANES
    
* docs - IDA reports
    * html outputs of IDA
    * references
    
* R - R functions for data visualization

## References

[1] Huebner M, le Cessie S, Schmidt CO, Vach W . A contemporary conceptual framework for initial data analysis. Observational Studies 2018; 4: 171-192. [Link](https://obsstudies.org/contemporary-conceptual-framework-initial-data-analysis/)

[2] Huebner M, Vach W, le Cessie S, Schmidt C, Lusa L. Hidden Analyses: a review of reporting practice and recommendations for more transparent reporting of initial data analyses. BMC Med Res Meth 2020; 20:61 [Link](https://bmcmedresmethodol.biomedcentral.com/track/pdf/10.1186/s12874-020-00942-y)


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


