-   [Read data](#read-data)
-   [Descriptive summary](#descriptive-summary)
    -   [Medical history](#medical-history)
    -   [Patient characteristics](#patient-characteristics)
-   [Session info](#session-info)

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

    ## here() starts at /cloud/project

``` r
## Set global ggplot theme
theme_set(theme_light(base_size = 12))
```

Read data
---------

Load the CRS dataset.

Note: crs is the original source data and a\_crs is the updated analysis
ready dataset with additional meta-data added.

``` r
load(here("data","a_crs.Rdata"))
```

Descriptive summary
===================

Univariate analyses.

Calculate the number of patients.

``` r
bigN <- nrow(crs)
print(bigN)
```

    ## [1] 345

Medical history
---------------

A summary of medical history measured at *diagnosis* (TODO: check when
medical history / comorbidities were assessed): \* AFib, \* MI \* CHF \*
Diabetes \* Crohn’s disease

Print out descriptive summary.

``` r
a_crs %>% 
  select(chf, afib, mi, diabetes, crohn, ulcercol, ibd) %>%
  Hmisc::describe()
```

    ## . 
    ## 
    ##  7  Variables      345  Observations
    ## --------------------------------------------------------------------------------
    ## chf : congesitive heart failure 
    ##        n  missing distinct 
    ##      345        0        2 
    ##                       
    ## Value          0     1
    ## Frequency    332    13
    ## Proportion 0.962 0.038
    ## --------------------------------------------------------------------------------
    ## afib : arterial fibrillation 
    ##        n  missing distinct 
    ##      345        0        2 
    ##                       
    ## Value          0     1
    ## Frequency    341     4
    ## Proportion 0.988 0.012
    ## --------------------------------------------------------------------------------
    ## mi : myocardio infarction 
    ##        n  missing distinct 
    ##      345        0        2 
    ##                       
    ## Value          0     1
    ## Frequency    344     1
    ## Proportion 0.997 0.003
    ## --------------------------------------------------------------------------------
    ## diabetes 
    ##        n  missing distinct 
    ##      345        0        2 
    ##                       
    ## Value          0     1
    ## Frequency    303    42
    ## Proportion 0.878 0.122
    ## --------------------------------------------------------------------------------
    ## crohn : Crohn's disease 
    ##        n  missing distinct 
    ##      345        0        2 
    ##                       
    ## Value          0     1
    ## Frequency    343     2
    ## Proportion 0.994 0.006
    ## --------------------------------------------------------------------------------
    ## ulcercol : ulceratie colitis 
    ##        n  missing distinct 
    ##      345        0        2 
    ##                       
    ## Value          0     1
    ## Frequency    337     8
    ## Proportion 0.977 0.023
    ## --------------------------------------------------------------------------------
    ## ibd : inflammatory bowel disease 
    ##        n  missing distinct 
    ##      345        0        2 
    ##                       
    ## Value          0     1
    ## Frequency    335    10
    ## Proportion 0.971 0.029
    ## --------------------------------------------------------------------------------

Plot of the distribution of patients with specific comorbidities
measured at diagnosis.

Process steps: \* Select comorbidities \* Transform data frame from wide
to long \* Transform and spell out factors for plotting \* Plot counts
by comorbidity

``` r
a_crs %>%
  select(id, chf, afib, diabetes, mi, copd, crohn, ulcercol, ibd) %>%
  pivot_longer(-id, names_to = "comorb", values_to = "value") %>%
  mutate(
    comorb = case_when(
      comorb == "chf" ~ "Congestive heart failure",
      comorb == "afib" ~ "Atrial fibrillation",
      comorb == "diabetes" ~ "Diabetes",
      comorb == "copd" ~ "COPD",
      comorb == "mi" ~ "Myocardial infarction",
      comorb == "crohn" ~ "Crohn's disease",
      comorb == "ulcercol" ~ "Ulcerative colitis",
      comorb == "ibd" ~ "Inflammatory bowel disease"
    ),
    value = case_when(value == "0" ~ "no",
                      value == "1" ~ "yes")
  ) %>%
  group_by(comorb, value) %>%
  summarise(n = n()) %>%
  mutate(
    inc = n / bigN,
    perc = n / bigN * 100,
    plot_lab = paste0('(', n, ', ', round(perc, digits = 1), '%)'),
    axis_lab = paste0(comorb, ' ', '(', n, ', ', round(perc, digits = 1), '%)')
  ) %>%
  filter(value == "yes") %>%
  ggplot(aes(reorder(axis_lab, inc), inc)) +
  geom_point() +
  coord_flip() +
  ggtitle("Proportion of patients reporting a comorbidity at diagnosis") +
  theme_minimal(base_size = 10) +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_blank(),
    axis.title = element_blank()
  )
```

![](02_ida_univar_crs_files/figure-markdown_github/unnamed-chunk-4-1.png)

Patient characteristics
-----------------------

TODO: bin selection and width.

``` r
a_crs %>%
  ggplot(aes(bmi)) + 
  geom_histogram(binwidth = 0.1) + 
  ggtitle("Distribution of body mass index (BMI) measured at diagnosis") +
  theme_minimal(base_size = 10) 
```

![](02_ida_univar_crs_files/figure-markdown_github/unnamed-chunk-5-1.png)

Session info
============

``` r
sessionInfo()
```

    ## R version 3.6.0 (2019-04-26)
    ## Platform: x86_64-pc-linux-gnu (64-bit)
    ## Running under: Ubuntu 16.04.6 LTS
    ## 
    ## Matrix products: default
    ## BLAS:   /usr/lib/atlas-base/atlas/libblas.so.3.0
    ## LAPACK: /usr/lib/atlas-base/atlas/liblapack.so.3.0
    ## 
    ## locale:
    ##  [1] LC_CTYPE=C.UTF-8       LC_NUMERIC=C           LC_TIME=C.UTF-8       
    ##  [4] LC_COLLATE=C.UTF-8     LC_MONETARY=C.UTF-8    LC_MESSAGES=C.UTF-8   
    ##  [7] LC_PAPER=C.UTF-8       LC_NAME=C              LC_ADDRESS=C          
    ## [10] LC_TELEPHONE=C         LC_MEASUREMENT=C.UTF-8 LC_IDENTIFICATION=C   
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ## [1] here_0.1          Hmisc_4.3-0       Formula_1.2-3     survival_2.44-1.1
    ## [5] lattice_0.20-38   tidyr_1.0.0       dplyr_0.8.3       ggplot2_3.2.1    
    ## [9] rmarkdown_2.0    
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] tidyselect_0.2.5    xfun_0.11           purrr_0.3.3        
    ##  [4] splines_3.6.0       colorspace_1.4-1    vctrs_0.2.1        
    ##  [7] htmltools_0.4.0     yaml_2.2.0          base64enc_0.1-3    
    ## [10] rlang_0.4.2         pillar_1.4.3        foreign_0.8-71     
    ## [13] glue_1.3.1          withr_2.1.2         RColorBrewer_1.1-2 
    ## [16] jpeg_0.1-8.1        lifecycle_0.1.0     stringr_1.4.0      
    ## [19] munsell_0.5.0       gtable_0.3.0        htmlwidgets_1.5.1  
    ## [22] evaluate_0.14       labeling_0.3        latticeExtra_0.6-29
    ## [25] knitr_1.26          htmlTable_1.13.3    Rcpp_1.0.3         
    ## [28] acepack_1.4.1       backports_1.1.5     scales_1.1.0       
    ## [31] checkmate_1.9.4     farver_2.0.1        gridExtra_2.3      
    ## [34] png_0.1-7           digest_0.6.23       stringi_1.4.3      
    ## [37] rprojroot_1.3-2     grid_3.6.0          tools_3.6.0        
    ## [40] magrittr_1.5        lazyeval_0.2.2      tibble_2.1.3       
    ## [43] cluster_2.0.8       crayon_1.3.4        pkgconfig_2.0.3    
    ## [46] zeallot_0.1.0       Matrix_1.2-17       data.table_1.12.8  
    ## [49] assertthat_0.2.1    rstudioapi_0.10     R6_2.4.1           
    ## [52] rpart_4.1-15        nnet_7.3-12         compiler_3.6.0
