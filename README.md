# Initial data analysis in the context of regression modeling

<!-- badges: start -->
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Lifecycle:experimental](https://img.shields.io/badge/lifecycle-maturing-green.svg)](https://www.tidyverse.org/lifecycle/#maturing)
<!-- badges: end -->

#### -- Project Status: Active  [Active, On-Hold, Completed]
#### -- Project Updates: 

* last updated: 2020-07-01 by Marianne Huebner. Update: Add Readme file
* Date: 2020-06-30 by Mark Baillie. Update: Create Bookdown

#### Abbreviations
IDA - initial data analysis </br>
SAP - statistical analysis plan


# Repository to support the IDA regression manuscript 
The focus of this document/website is to provide examples on conducting initial data analysis (IDA) in a reproducible manner in the context of intended regression analyses.



## Project Description

The aim is to provide sample reports for initial data analyses before executing the statistical analysis plan (SAP) for regression modeling.

Six steps of the IDA framework are

1. Meta data set-up
2. Data cleaning
3. Data screening
4. Initial data reporting
5. Updating/refining the statistical analysis plan
6. reporting of IDA findings in research papers

In general, we assume that meta data exist and data cleaning has already been done. We created hypothetical statistical analyses plans for each of the data sets. 
 
## Project Outcomes
 
1. Sample IDA reports to illustrate steps 3 and 4 of the IDA framework
2. Recommendations for IDA (step 3 of IDA framework) 
2. Explanation and elaboration of potential consequences to the SAP as a result of IDA findings (step 5 of IDA framework)
3. Recommendations for reporting of IDA for regression analyses (step 6 of IDA framework)
4. Manuscript with scope of regression model, results and consequences of IDA 

 

## Installation instructions

The IDA reports are created with Rmarkdown and Bookdown. 

1. Environment: Rstudio
2. Create a project in Rstudio with subfolders "data" and "docs"
3. Download data sets to add to you data folder.
4. Download (which Rmd/ yml files?)
5. Run bookdown file?????


## Structure  


* main - General files
    * Statistical analysis plan (SAP) for three data sets  ("_bacteremia", "_crash2", "_nhanes")
    * univariate Rmarkdown ("univar_Rmd")
    * multivariate Rmarkdown files ("multivar_.Rmd")
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

Huebner M, le Cessie S, Schmidt CO, Vach W . A contemporary conceptual framework for initial data analysis. Observational Studies 2018; 4: 171-192. [Link](https://obsstudies.org/contemporary-conceptual-framework-initial-data-analysis/)

Huebner M, Vach W, le Cessie S, Schmidt C, Lusa L. Hidden Analyses: a review of reporting practice and recommendations for more transparent reporting of initial data analyses. BMC Med Res Meth 2020; 20:61 [Link](https://bmcmedresmethodol.biomedcentral.com/track/pdf/10.1186/s12874-020-00942-y)


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


