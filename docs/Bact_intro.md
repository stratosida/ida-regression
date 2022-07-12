# Bacteremia {-}




# Introduction to Bacteremia

To demonstrate the workflow and content of IDA, we created a hypothetical research aim and corresponding statistical analysis plan, which is described in more detail in the section [Bact_SAP.Rmd](Bact_SAP.Rmd).

**Hypothetical research aim for IDA** is to develop a multivariable diagnostic model for bacteremia using 49 continuous laboratory blood parameters, age and gender with the primary aim of prediction and a secondary aim of describing the association of each variable with the outcome ('explaining' the multivariable model). 

A diagnostic prediction model was developed based on this data set and validated in "A Risk Prediction Model for Screening Bacteremic Patients: A Cross Sectional Study"  [Ratzinger et al, PLoS One 2014](https://doi.org/10.1371/journal.pone.0106765). The assumed research aim is in line with this diagnostic prediction model.


## Dataset Description

Ratzinger et al (2014) performed a diagnostic study in which age, sex and 49 laboratory variables can be used to diagnose bacteremia status  of a blood sample using a multivariable model.  Between January 2006 and December 2010, patients with the clinical suspicion to suffer from bacteraemia were included if blood culture analysis was requested by the responsible physician and blood was sampled for assessment of haematology and biochemistry. The data consists of 14,691 observations from different patients.

Our version of this data was slightly modified compared to original version, and this modified version was cleared by the Medical University of Vienna for public use (DC 2019-0054). Variable names have been kept as they were (partly German abbreviations). A data dictionary is available in the **misc** folder of the project directory ('bacteremia-DataDictionary.csv').

In the original paper describing the study [(Ratzinger et al, PLoS One 2014)](https://doi.org/10.1371/journal.pone.0106765), a machine learning approach was taken to diagnose a positive status of blood culture. The true status was determined for all blood samples by blood culture analysis, which is the gold standard. Here we will make use of a multivariable logistic regression model.


## Bacteremia dataset contents

### Source dataset 

We refer to the source data set as the dataset available in this repository.

Display the source dataset contents. This dataset is in the **data** folder of the project directory. 


```{=html}
<hr><h4>Data frame:bact</h4>14691 observations and 53 variables, maximum # NAs:7114  
 <hr>
 <style>
 .hmisctable802188 {
 border: 1px solid gray;
 border-collapse: collapse;
 font-size: 100%;
 }
 .hmisctable802188 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable802188 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable802188" border="1">
 <tr><th>Name</th><th>Storage</th><th>NAs</th></tr>
 <tr><td>ID</td><td>integer</td><td>   0</td></tr>
 <tr><td>sex</td><td>integer</td><td>   0</td></tr>
 <tr><td>Alter</td><td>integer</td><td>   0</td></tr>
 <tr><td>MCV</td><td>double</td><td>  42</td></tr>
 <tr><td>HGB</td><td>double</td><td>  41</td></tr>
 <tr><td>HCT</td><td>double</td><td>  42</td></tr>
 <tr><td>PLT</td><td>integer</td><td>  42</td></tr>
 <tr><td>MCH</td><td>double</td><td>  42</td></tr>
 <tr><td>MCHC</td><td>double</td><td>  42</td></tr>
 <tr><td>RDW</td><td>double</td><td>  56</td></tr>
 <tr><td>MPV</td><td>double</td><td> 702</td></tr>
 <tr><td>LYM</td><td>double</td><td> 262</td></tr>
 <tr><td>MONO</td><td>double</td><td> 246</td></tr>
 <tr><td>EOS</td><td>double</td><td> 135</td></tr>
 <tr><td>BASO</td><td>double</td><td> 146</td></tr>
 <tr><td>NT</td><td>integer</td><td>2467</td></tr>
 <tr><td>APTT</td><td>double</td><td>2549</td></tr>
 <tr><td>FIB</td><td>integer</td><td>2567</td></tr>
 <tr><td>NA.</td><td>integer</td><td>1282</td></tr>
 <tr><td>K</td><td>double</td><td>2008</td></tr>
 <tr><td>CA</td><td>double</td><td>1276</td></tr>
 <tr><td>PHOS</td><td>double</td><td>1242</td></tr>
 <tr><td>MG</td><td>double</td><td>1869</td></tr>
 <tr><td>KREA</td><td>double</td><td> 159</td></tr>
 <tr><td>BUN</td><td>double</td><td> 172</td></tr>
 <tr><td>HS</td><td>double</td><td>3061</td></tr>
 <tr><td>GBIL</td><td>double</td><td>1441</td></tr>
 <tr><td>TP</td><td>double</td><td>1583</td></tr>
 <tr><td>ALB</td><td>double</td><td>1676</td></tr>
 <tr><td>AMY</td><td>integer</td><td>3913</td></tr>
 <tr><td>PAMY</td><td>integer</td><td>7114</td></tr>
 <tr><td>LIP</td><td>integer</td><td>3699</td></tr>
 <tr><td>CHE</td><td>double</td><td>2447</td></tr>
 <tr><td>AP</td><td>integer</td><td>1400</td></tr>
 <tr><td>ASAT</td><td>integer</td><td>1154</td></tr>
 <tr><td>ALAT</td><td>integer</td><td> 987</td></tr>
 <tr><td>GGT</td><td>integer</td><td>1262</td></tr>
 <tr><td>LDH</td><td>integer</td><td>1714</td></tr>
 <tr><td>CK</td><td>integer</td><td>2080</td></tr>
 <tr><td>GLU</td><td>integer</td><td>4192</td></tr>
 <tr><td>TRIG</td><td>integer</td><td>5061</td></tr>
 <tr><td>CHOL</td><td>integer</td><td>5045</td></tr>
 <tr><td>CRP</td><td>double</td><td> 155</td></tr>
 <tr><td>BASOR</td><td>double</td><td> 732</td></tr>
 <tr><td>EOSR</td><td>double</td><td> 732</td></tr>
 <tr><td>LYMR</td><td>double</td><td> 732</td></tr>
 <tr><td>MONOR</td><td>double</td><td> 732</td></tr>
 <tr><td>NEU</td><td>double</td><td> 728</td></tr>
 <tr><td>NEUR</td><td>double</td><td> 732</td></tr>
 <tr><td>PDW</td><td>double</td><td>1102</td></tr>
 <tr><td>RBC</td><td>double</td><td> 461</td></tr>
 <tr><td>WBC</td><td>double</td><td> 462</td></tr>
 <tr><td>BloodCulture</td><td>character</td><td>   0</td></tr>
 </table>

 <hr>

```


### Updated analysis dataset

Additional meta-data is added to the original *source* data set. We write this new modified (annotated) data set back to the **data** folder after adding additional meta-data for all variables. The meta-data is taken from the data dictionary.

At the stage we could select the variables of interest to take in to the IDA phase by dropping variables we do not check in IDA.

As a cross check we display the contents again to ensure the additional data is added, and then write  the changes to the data folder in the file "data/a_bact.rda". 

Input object size:	 5119632 bytes;	 53 variables	 14691 observations
New object size:	5159904 bytes;	53 variables	14691 observations
Input object size:	 5277552 bytes;	 54 variables	 14691 observations
New object size:	5219544 bytes;	54 variables	14691 observations

```{=html}
<hr><h4>Data frame:a_bact</h4>14691 observations and 54 variables, maximum # NAs:7114  
 <hr>
 <style>
 .hmisctable970763 {
 border: 1px solid gray;
 border-collapse: collapse;
 font-size: 100%;
 }
 .hmisctable970763 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable970763 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable970763" border="1">
 <tr><th>Name</th><th>Labels</th><th>Units</th><th>Class</th><th>Storage</th><th>NAs</th></tr>
 <tr><td>ID</td><td>Patient Identification</td><td>1-14691</td><td>integer</td><td>integer</td><td>   0</td></tr>
 <tr><td>sex</td><td>Patient Sex</td><td>1=male, 2=female</td><td>integer</td><td>integer</td><td>   0</td></tr>
 <tr><td>Alter</td><td>Patient Age</td><td>years</td><td>integer</td><td>integer</td><td>   0</td></tr>
 <tr><td>MCV</td><td>Mean corpuscular volume</td><td>pg</td><td>numeric</td><td>double</td><td>  42</td></tr>
 <tr><td>HGB</td><td>Haemoglobin</td><td>G/L</td><td>numeric</td><td>double</td><td>  41</td></tr>
 <tr><td>HCT</td><td>Haematocrit</td><td>%</td><td>numeric</td><td>double</td><td>  42</td></tr>
 <tr><td>PLT</td><td>Blood platelets</td><td>G/L</td><td>integer</td><td>integer</td><td>  42</td></tr>
 <tr><td>MCH</td><td>Mean corpuscular hemoglobin</td><td>fl</td><td>numeric</td><td>double</td><td>  42</td></tr>
 <tr><td>MCHC</td><td>Mean corpuscular hemoglobin concentration</td><td>g/dl</td><td>numeric</td><td>double</td><td>  42</td></tr>
 <tr><td>RDW</td><td>Red blood cell distribution width</td><td>%</td><td>numeric</td><td>double</td><td>  56</td></tr>
 <tr><td>MPV</td><td>Mean platelet volume</td><td>fl</td><td>numeric</td><td>double</td><td> 702</td></tr>
 <tr><td>LYM</td><td>Lymphocytes</td><td>G/L</td><td>numeric</td><td>double</td><td> 262</td></tr>
 <tr><td>MONO</td><td>Monocytes</td><td>G/L</td><td>numeric</td><td>double</td><td> 246</td></tr>
 <tr><td>EOS</td><td>Eosinophils</td><td>G/L</td><td>numeric</td><td>double</td><td> 135</td></tr>
 <tr><td>BASO</td><td>Basophiles</td><td>G/L</td><td>numeric</td><td>double</td><td> 146</td></tr>
 <tr><td>NT</td><td>Normotest</td><td>%</td><td>integer</td><td>integer</td><td>2467</td></tr>
 <tr><td>APTT</td><td>Activated partial thromboplastin time</td><td>sec</td><td>numeric</td><td>double</td><td>2549</td></tr>
 <tr><td>FIB</td><td>Fibrinogen</td><td>mg/dl</td><td>integer</td><td>integer</td><td>2567</td></tr>
 <tr><td>NA.</td><td>Sodium</td><td>mmol/L</td><td>integer</td><td>integer</td><td>1282</td></tr>
 <tr><td>K</td><td>Potassium</td><td>mmol/L</td><td>numeric</td><td>double</td><td>2008</td></tr>
 <tr><td>CA</td><td>Calcium</td><td>mmol/L</td><td>numeric</td><td>double</td><td>1276</td></tr>
 <tr><td>PHOS</td><td>Phosphate</td><td>mmol/L</td><td>numeric</td><td>double</td><td>1242</td></tr>
 <tr><td>MG</td><td>Magnesium</td><td>mmol/L</td><td>numeric</td><td>double</td><td>1869</td></tr>
 <tr><td>KREA</td><td>Creatinine</td><td>mg/dl</td><td>numeric</td><td>double</td><td> 159</td></tr>
 <tr><td>BUN</td><td>Blood urea nitrogen</td><td>mg/dl</td><td>numeric</td><td>double</td><td> 172</td></tr>
 <tr><td>HS</td><td>Uric acid</td><td>mg/dl</td><td>numeric</td><td>double</td><td>3061</td></tr>
 <tr><td>GBIL</td><td>Bilirubin</td><td>mg/dl</td><td>numeric</td><td>double</td><td>1441</td></tr>
 <tr><td>TP</td><td>Total protein</td><td>G/L</td><td>numeric</td><td>double</td><td>1583</td></tr>
 <tr><td>ALB</td><td>Albumin</td><td>G/L</td><td>numeric</td><td>double</td><td>1676</td></tr>
 <tr><td>AMY</td><td>Amylase</td><td>U/L</td><td>integer</td><td>integer</td><td>3913</td></tr>
 <tr><td>PAMY</td><td>Pancreas amylase</td><td>U/L</td><td>integer</td><td>integer</td><td>7114</td></tr>
 <tr><td>LIP</td><td>Lipases</td><td>U/L</td><td>integer</td><td>integer</td><td>3699</td></tr>
 <tr><td>CHE</td><td>Cholinesterase</td><td>kU/L</td><td>numeric</td><td>double</td><td>2447</td></tr>
 <tr><td>AP</td><td>Alkaline phosphatase</td><td>U/L</td><td>integer</td><td>integer</td><td>1400</td></tr>
 <tr><td>ASAT</td><td>Aspartate transaminase</td><td>U/L</td><td>integer</td><td>integer</td><td>1154</td></tr>
 <tr><td>ALAT</td><td>Alanin transaminase</td><td>U/L</td><td>integer</td><td>integer</td><td> 987</td></tr>
 <tr><td>GGT</td><td>Gamma-glutamyl transpeptidase</td><td>G/L</td><td>integer</td><td>integer</td><td>1262</td></tr>
 <tr><td>LDH</td><td>Lactate dehydrogenase</td><td>U/L</td><td>integer</td><td>integer</td><td>1714</td></tr>
 <tr><td>CK</td><td>Creatinine kinases</td><td>U/L</td><td>integer</td><td>integer</td><td>2080</td></tr>
 <tr><td>GLU</td><td>Glucoses</td><td>mg/dl</td><td>integer</td><td>integer</td><td>4192</td></tr>
 <tr><td>TRIG</td><td>Triclyceride</td><td>mg/dl</td><td>integer</td><td>integer</td><td>5061</td></tr>
 <tr><td>CHOL</td><td>Cholesterol</td><td>mg/dl</td><td>integer</td><td>integer</td><td>5045</td></tr>
 <tr><td>CRP</td><td>C-reactive protein</td><td>mg/dl</td><td>numeric</td><td>double</td><td> 155</td></tr>
 <tr><td>BASOR</td><td>Basophile ratio</td><td>%</td><td>numeric</td><td>double</td><td> 732</td></tr>
 <tr><td>EOSR</td><td>Eosinophil ratio</td><td>%</td><td>numeric</td><td>double</td><td> 732</td></tr>
 <tr><td>LYMR</td><td>Lymphocyte ratio</td><td>% (mg/dl)</td><td>numeric</td><td>double</td><td> 732</td></tr>
 <tr><td>MONOR</td><td>Monocyte ratio</td><td>%</td><td>numeric</td><td>double</td><td> 732</td></tr>
 <tr><td>NEU</td><td>Neutrophiles</td><td>G/L</td><td>numeric</td><td>double</td><td> 728</td></tr>
 <tr><td>NEUR</td><td>Neutrophile ratio</td><td>%</td><td>numeric</td><td>double</td><td> 732</td></tr>
 <tr><td>PDW</td><td>Platelet distribution width</td><td>%</td><td>numeric</td><td>double</td><td>1102</td></tr>
 <tr><td>RBC</td><td>Red blood count</td><td>T/L</td><td>numeric</td><td>double</td><td> 461</td></tr>
 <tr><td>WBC</td><td>White blood count</td><td>G/L</td><td>numeric</td><td>double</td><td> 462</td></tr>
 <tr><td>BloodCulture</td><td>Blood culture result for bacteremia</td><td>no, yes</td><td>character</td><td>character</td><td>   0</td></tr>
 <tr><td>BC</td><td>bacteremia</td><td>0/1</td><td>integer</td><td>integer</td><td>   0</td></tr>
 </table>

 <hr>

```

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



