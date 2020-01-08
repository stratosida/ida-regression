-   [About](#about)
-   [Set up](#set-up)
-   [Read data](#read-data)
-   [Check data](#check-data)
-   [Save data sets](#save-data-sets)
-   [Session info](#session-info)

About
=====

This notebook is for final processing of data prior to IDA
e.g. completing missing meta-data, labels, etc.

Set up
======

Set up packages and path to the data set.

``` r
library(rmarkdown)
library(ggplot2)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(tidyr)
library(Hmisc)
```

    ## Loading required package: lattice

    ## Loading required package: survival

    ## Loading required package: Formula

    ## 
    ## Attaching package: 'Hmisc'

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     src, summarize

    ## The following objects are masked from 'package:base':
    ## 
    ##     format.pval, units

``` r
library(here)
```

    ## here() starts at C:/R/ida-regression-private

Read data
=========

TODO:add variable to indicate measurement type:

-   med history
-   outcome
-   Add additional metadata on measurement schedule

Load the CRS dataset.

``` r
load(here("data","crs.Rdata"))
```

Check data
==========

Check data contents and complete any misssing information including
labels or units.

display the data set contents.

``` r
Hmisc::contents(crs) 
```

    ## 
    ## Data frame:crs   345 observations and 44 variables    Maximum # NAs:268
    ## 
    ## 
    ##                                                                      Labels
    ## id                                                   identifier of patients
    ## los                                                          length of stay
    ## agenew                                                       age at surgery
    ## sex                                                                     sex
    ## bmi                                                                        
    ## asa             American Society of Anesthesiologists physical status score
    ## priorabdsurgery                                     prior abdominal surgery
    ## mis                                                minimal invasive surgery
    ## preopxrt                                             preoperative radiation
    ## preopchemo                                        preoperative chemotherapy
    ## readmit30                           readmisison within 30 days post surgery
    ## death30                                   death within 30 days post surgery
    ## anemiatransf                                   blood transfusion for anemia
    ## afib                                                  arterial fibrillation
    ## chf                                               congesitive heart failure
    ## mi                                                     myocardio infarction
    ## dvtpe                                                deep venous thrombosis
    ## arf                                                       arrthymia failure
    ## respfail                                                respiratory failure
    ## ileus                               partial small bowel obstruction (ileus)
    ## sboreop                                                                    
    ## reopbleed                             reoperation for bleeding complication
    ## winfect                                                     wound infection
    ## abscessleak                                                 abscess or leak
    ## pneumonia                                                                  
    ## uti                                                 urinary tract infection
    ## day1stbm                                       days to first bowel movement
    ## primaryproc                                               primary procedure
    ## diabetes                                                           diabetes
    ## hf                                                                         
    ## pvd                                                            pulmonary vd
    ## copd                                                                   COPD
    ## renal                                  acute or chronic renal insufficiency
    ## tobaccoever                                                    smoking ever
    ## tobaccocurrent                                              smoking current
    ## crohn                                                       Crohn's disease
    ## ulcercol                                                  ulceratie colitis
    ## ibd                                              inflammatory bowel disease
    ## t2comp                                           days to first complication
    ## comp                                                          complications
    ## t2comp_pre                      days to first complication before dismissal
    ## comp_pre                                      complication before dismissal
    ## num_comp                                            number of complications
    ## dc2fu                                                     days to follow-up
    ##                 Units Levels     Class   Storage NAs
    ## id                           character character   0
    ## los              days          integer   integer   0
    ## agenew          years          numeric    double   0
    ## sex                        2             integer   0
    ## bmi                                       double   0
    ## asa                        4             integer   0
    ## priorabdsurgery            2             integer   0
    ## mis                        2             integer   0
    ## preopxrt                   2             integer   0
    ## preopchemo                 2             integer   0
    ## readmit30                  2             integer   0
    ## death30                    2             integer   0
    ## anemiatransf               2             integer   0
    ## afib                       2             integer   0
    ## chf                        2             integer   0
    ## mi                         2             integer   0
    ## dvtpe                      2             integer   0
    ## arf                        2             integer   0
    ## respfail                   2             integer   0
    ## ileus                      2             integer   0
    ## sboreop                    2             integer   0
    ## reopbleed                  2             integer   0
    ## winfect                    2             integer   0
    ## abscessleak                2             integer   0
    ## pneumonia                  2             integer   0
    ## uti                        2             integer   0
    ## day1stbm         days          integer   integer  40
    ## primaryproc                3             integer   0
    ## diabetes                   2             integer   0
    ## hf                         2             integer   0
    ## pvd                        2             integer   0
    ## copd                       2             integer   0
    ## renal                      2             integer   0
    ## tobaccoever                2             integer   0
    ## tobaccocurrent             2             integer   0
    ## crohn                      2             integer   0
    ## ulcercol                   2             integer   0
    ## ibd                        2             integer   0
    ## t2comp           days          integer   integer 244
    ## comp                       2             integer   0
    ## t2comp_pre       days          integer   integer 268
    ## comp_pre                   2             integer   0
    ## num_comp                       integer   integer   0
    ## dc2fu            days          integer   integer   0
    ## 
    ## +---------------+-----------------------+
    ## |Variable       |Levels                 |
    ## +---------------+-----------------------+
    ## |sex            |female,male            |
    ## +---------------+-----------------------+
    ## |asa            |1,2,3,4                |
    ## +---------------+-----------------------+
    ## |priorabdsurgery|0,1                    |
    ## |mis            |                       |
    ## |preopxrt       |                       |
    ## |preopchemo     |                       |
    ## |readmit30      |                       |
    ## |death30        |                       |
    ## |anemiatransf   |                       |
    ## |afib           |                       |
    ## |chf            |                       |
    ## |mi             |                       |
    ## |dvtpe          |                       |
    ## |arf            |                       |
    ## |respfail       |                       |
    ## |ileus          |                       |
    ## |sboreop        |                       |
    ## |reopbleed      |                       |
    ## |winfect        |                       |
    ## |abscessleak    |                       |
    ## |pneumonia      |                       |
    ## |uti            |                       |
    ## |diabetes       |                       |
    ## |hf             |                       |
    ## |pvd            |                       |
    ## |copd           |                       |
    ## |renal          |                       |
    ## |tobaccoever    |                       |
    ## |tobaccocurrent |                       |
    ## |crohn          |                       |
    ## |ulcercol       |                       |
    ## |ibd            |                       |
    ## |comp           |                       |
    ## |comp_pre       |                       |
    ## +---------------+-----------------------+
    ## |primaryproc    |LAR,APR,Proctocolectomy|
    ## +---------------+-----------------------+

Add missing label for BMI.

``` r
a_crs <- crs %>%
  Hmisc::upData(labels = c(bmi = 'body mass index'))
```

    ## Input object size:    124504 bytes;   44 variables    345 observations
    ## New object size: 123656 bytes;   44 variables    345 observations

Save data sets
==============

Save the updated data set.

``` r
save(crs, a_crs, file = here("data","a_crs.Rdata"))
```

Session info
============

``` r
sessionInfo()
```

    ## R version 3.5.3 (2019-03-11)
    ## Platform: x86_64-w64-mingw32/x64 (64-bit)
    ## Running under: Windows 10 x64 (build 17763)
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
    ## [1] here_0.1          Hmisc_4.2-0       Formula_1.2-3     survival_2.44-1.1
    ## [5] lattice_0.20-38   tidyr_1.0.0       dplyr_0.8.3       ggplot2_3.2.1    
    ## [9] rmarkdown_1.12   
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] tidyselect_0.2.5    xfun_0.6            purrr_0.3.3        
    ##  [4] splines_3.5.3       colorspace_1.4-1    vctrs_0.2.1        
    ##  [7] htmltools_0.3.6     yaml_2.2.0          base64enc_0.1-3    
    ## [10] rlang_0.4.2         pillar_1.4.2        foreign_0.8-71     
    ## [13] glue_1.3.1          withr_2.1.2         RColorBrewer_1.1-2 
    ## [16] lifecycle_0.1.0     stringr_1.4.0       munsell_0.5.0      
    ## [19] gtable_0.3.0        htmlwidgets_1.3     evaluate_0.13      
    ## [22] latticeExtra_0.6-28 knitr_1.26          htmlTable_1.13.1   
    ## [25] Rcpp_1.0.1          acepack_1.4.1       backports_1.1.3    
    ## [28] scales_1.0.0        checkmate_1.9.1     gridExtra_2.3      
    ## [31] digest_0.6.20       stringi_1.4.3       rprojroot_1.3-2    
    ## [34] grid_3.5.3          tools_3.5.3         magrittr_1.5       
    ## [37] lazyeval_0.2.2      tibble_2.1.3        cluster_2.0.7-1    
    ## [40] crayon_1.3.4        pkgconfig_2.0.2     zeallot_0.1.0      
    ## [43] Matrix_1.2-17       data.table_1.12.2   assertthat_0.2.1   
    ## [46] rstudioapi_0.10     R6_2.4.0            rpart_4.1-13       
    ## [49] nnet_7.3-12         compiler_3.5.3
