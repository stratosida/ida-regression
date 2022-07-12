# National Health and Nutrition Examination Survey (NHANES) {-}




# Introduction to NHANES

To demonstrate the workflow and content of IDA, we created a hypothetical research aim and corresponding statistical analysis plan, which is described in more detail in the section  [nhanes_IDAP](nhanes_IDAP.html).

**Hypothetical research aim for IDA**  
*is to develop a multivariable model for MVPA (minutes of moderate/vigorous physical activity).*

*MVPA can be used to examine factors distinguishing very active participants with large amounts of time spent on MVPA from others (using untransformed data) or distinguishing participants according to percentage changes in MVPA (logarithmic scale) thus de-emphasizing extreme values.*



## NHANES Dataset Description

The National Health and Nutrition Examination Survey (NHANES) is a program of studies designed to assess the health and nutritional status of adults and children in the United States. The survey examines a nationally representative sample of non-institutionalized US civilians using a multistage probability sampling design that considers geographical area and minority representation. Sample weights are generated to create nationally representative estimates for the US population and subgroups defined by age, sex, and race/ethnicity. [Link to CDC NHANES website](https://www.cdc.gov/nchs/nhanes/about_nhanes.htm). NHANES collects data on various health and behavior indicators, including physical activity and self‐reported diagnosis of prevalent health conditions such as diabetes mellitus, coronary artery disease, stroke, and cancer.

Physical activity was measured with a waist‐worn uniaxial accelerometer (AM‐7164; ActiGraph) for up to 7 days. Participants were asked to wear the devie while awake except when simming or bathing. Data were cleaned according to calibration specification and nonwear time defined by an interval of at least 60 consecutive minutes of zero activity intensity counts. Days with fewer than 10 hours of wear time were excluded and participants with at least 1 valid day of accelerometer data were included in the analysis. Mean counts per minute were calculated by dividing the sum of activity counts for a valid day by the number of minutes of wear time in that day across all valid days (Troiano 2008).

Moderate or vigorous intensity was based on count thresholds. Time spent in such activities was determined by summing minutes in a day where the count met the criterion for that intensity (Troiano 2008). 

The NHANES 2003–2004 and 2005–2006 have a total of 14,631 participants with accelerometry data. Participants aged 30 to 85 at the time they wore the accelerometer are included. Other inclusion criteria are in line with the choices for the prediction model of 5 year mortality presented by [Smirnova et al, J Gerontol A Biol Sci Med Sci 2020](https://doi.org/10.1093/gerona/glz193). The preparation of the data was based on "Organizing and Analyzing the Activity Data in NHANES"
  [Leroux et al, Statistics in Biosciences 2019](https://doi.org/10.1007/s12561-018-09229-9).  High quality processed activity data combined with mortality and demographic information can be downloaded and used in R with code from Andrew Leroux (https://andrew-leroux.github.io/rnhanesdata/articles).


### Variables

#### Outcome variable

MVPA (total minutes of moderate/vigorous physical activity which is defined as more than 2020 counts per minute) (`mvpa`, minutes)

#### Sociodemographic variables 

* age at examination  (i.e. when participants wore the device) (`age`, years)
* gender  (`gender`, "Male" and "Female")
* race/ethnicity (non-Hispanic "White", non-Hispanic "Black", "Mexican American", and "Other") 
* education ("Less than high school", "High school" (high school graduate/general educational development [GED]), "More than high school" (some college, and college graduate)) (`educationadult`)
* Person Months of Follow-up from MEC/Exam Date (`permth.exm`) (follow-up time in this cohort in years = permth.exm/12) 


#### Health and behavior variables 

* smoking status (Current, Former [those reporting quitting within the previous 6 months], and Never) (`smokecigs`)
* alcohol consumption (`drinkstatus`) (Non-Drinker, Moderate Drinker, Heavy Drinker, Missing alcohol)
* bmi (`bmi`, kg/m2)
* obesity (`bmi.cat`, No-Yes)
* diabetes (`diabetes`)
* congestive heart failure (`chf, No-Yes`)
* cancer (`cancer`, No-Yes)
* stroke (`stroke`, No-Yes)
* average systolic blood pressure using the 4 measurements per participant (`sys`, mmHg) 
* Total cholesterol  (`lbxtc`,  mg/dL)
* HDL cholesterol  (`lbdhdd`, mg/dL) 



#### Physical activity data
Summary measures are calculated due to the large size of minute level accelerometer-derived physical activity data. 

* total activity counts per day (`TAC/d`)
* total log activity count (`TLAC` log(1+TAC))
* total minutes of moderate/vigorous physical activity (`MVPA`)
* total accelerometer wear time (`WT`)
* total log activity count summary measures (`tlac.1`, `tlac.2`, …, `tlac.12`) in each 2-hr window, i.e. 12AM-2AM, 2AM-4AM, 4AM-6AM, etc.


## NHANES dataset contents

### Source dataset 

We refer to the source data set as the dataset available online [here](https://github.com/bailliem/ida-regression-private/tree/master/data)


### Data dictionary

Additional meta-data is added to the original *source* data set. We write this new modified data set back to the **data** folder after adding additional meta-data (units, labels).


Input object size:	 1196032 bytes;	 31 variables	 5972 observations
New object size:	1196032 bytes;	31 variables	5972 observations

```{=html}
<hr><h4>Data frame:a_nhanes</h4>5972 observations and 31 variables, maximum # NAs:395  
 <hr>
 <style>
 .hmisctable998529 {
 border: 1px solid gray;
 border-collapse: collapse;
 font-size: 100%;
 }
 .hmisctable998529 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable998529 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable998529" border="1">
 <tr><th>Name</th><th>Labels</th><th>Units</th><th>Levels</th><th>Class</th><th>Storage</th><th>NAs</th></tr>
 <tr><td>seqn</td><td>respondent sequence number</td><td></td><td></td><td>integer</td><td>integer</td><td>  0</td></tr>
 <tr><td>age</td><td>age</td><td>years</td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>gender</td><td>gender</td><td></td><td><a href="#levels.gender">2</a></td><td></td><td>integer</td><td>  0</td></tr>
 <tr><td>educationadult</td><td>education level</td><td></td><td><a href="#levels.educationadult">3</a></td><td></td><td>integer</td><td>  4</td></tr>
 <tr><td>smokecigs</td><td>smoking status</td><td></td><td><a href="#levels.smokecigs">3</a></td><td></td><td>integer</td><td>  2</td></tr>
 <tr><td>drinkstatus</td><td>alcohol consumption</td><td></td><td><a href="#levels.drinkstatus">4</a></td><td></td><td>integer</td><td>  0</td></tr>
 <tr><td>alcohol</td><td>alcohol consumption</td><td></td><td></td><td>integer</td><td>integer</td><td>395</td></tr>
 <tr><td>bmi</td><td>body mass index</td><td>kg/m2</td><td></td><td>numeric</td><td>double</td><td> 44</td></tr>
 <tr><td>diabetes</td><td>diabetes</td><td></td><td><a href="#levels.diabetes">2</a></td><td></td><td>integer</td><td>  0</td></tr>
 <tr><td>chf</td><td>congestive heart failure</td><td></td><td><a href="#levels.diabetes">2</a></td><td></td><td>integer</td><td>  0</td></tr>
 <tr><td>cancer</td><td>cancer</td><td></td><td><a href="#levels.diabetes">2</a></td><td></td><td>integer</td><td>  0</td></tr>
 <tr><td>stroke</td><td>stroke</td><td></td><td><a href="#levels.diabetes">2</a></td><td></td><td>integer</td><td>  0</td></tr>
 <tr><td>sys</td><td>Systolic blood pressure</td><td>mg/dl</td><td></td><td>integer</td><td>integer</td><td>274</td></tr>
 <tr><td>lbxtc</td><td>Total cholesterol</td><td>mg/dl</td><td></td><td>integer</td><td>integer</td><td>230</td></tr>
 <tr><td>lbdhdd</td><td>HDL cholesterol</td><td>mg/dl</td><td></td><td>integer</td><td>integer</td><td>230</td></tr>
 <tr><td>tac</td><td>total activity counts per day</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>tlac</td><td>total log activity count (log(1+activity))</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>mvpa</td><td>Moderate or vigorous physical activity</td><td>minutes</td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>wt</td><td>total accelerometer wear time</td><td>minutes</td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>tlac.1</td><td>total log actvity count 12:00AM-2:00AM</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>tlac.2</td><td>total log actvity count 2:00AM-4:00AM</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>tlac.3</td><td>total log actvity count 4:00AM-6:00AM</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>tlac.4</td><td>total log actvity count 6:00AM-8:00AM</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>tlac.5</td><td>total log actvity count 8:00AM-10:00AM</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>tlac.6</td><td>total log actvity count 10:00AM-12:00PM</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>tlac.7</td><td>total log actvity count 12:00PM-2:00PM</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>tlac.8</td><td>total log actvity count 2:00PM-4:00PM</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>tlac.9</td><td>total log actvity count 4:00PM-6:00PM</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>tlac.10</td><td>total log actvity count 6:00PM-8:00PM</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>tlac.11</td><td>total log actvity count 8:00PM-10:00PM</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>tlac.12</td><td>total log actvity count 10:00PM-12:00AM</td><td></td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 </table>

 <hr>
 <style>
 .hmisctable397822 {
 border: 1px solid gray;
 border-collapse: collapse;
 font-size: 100%;
 }
 .hmisctable397822 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable397822 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable397822" border="1">
 <tr><th>Variable</th><th>Levels</th></tr>
 <tr><td><a name="levels.gender">gender</a></td><td>Male</td></tr>
 <tr><td></td><td>Female</td></tr>
 <tr><td><a name="levels.smokecigs">educationadult</a></td><td>Less than high school</td></tr>
 <tr><td></td><td>High school</td></tr>
 <tr><td></td><td>More than high school</td></tr>
 <tr><td><a name="levels.gender">smokecigs</a></td><td>Never</td></tr>
 <tr><td></td><td>Former</td></tr>
 <tr><td></td><td>Current</td></tr>
 <tr><td><a name="levels.drinkstatus">drinkstatus</a></td><td>Moderate Drinker</td></tr>
 <tr><td></td><td>Non-Drinker</td></tr>
 <tr><td></td><td>Heavy Drinker</td></tr>
 <tr><td></td><td>Missing alcohol</td></tr>
 <tr><td><a name="levels.smokecigs">diabetes, chf</a></td><td>No</td></tr>
 <tr><td><a name="levels.drinkstatus">&emsp;cancer, stroke</a></td><td>Yes</td></tr>
 </table>

 <hr>

```



## References
Troiano RP, Berrigan D, Dodd KW, Mâsse LC, Tilert T, McDowell M. Physical activity in the United States measured by accelerometer. Med Sci Sports Exerc. 2008 Jan;40(1):181-8. doi: 10.1249/mss.0b013e31815a51b3. PMID: 18091006.

Leroux A, Di J, Smirnova E,  Mcguffey E, Cao Q, Bayatmokhtari E, Tabacu L, Zipunnikov V, Urbanek JK,  Crainiceanu C. Organizing and Analyzing the Activity Data in NHANES. Stat Biosci 11, 262–287 (2019). https://doi-org.proxy1.cl.msu.edu/10.1007/s12561-018-09229-9

Smirnova E,  Leroux A,   Tabacu L, Zipunnikov V, Crainiceanu C,  Urbanek JK. The Predictive Performance of Objective Measures of Physical Activity Derived From Accelerometry Data for 5-Year All-Cause Mortality in Older Adults: National Health and Nutritional Examination Survey 2003–2006, The Journals of Gerontology: Series A, Volume 75, Issue 9, September 2020, Pages 1779–1785, https://doi.org/10.1093/gerona/glz193


## Section session info


```
## R version 4.1.3 (2022-03-10)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 10 x64 (build 17763)
## 
## Matrix products: default
## 
## locale:
## [1] LC_COLLATE=English_Austria.1252  LC_CTYPE=English_Austria.1252   
## [3] LC_MONETARY=English_Austria.1252 LC_NUMERIC=C                    
## [5] LC_TIME=English_Austria.1252    
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
##  [1] Hmisc_4.6-0     Formula_1.2-4   survival_3.2-13 lattice_0.20-45
##  [5] forcats_0.5.1   stringr_1.4.0   dplyr_1.0.8     purrr_0.3.4    
##  [9] readr_2.1.2     tidyr_1.2.0     tibble_3.1.6    ggplot2_3.3.5  
## [13] tidyverse_1.3.1 here_1.0.1     
## 
## loaded via a namespace (and not attached):
##  [1] httr_1.4.2          sass_0.4.1          jsonlite_1.8.0     
##  [4] splines_4.1.3       modelr_0.1.8        bslib_0.3.1        
##  [7] assertthat_0.2.1    latticeExtra_0.6-29 cellranger_1.1.0   
## [10] yaml_2.3.5          pillar_1.7.0        backports_1.4.1    
## [13] glue_1.6.2          digest_0.6.29       checkmate_2.0.0    
## [16] RColorBrewer_1.1-2  rvest_1.0.2         colorspace_2.0-3   
## [19] htmltools_0.5.2     Matrix_1.4-0        pkgconfig_2.0.3    
## [22] broom_0.7.12        haven_2.4.3         bookdown_0.25      
## [25] scales_1.1.1        jpeg_0.1-9          tzdb_0.2.0         
## [28] htmlTable_2.4.0     generics_0.1.2      ellipsis_0.3.2     
## [31] withr_2.5.0         nnet_7.3-17         cli_3.2.0          
## [34] magrittr_2.0.2      crayon_1.5.1        readxl_1.3.1       
## [37] evaluate_0.15       fs_1.5.2            fansi_1.0.3        
## [40] xml2_1.3.3          foreign_0.8-82      data.table_1.14.2  
## [43] tools_4.1.3         hms_1.1.1           lifecycle_1.0.1    
## [46] munsell_0.5.0       reprex_2.0.1        cluster_2.1.2      
## [49] compiler_4.1.3      jquerylib_0.1.4     rlang_1.0.2        
## [52] grid_4.1.3          rstudioapi_0.13     htmlwidgets_1.5.4  
## [55] base64enc_0.1-3     rmarkdown_2.13      gtable_0.3.0       
## [58] DBI_1.1.2           R6_2.5.1            gridExtra_2.3      
## [61] lubridate_1.8.0     knitr_1.38          fastmap_1.1.0      
## [64] utf8_1.2.2          rprojroot_2.0.2     stringi_1.7.6      
## [67] Rcpp_1.0.8.3        vctrs_0.3.8         rpart_4.1.16       
## [70] png_0.1-7           dbplyr_2.1.1        tidyselect_1.1.2   
## [73] xfun_0.30
```
