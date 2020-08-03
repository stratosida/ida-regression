
# Statistical analysis plan



## Outcome 

Early death, i.e. in-hospital death within 28 days from injury (binary variable)

## Statistical methods 

Logistic regression will be used to model early death by the following independent variables (measured at randomisation) deemed important to predict early death.

Demographic measurements:

* Age (`age`, years)
* Sex (`sex`, male or female)

Physiological measurements:

* Systolic blood pressure (`sbp`, mmHg)
* Heart rate (`hr`, 1/min)
* Respiratory rate (`rr`, 1/min)
* Glasgow coma score (`gcs`, points)
* Central capillary refill time (`cc`, seconds)

Characteristics of injury measurements:

* Time since injury (`injurytime`, hours)
* Type of injury (`injurytype`, 'blunt', 'penetrating' or 'blunt and penetrating')
 
Restricted cubic splines with 3 degrees of freedom with knots set to default values will be used for continuous variables. As the final prediction model should be parsimonious enough to simplify its application, a backward elimination algorithm with a significance level set at $\alpha=0.05$ will be applied to remove statistically insignificant effects. Finally, nonlinear representation of each continuous variable will be tested against linear representation at $\alpha=0.05$. In case of lacking added value of a nonlinear effect, the model will be refitted with a linear effect for that variable.

## Remarks

* Regarding type of injury, the original paper describes its treatment in the model as follows: 'Type of injury had three categories—-penetrating, blunt, or blunt and penetrating—but we analysed it as 'penetrating' or 'blunt and penetrating.' ' It is not clear from that description what happened to the 'blunt' group. (I assume they were collapsed with 'blunt and penetrating'.)

* The original paper describes the modeling approach as follows: 'We used a backward step-wise approach. Firstly, we included all potential prognostic factors and interaction terms that users considered plausible. These interactions included all potential predictors with type of injury, time since injury, and age. We then removed, one at a time, terms for which we found no strong evidence of an association, judged according to the P values (<0.05) from the Wald test.'  This would mean they tested at least 24 interaction terms, each possibly using several degrees of freedom! In the final model, only an interaction of Glasgow coma score and type of injury was included.


## Preparations

The outcome variable, early death (i.e., death within 28 days from injury) must be computed from the time span between date of death and date of randomization using the following logic:

* transform ddeath and trandomisation into an interpretable date format and then compute the difference
* interpret missing (i.e. NAs) as 'not died within study period, at least not within 28 days'
* if patients died after 28 days, treat as alive 


This can be derived using the following code:


```r
## NOTE: This is for demostration purposes, this code is not run here. 
## The derivation was executed earlier. 

a_crash2$time2death <-
  as.numeric(as.Date(a_crash2$ddeath) - as.Date(a_crash2$trandomised))

a_crash2$earlydeath[!is.na(a_crash2$time2death)] <-
  (a_crash2$time2death[!is.na(a_crash2$time2death)] <= 28) + 0

# +0 to transform it from TRUE/FALSE to 1/0
# NA in time2death means alive at day 28
a_crash2$earlydeath[is.na(a_crash2$time2death)] <- 0    
```



```r
a_crash2 %>%
  dplyr::select(earlydeath) %>%
  gtsummary::tbl_summary()
```

<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#jeoogvpfij .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#jeoogvpfij .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#jeoogvpfij .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#jeoogvpfij .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#jeoogvpfij .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jeoogvpfij .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#jeoogvpfij .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#jeoogvpfij .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#jeoogvpfij .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#jeoogvpfij .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#jeoogvpfij .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#jeoogvpfij .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#jeoogvpfij .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#jeoogvpfij .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#jeoogvpfij .gt_from_md > :first-child {
  margin-top: 0;
}

#jeoogvpfij .gt_from_md > :last-child {
  margin-bottom: 0;
}

#jeoogvpfij .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#jeoogvpfij .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#jeoogvpfij .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jeoogvpfij .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#jeoogvpfij .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jeoogvpfij .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#jeoogvpfij .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jeoogvpfij .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#jeoogvpfij .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#jeoogvpfij .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#jeoogvpfij .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#jeoogvpfij .gt_left {
  text-align: left;
}

#jeoogvpfij .gt_center {
  text-align: center;
}

#jeoogvpfij .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#jeoogvpfij .gt_font_normal {
  font-weight: normal;
}

#jeoogvpfij .gt_font_bold {
  font-weight: bold;
}

#jeoogvpfij .gt_font_italic {
  font-style: italic;
}

#jeoogvpfij .gt_super {
  font-size: 65%;
}

#jeoogvpfij .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="jeoogvpfij" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1"><strong>N = 20207</strong><sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">Death within 28 days from injury</td>
      <td class="gt_row gt_center">3076 (15%)</td>
    </tr>
  </tbody>
  
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="2">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          Statistics presented: n (%)
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->


The number of deaths computed in the data set coincides with the number reported in [Perel et al, BMJ 2012](https://doi.org/10.1136/bmj.e5166).


## Sources

Data obtained from http://biostat.mc.Vanderbilt.edu/dataSets

[LINK to data set](http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/crash2.rda)

### Data dictionary  

The data dictionary can be found [LINK](http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/Ccrash2.html)

## References

CRASH-2 Collaborators. Effects of tranexamic acid on death, vascular occlusive events, and blood transfusion in trauma patients with significant haemorrhage (CRASH-2): a randomised, placebo-controlled trial. Lancet 2010;376:23-32

Perel P, Prieto-Merino D, Shakur H, Clayton T, Lecky F, Bouamra O, Russell R, Faulkner M, Steyerberg EW, Roberts I. Predicting early death in patients with traumatic bleeding: development and validation of prognostic model. BMJ 2012; 345(aug15 1): e5166.


## Session info


```r
sessionInfo()
```

```
## R version 3.6.1 (2019-07-05)
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
##  [1] gtsummary_1.2.6 Hmisc_4.4-0     Formula_1.2-3   survival_3.2-3 
##  [5] lattice_0.20-40 forcats_0.5.0   stringr_1.4.0   dplyr_0.8.5    
##  [9] purrr_0.3.4     readr_1.3.1     tidyr_1.0.2     tibble_3.0.1   
## [13] ggplot2_3.3.0   tidyverse_1.3.0 here_0.1       
## 
## loaded via a namespace (and not attached):
##  [1] httr_1.4.1          sass_0.2.0          jsonlite_1.6.1     
##  [4] splines_3.6.1       modelr_0.1.6        assertthat_0.2.1   
##  [7] latticeExtra_0.6-29 cellranger_1.1.0    yaml_2.2.1         
## [10] pillar_1.4.4        backports_1.1.7     glue_1.4.1         
## [13] digest_0.6.25       RColorBrewer_1.1-2  checkmate_2.0.0    
## [16] rvest_0.3.5         colorspace_1.4-1    htmltools_0.4.0    
## [19] Matrix_1.2-18       pkgconfig_2.0.3     broom_0.5.5        
## [22] haven_2.2.0         bookdown_0.18       scales_1.1.1       
## [25] jpeg_0.1-8.1        htmlTable_1.13.3    generics_0.0.2     
## [28] ellipsis_0.3.0      withr_2.2.0         nnet_7.3-13        
## [31] cli_2.0.2           magrittr_1.5        crayon_1.3.4       
## [34] readxl_1.3.1        evaluate_0.14       fs_1.3.2           
## [37] fansi_0.4.1         nlme_3.1-145        xml2_1.2.5         
## [40] foreign_0.8-76      tools_3.6.1         data.table_1.12.8  
## [43] hms_0.5.3           lifecycle_0.2.0     munsell_0.5.0      
## [46] reprex_0.3.0        cluster_2.1.0       compiler_3.6.1     
## [49] rlang_0.4.6         grid_3.6.1          gt_0.2.0.5         
## [52] rstudioapi_0.11     htmlwidgets_1.5.1   base64enc_0.1-3    
## [55] rmarkdown_2.1       gtable_0.3.0        DBI_1.1.0          
## [58] R6_2.4.1            gridExtra_2.3       lubridate_1.7.4    
## [61] knitr_1.28          commonmark_1.7      rprojroot_1.3-2    
## [64] stringi_1.4.6       rmdformats_0.3.7    Rcpp_1.0.4.6       
## [67] vctrs_0.3.0         rpart_4.1-15        acepack_1.4.1      
## [70] png_0.1-7           dbplyr_1.4.2        tidyselect_1.1.0   
## [73] xfun_0.12
```
