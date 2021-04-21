# CRASH-2 {-}




# Introduction to CRASH-2

Since a key principle of IDA is not to touch the research questions, before IDA commences the research aim and statistical analysis plan need to be in place. 
IDA may lead to an update or refinement of the analysis plan. To demonstrate the workflow and content of IDA, we created a hypothetical research aim and corresponding statistical analysis plan, which is described in more detail in the section [Crash2_SAP.Rmd](Crash2_SAP.Rmd).

**Hypothetical research aim for IDA** is to develop a multivariable model for early death (death within 28 days from injury) using nine independent variables of mixed type (continuous, categorical, semicontinuous) with the primary aim of prediction and a secondary aim of describing the association of each variable with the outcome. 

A prediction model was developed and validated based on this data set in "Predicting early death in patients with traumatic bleeding"  [Perel et al, BMJ 2012](https://doi.org/10.1136/bmj.e5166), [supplement available at]. The assumed research aim is in line with the prediction model


## CRASH-2 Description

Clinical Randomisation of an Antifibrinolyticin Significant Haemorrhage(CRASH-2)  was a large randomised placebo controlled trial among trauma patients with, or at risk of, significant haemorrhage, of the effects of antifibrinolytic treatment on death and transfusion requirement. The study is described at [the original trial website](http://crash2.lshtm.ac.uk/). A public version of the data set is found at a [repository of public data sets](http://biostat.mc.vanderbilt.edu/wiki/Main/DataSets) hosted by the Vanderbilt University's Department of Biostatistics (Prof. Frank Harrell Jr.).

The data set includes 20,207 patients and 44 variables. 

**Note:** In contrast to the analysis described in Perel et al, variables describing the economic region and the treatment allocation are missing in the public version of the data set, and while the data set contains 20,207 patients, the research paper mentions 20,127 patients having been included in the study.


## Crash2 dataset contents

### Source dataset 

We refer to the source data set as the dataset available online [here](http://biostat.mc.vanderbilt.edu/wiki/Main/DataSets)

Display the source dataset contents. This dataset is in the **data-raw** folder of the project directory. 


```{=html}
<hr><h4>Data frame:crash2</h4>20207 observations and 44 variables, maximum # NAs:17121  
 <hr>
 <style>
 .hmisctable414240 {
 border: 1px solid gray;
 border-collapse: collapse;
 font-size: 100%;
 }
 .hmisctable414240 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable414240 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable414240" border="1">
 <tr><th>Name</th><th>Labels</th><th>Units</th><th>Levels</th><th>Class</th><th>Storage</th><th>NAs</th></tr>
 <tr><td>entryid</td><td>Unique Numbers for Entry Forms</td><td></td><td></td><td>integer</td><td>integer</td><td>    0</td></tr>
 <tr><td>source</td><td>Method of Transmission of Entry Form to CC</td><td></td><td><a href="#levels.source">  5</a></td><td></td><td>integer</td><td>    0</td></tr>
 <tr><td>trandomised</td><td>Date of Randomization</td><td></td><td></td><td>Date</td><td>double</td><td>    0</td></tr>
 <tr><td>outcomeid</td><td>Unique Number From Outcome Database</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>sex</td><td></td><td></td><td><a href="#levels.sex">  2</a></td><td></td><td>integer</td><td>    1</td></tr>
 <tr><td>age</td><td></td><td></td><td></td><td></td><td>integer</td><td>    4</td></tr>
 <tr><td>injurytime</td><td>Hours Since Injury</td><td></td><td></td><td>numeric</td><td>double</td><td>   11</td></tr>
 <tr><td>injurytype</td><td></td><td></td><td><a href="#levels.injurytype">  3</a></td><td></td><td>integer</td><td>    0</td></tr>
 <tr><td>sbp</td><td>Systolic Blood Pressure</td><td>mmHg</td><td></td><td>integer</td><td>integer</td><td>  320</td></tr>
 <tr><td>rr</td><td>Respiratory Rate</td><td>/min</td><td></td><td>integer</td><td>integer</td><td>  191</td></tr>
 <tr><td>cc</td><td>Central Capillary Refille Time</td><td>s</td><td></td><td>integer</td><td>integer</td><td>  611</td></tr>
 <tr><td>hr</td><td>Heart Rate</td><td>/min</td><td></td><td>integer</td><td>integer</td><td>  137</td></tr>
 <tr><td>gcseye</td><td>Glasgow Coma Score Eye Opening</td><td></td><td></td><td>integer</td><td>integer</td><td>  732</td></tr>
 <tr><td>gcsmotor</td><td>Glasgow Coma Score Motor Response</td><td></td><td></td><td>integer</td><td>integer</td><td>  732</td></tr>
 <tr><td>gcsverbal</td><td>Glasgow Coma Score Verbal Response</td><td></td><td></td><td>integer</td><td>integer</td><td>  735</td></tr>
 <tr><td>gcs</td><td>Glasgow Coma Score Total</td><td></td><td></td><td>integer</td><td>integer</td><td>   23</td></tr>
 <tr><td>ddeath</td><td>Date of Death</td><td></td><td></td><td>Date</td><td>double</td><td>17121</td></tr>
 <tr><td>cause</td><td>Main Cause of Death</td><td></td><td><a href="#levels.cause">  7</a></td><td></td><td>integer</td><td>17118</td></tr>
 <tr><td>scauseother</td><td>Description of Other Cause of Death</td><td></td><td><a href="#levels.scauseother">227</a></td><td></td><td>integer</td><td>    0</td></tr>
 <tr><td>status</td><td>Status of Patient at Outcome if Alive</td><td></td><td><a href="#levels.status">  3</a></td><td></td><td>integer</td><td> 3169</td></tr>
 <tr><td>ddischarge</td><td>Date of discharge, transfer to other hospital or day 28 from randomization</td><td></td><td></td><td>Date</td><td>double</td><td> 3185</td></tr>
 <tr><td>condition</td><td>Condition of Patient at Outcome if Alive</td><td></td><td><a href="#levels.condition">  5</a></td><td></td><td>integer</td><td> 3251</td></tr>
 <tr><td>ndaysicu</td><td>Number of Days Spent in ICU</td><td></td><td></td><td>numeric</td><td>double</td><td>  182</td></tr>
 <tr><td>bheadinj</td><td>Significant Head Injury</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>bneuro</td><td>Neurosurgery Done</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>bchest</td><td>Chest Surgery Done</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>babdomen</td><td>Abdominal Surgery Done</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>bpelvis</td><td>Pelvis Surgery Done</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>bpe</td><td>Pulmonary Embolism</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>bdvt</td><td>Deep Vein Thrombosis</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>bstroke</td><td>Stroke</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>bbleed</td><td>Surgery for Bleeding</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>bmi</td><td>Myocardial Infarction</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>bgi</td><td>Gastrointestinal Bleeding</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>bloading</td><td>Complete Loading Dose of Trial Drug Given</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>bmaint</td><td>Complete Maintenance Dose of Trial Drug Given</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>btransf</td><td>Blood Products Transfusion</td><td></td><td></td><td>integer</td><td>integer</td><td>   80</td></tr>
 <tr><td>ncell</td><td>Number of Units of Red Call Products Transfused</td><td></td><td></td><td>numeric</td><td>double</td><td> 9963</td></tr>
 <tr><td>nplasma</td><td>Number of Units of Fresh Frozen Plasma Transfused</td><td></td><td></td><td>integer</td><td>integer</td><td> 9964</td></tr>
 <tr><td>nplatelets</td><td>Number of Units of Platelets Transfused</td><td></td><td></td><td>integer</td><td>integer</td><td> 9964</td></tr>
 <tr><td>ncryo</td><td>Number of Units of Cryoprecipitate Transfused</td><td></td><td></td><td>integer</td><td>integer</td><td> 9964</td></tr>
 <tr><td>bvii</td><td>Recombinant Factor VIIa Given</td><td></td><td></td><td>integer</td><td>integer</td><td>  374</td></tr>
 <tr><td>boxid</td><td>Treatment Box Number</td><td></td><td></td><td>integer</td><td>integer</td><td>    0</td></tr>
 <tr><td>packnum</td><td>Treatment Pack Number</td><td></td><td></td><td>integer</td><td>integer</td><td>    0</td></tr>
 </table>

 <hr>
 <style>
 .hmisctable478328 {
 border: 1px solid gray;
 border-collapse: collapse;
 font-size: 100%;
 }
 .hmisctable478328 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable478328 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable478328" border="1">
 <tr><th>Variable</th><th>Levels</th></tr>
 <tr><td><a name="levels.source">source</a></td><td>telephone</td></tr>
 <tr><td></td><td>telephone entered manually</td></tr>
 <tr><td></td><td>electronic CRF by email</td></tr>
 <tr><td></td><td>paper CRF enteredd in electronic CRF</td></tr>
 <tr><td></td><td>electronic CRF</td></tr>
 <tr><td><a name="levels.status">sex</a></td><td>male</td></tr>
 <tr><td></td><td>female</td></tr>
 <tr><td><a name="levels.source">injurytype</a></td><td>blunt</td></tr>
 <tr><td></td><td>penetrating</td></tr>
 <tr><td></td><td>blunt and penetrating</td></tr>
 <tr><td><a name="levels.cause">cause</a></td><td>bleeding</td></tr>
 <tr><td></td><td>head injury</td></tr>
 <tr><td></td><td>myocardial infarction</td></tr>
 <tr><td></td><td>stroke</td></tr>
 <tr><td></td><td>pulmonary embolism</td></tr>
 <tr><td></td><td>multi organ failure</td></tr>
 <tr><td></td><td>other</td></tr>
 <tr><td><a name="levels.cause">scauseother</a></td><td></td></tr>
 <tr><td></td><td>Acute Hypoxia</td></tr>
 <tr><td></td><td>ACUTE LUNG INJURY</td></tr>
 <tr><td></td><td>Acute Pulmonary Oedema</td></tr>
 <tr><td></td><td>Acute Renal Failure</td></tr>
 <tr><td></td><td>ACUTE RESPIRATORY DISTRESS SYNDROME (ARDS)</td></tr>
 <tr><td></td><td>acute respiratory failure</td></tr>
 <tr><td></td><td>acute respiratory failure+sepsis</td></tr>
 <tr><td></td><td>air amboli (embolism)</td></tr>
 <tr><td></td><td>Air embolism caused by penetrating lung trauma</td></tr>
 <tr><td></td><td>...</td></tr>
 <tr><td><a name="levels.source">status</a></td><td>discharged</td></tr>
 <tr><td></td><td>still in hospital</td></tr>
 <tr><td></td><td>transferred to other hospital</td></tr>
 <tr><td><a name="levels.cause">condition</a></td><td>no symptoms</td></tr>
 <tr><td></td><td>minor symptoms</td></tr>
 <tr><td></td><td>some restriction in lifestyle but independent</td></tr>
 <tr><td></td><td>dependent, but not requiring constant attention</td></tr>
 <tr><td></td><td>fully dependent, requiring attention day and night</td></tr>
 </table>

 <hr>

```


### Updated analysis dataset

Additional meta-data is added to the original *source* data set. We write this new modified data set back to the **data** folder after adding additional meta-data for the following variables:

* **age** - add label "Age" and unit "years". 
* **injury time** - add unit "hours". 
* **total Glasgow coma score** - add unit "points". 


At the stage we select the variables of interest to take in to the IDA phase by dropping variables we do not check in IDA.

As a cross check we display the contents again to ensure the additional data is added, and then write back the changes to the data folder in the file "data/a_crash2.rds". 

Input object size:	 1221480 bytes;	 12 variables	 20207 observations
New object size:	1223272 bytes;	12 variables	20207 observations
Input object size:	 1546808 bytes;	 14 variables	 20207 observations
New object size:	1385720 bytes;	14 variables	20207 observations

```{=html}
<hr><h4>Data frame:a_crash2</h4>20207 observations and 14 variables, maximum # NAs:17121  
 <hr>
 <style>
 .hmisctable564041 {
 border: 1px solid gray;
 border-collapse: collapse;
 font-size: 100%;
 }
 .hmisctable564041 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable564041 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable564041" border="1">
 <tr><th>Name</th><th>Labels</th><th>Units</th><th>Levels</th><th>Class</th><th>Storage</th><th>NAs</th></tr>
 <tr><td>entryid</td><td>Unique Numbers for Entry Forms</td><td></td><td></td><td>integer</td><td>integer</td><td>    0</td></tr>
 <tr><td>trandomised</td><td>Date of Randomization</td><td></td><td></td><td>Date</td><td>double</td><td>    0</td></tr>
 <tr><td>ddeath</td><td>Date of Death</td><td></td><td></td><td>Date</td><td>double</td><td>17121</td></tr>
 <tr><td>age</td><td>Age</td><td>years</td><td></td><td>integer</td><td>integer</td><td>    4</td></tr>
 <tr><td>sex</td><td>Sex</td><td></td><td><a href="#levels.sex">2</a></td><td></td><td>integer</td><td>    1</td></tr>
 <tr><td>sbp</td><td>Systolic Blood Pressure</td><td>mmHg</td><td></td><td>integer</td><td>integer</td><td>  320</td></tr>
 <tr><td>hr</td><td>Heart Rate</td><td>/min</td><td></td><td>integer</td><td>integer</td><td>  137</td></tr>
 <tr><td>rr</td><td>Respiratory Rate</td><td>/min</td><td></td><td>integer</td><td>integer</td><td>  191</td></tr>
 <tr><td>gcs</td><td>Glasgow Coma Score Total</td><td>points</td><td></td><td>integer</td><td>integer</td><td>   23</td></tr>
 <tr><td>cc</td><td>Central Capillary Refille Time</td><td>s</td><td></td><td>integer</td><td>integer</td><td>  611</td></tr>
 <tr><td>injurytime</td><td>Hours Since Injury</td><td>hours</td><td></td><td>numeric</td><td>double</td><td>   11</td></tr>
 <tr><td>injurytype</td><td>Injury type</td><td></td><td><a href="#levels.injurytype">3</a></td><td></td><td>integer</td><td>    0</td></tr>
 <tr><td>time2death</td><td></td><td></td><td></td><td></td><td>integer</td><td>17121</td></tr>
 <tr><td>earlydeath</td><td>Death within 28 days from injury</td><td></td><td></td><td>integer</td><td>integer</td><td>    0</td></tr>
 </table>

 <hr>
 <style>
 .hmisctable107197 {
 border: 1px solid gray;
 border-collapse: collapse;
 font-size: 100%;
 }
 .hmisctable107197 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable107197 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable107197" border="1">
 <tr><th>Variable</th><th>Levels</th></tr>
 <tr><td><a name="levels.sex">sex</a></td><td>male</td></tr>
 <tr><td></td><td>female</td></tr>
 <tr><td><a name="levels.sex">injurytype</a></td><td>blunt</td></tr>
 <tr><td></td><td>penetrating</td></tr>
 <tr><td></td><td>blunt and penetrating</td></tr>
 </table>

 <hr>

```

## Section session info


```
## R version 4.0.2 (2020-06-22)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 10 x64 (build 18363)
## 
## Matrix products: default
## 
## locale:
## [1] LC_COLLATE=English_United States.1252 
## [2] LC_CTYPE=English_United States.1252   
## [3] LC_MONETARY=English_United States.1252
## [4] LC_NUMERIC=C                          
## [5] LC_TIME=English_United States.1252    
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
##  [1] Hmisc_4.5-0     Formula_1.2-4   survival_3.1-12 lattice_0.20-41
##  [5] forcats_0.5.1   stringr_1.4.0   dplyr_1.0.5     purrr_0.3.4    
##  [9] readr_1.4.0     tidyr_1.1.3     tibble_3.1.0    ggplot2_3.3.3  
## [13] tidyverse_1.3.0 here_1.0.1     
## 
## loaded via a namespace (and not attached):
##  [1] httr_1.4.2          sass_0.3.1          jsonlite_1.7.2     
##  [4] splines_4.0.2       modelr_0.1.8        bslib_0.2.4        
##  [7] assertthat_0.2.1    latticeExtra_0.6-29 cellranger_1.1.0   
## [10] yaml_2.2.1          pillar_1.5.1        backports_1.2.1    
## [13] glue_1.4.2          digest_0.6.27       checkmate_2.0.0    
## [16] RColorBrewer_1.1-2  rvest_0.3.6         colorspace_2.0-0   
## [19] htmltools_0.5.1.1   Matrix_1.3-2        pkgconfig_2.0.3    
## [22] broom_0.7.4         haven_2.3.1         bookdown_0.21      
## [25] scales_1.1.1        jpeg_0.1-8.1        htmlTable_2.1.0    
## [28] generics_0.1.0      ellipsis_0.3.1      withr_2.4.1        
## [31] nnet_7.3-14         cli_2.3.1           magrittr_2.0.1     
## [34] crayon_1.4.1        readxl_1.3.1        evaluate_0.14      
## [37] fs_1.5.0            fansi_0.4.2         xml2_1.3.2         
## [40] foreign_0.8-80      data.table_1.14.0   tools_4.0.2        
## [43] hms_1.0.0           lifecycle_1.0.0     munsell_0.5.0      
## [46] reprex_1.0.0        cluster_2.1.0       compiler_4.0.2     
## [49] jquerylib_0.1.3     rlang_0.4.10        grid_4.0.2         
## [52] rstudioapi_0.13     htmlwidgets_1.5.3   base64enc_0.1-3    
## [55] rmarkdown_2.7       gtable_0.3.0        DBI_1.1.1          
## [58] R6_2.5.0            gridExtra_2.3       lubridate_1.7.9.2  
## [61] knitr_1.31          utf8_1.1.4          rprojroot_2.0.2    
## [64] stringi_1.5.3       rmdformats_1.0.1    Rcpp_1.0.6         
## [67] vctrs_0.3.6         rpart_4.1-15        png_0.1-7          
## [70] dbplyr_2.1.0        tidyselect_1.1.0    xfun_0.21
```



