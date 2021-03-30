# Univariate distribution checks

This section reports a series of univariate summary checks of the CRASH-2 dataset.



## Data set overview

Using the [Hmisc](https://cran.r-project.org/web/packages/Hmisc/) describe function, we provide an overview of the data set. The descriptive report also provides histograms of continuous variables. For ease of scanning the information, we group the report by measurement type. 

### Demographic variables


```{=html}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<script type="text/javascript">
<!--
    function expand_collapse(id) {
       var e = document.getElementById(id);
       var f = document.getElementById(id+"_earrows");
       if(e.style.display == 'none'){
          e.style.display = 'block';
          f.innerHTML = '&#9650';
       }
       else {
          e.style.display = 'none';
          f.innerHTML = '&#9660';
       }
    }
//-->
</script>
<style>
.earrows {color:silver;font-size:11px;}

fcap {
 font-family: Verdana;
 font-size: 12px;
 color: MidnightBlue
 }

smg {
 font-family: Verdana;
 font-size: 10px;
 color: &#808080;
}

hr.thinhr { margin-top: 0.15em; margin-bottom: 0.15em; }

span.xscript {
position: relative;
}
span.xscript sub {
position: absolute;
left: 0.1em;
bottom: -1ex;
}
</style>
 <font color="MidnightBlue"><div align=center><span style="font-weight:bold">Demographic variables <br><br> 2  Variables   20207  Observations</span></div></font> <hr class="thinhr"> <span style="font-weight:bold">age</span>: Age <span style='font-family:Verdana;font-size:75%;'>years</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAhUlEQVQ4jc3TSw6AIAwE0Kn3P7TyUaAtCpFqJ8YmbnxKBzQSoJ32wTYSoJ32eXhRhnh0BQtzMe3XroRCTDF6cLF0XBa+u4IJ15FYyVxLy5Z2P1VDoVq38vdMjnXWxYjn4nlyoXaJ5fvVJZmrTnepizNf8EKVlDpBLeNs6BrsUh8RcrPDbQcg0QqG35KihwAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable957749 {
 border: none;
 font-size: 80%;
 }
 .hmisctable957749 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable957749 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable957749">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20203</td><td>4</td><td>84</td><td>0.999</td><td>34.56</td><td>15.55</td><td>18</td><td>19</td><td>24</td><td>30</td><td>43</td><td>55</td><td>64</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  1 14 15 16 17 ,  <font color="MidnightBlue">highest</font>: 92 94 95 96 99</span> <hr class="thinhr"> <span style="font-weight:bold">sex</span>: Sex <style>
 .hmisctable391870 {
 border: none;
 font-size: 80%;
 }
 .hmisctable391870 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable391870 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable391870">
 <tr><th>n</th><th>missing</th><th>distinct</th></tr>
 <tr><td>20206</td><td>1</td><td>2</td></tr>
 </table>
 <pre style="font-size:85%;">
 Value        male female
 Frequency   16935   3271
 Proportion  0.838  0.162
 </pre>
 <hr class="thinhr">
```


### Physiological measurements


```{=html}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<script type="text/javascript">
<!--
    function expand_collapse(id) {
       var e = document.getElementById(id);
       var f = document.getElementById(id+"_earrows");
       if(e.style.display == 'none'){
          e.style.display = 'block';
          f.innerHTML = '&#9650';
       }
       else {
          e.style.display = 'none';
          f.innerHTML = '&#9660';
       }
    }
//-->
</script>
<style>
.earrows {color:silver;font-size:11px;}

fcap {
 font-family: Verdana;
 font-size: 12px;
 color: MidnightBlue
 }

smg {
 font-family: Verdana;
 font-size: 10px;
 color: &#808080;
}

hr.thinhr { margin-top: 0.15em; margin-bottom: 0.15em; }

span.xscript {
position: relative;
}
span.xscript sub {
position: absolute;
left: 0.1em;
bottom: -1ex;
}
</style>
 <font color="MidnightBlue"><div align=center><span style="font-weight:bold">Physiological measurements <br><br> 5  Variables   20207  Observations</span></div></font> <hr class="thinhr"> <span style="font-weight:bold">sbp</span>: Systolic Blood Pressure <span style='font-family:Verdana;font-size:75%;'>mmHg</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAeUlEQVQ4jeWTUQ6AMAhDO+9/aC2LQZ2a0bEf5aOQZdAXElCEAJSumMUiBKSumIXUBNdJ8RUug/kzV/ROsMtJ02N4X5O21j/1gNFypdOlciXS9UxqrN+5UujiXFtmacUz1yicnZcfF2sKXU2uCXePsS/u4Y41l3rb1BUP7gxgD5zU4QAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable115254 {
 border: none;
 font-size: 80%;
 }
 .hmisctable115254 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable115254 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable115254">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>19887</td><td>320</td><td>173</td><td>0.989</td><td>98.45</td><td>27.86</td><td> 60</td><td> 70</td><td> 80</td><td> 95</td><td>110</td><td>130</td><td>143</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   4  10  12  20  25 ,  <font color="MidnightBlue">highest</font>: 225 230 234 240 250</span> <hr class="thinhr"> <span style="font-weight:bold">hr</span>: Heart Rate <span style='font-family:Verdana;font-size:75%;'>/min</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAc0lEQVQ4je2T6wqAIBSDZ+//0HkhbVB4aoOCGng5PxyfR4ekCxizS1h0AWPeFtnT4fFzXfP4EpcjO/s8mmIp3Y5a9Ip3PEBhLhXPxQVQ8SRXRUFTX5nrPl34YG9HVCJX+fs1RMUrnQwuwprbtfjmPWUxjxVbmQwFkspBGQAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable992541 {
 border: none;
 font-size: 80%;
 }
 .hmisctable992541 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable992541 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable992541">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20070</td><td>137</td><td>173</td><td>0.996</td><td>104.5</td><td>23.38</td><td> 70</td><td> 80</td><td> 90</td><td>105</td><td>120</td><td>130</td><td>140</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   3   4   5   6  10 ,  <font color="MidnightBlue">highest</font>: 190 192 198 200 220</span> <hr class="thinhr"> <span style="font-weight:bold">rr</span>: Respiratory Rate <span style='font-family:Verdana;font-size:75%;'>/min</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAdklEQVQ4je2T2wrAMAhD4/7/o9eumyCt1j6Yp4VAL0h7UAKJBWwKioQrFnYFRfq5zpTj4tMluIbJCuPWwqgmK2yENos/zTQXeZr+VzMUEy3LBTKa84nFgcdVx9iDBhO8xyvNVQsL3vdEPfIl5qh3uvtC359pyw0sKAx5Ml+DtwAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable422324 {
 border: none;
 font-size: 80%;
 }
 .hmisctable422324 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable422324 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable422324">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20016</td><td>191</td><td>68</td><td>0.99</td><td>23.06</td><td>7.052</td><td>14</td><td>16</td><td>20</td><td>22</td><td>26</td><td>30</td><td>35</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  1  2  3  4  5 ,  <font color="MidnightBlue">highest</font>: 90 91 94 95 96</span> <hr class="thinhr"> <span style="font-weight:bold">gcs</span>: Glasgow Coma Score Total <span style='font-family:Verdana;font-size:75%;'>points</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAACgAAAANCAMAAADsQdzaAAAACVBMVEUAAADMzMz////1iUV5AAAAK0lEQVQokWNgJAYwMDAyMBEDGBiYhoTC4eFrkCoCCqFKoAjkKQwEoRiQEACOggNMVmIG8gAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable914081 {
 border: none;
 font-size: 80%;
 }
 .hmisctable914081 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable914081 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable914081">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20184</td><td>23</td><td>13</td><td>0.863</td><td>12.47</td><td>3.594</td><td> 4</td><td> 6</td><td>11</td><td>15</td><td>15</td><td>15</td><td>15</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  3  4  5  6  7 ,  <font color="MidnightBlue">highest</font>: 11 12 13 14 15</span> <pre style="font-size:85%;">
 Value          3     4     5     6     7     8     9    10    11    12    13    14
 Frequency    784   520   441   584   733   576   504   663   586   951  1356  2140
 Proportion 0.039 0.026 0.022 0.029 0.036 0.029 0.025 0.033 0.029 0.047 0.067 0.106
                 
 Value         15
 Frequency  10346
 Proportion 0.513
 </pre>
 <hr class="thinhr"> <span style="font-weight:bold">cc</span>: Central Capillary Refille Time <span style='font-family:Verdana;font-size:75%;'>s</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAD0AAAANCAMAAAAtxpZ2AAAACVBMVEUAAADMzMz////1iUV5AAAAOklEQVQokdXRMQoAMAgEwT3//+ggFsEmxVlIth8EDwnkRgDh9rm2OUo9+rl/e6arTW1yerXA3eC5BjoXeQULuh8a6gAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable443975 {
 border: none;
 font-size: 80%;
 }
 .hmisctable443975 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable443975 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable443975">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>19596</td><td>611</td><td>20</td><td>0.945</td><td>3.267</td><td>1.67</td><td>1</td><td>2</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  1  2  3  4  5 ,  <font color="MidnightBlue">highest</font>: 17 18 20 30 60</span> <pre style="font-size:85%;">
 Value          1     2     3     4     5     6     7     8     9    10    11    12
 Frequency   1510  5328  6020  3367  1805   802   268   271    45   139     3     7
 Proportion 0.077 0.272 0.307 0.172 0.092 0.041 0.014 0.014 0.002 0.007 0.000 0.000
                                                           
 Value         13    15    16    17    18    20    30    60
 Frequency      3    19     3     1     1     2     1     1
 Proportion 0.000 0.001 0.000 0.000 0.000 0.000 0.000 0.000
 </pre>
 <hr class="thinhr">
```

### Characteristics of injury


```{=html}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<script type="text/javascript">
<!--
    function expand_collapse(id) {
       var e = document.getElementById(id);
       var f = document.getElementById(id+"_earrows");
       if(e.style.display == 'none'){
          e.style.display = 'block';
          f.innerHTML = '&#9650';
       }
       else {
          e.style.display = 'none';
          f.innerHTML = '&#9660';
       }
    }
//-->
</script>
<style>
.earrows {color:silver;font-size:11px;}

fcap {
 font-family: Verdana;
 font-size: 12px;
 color: MidnightBlue
 }

smg {
 font-family: Verdana;
 font-size: 10px;
 color: &#808080;
}

hr.thinhr { margin-top: 0.15em; margin-bottom: 0.15em; }

span.xscript {
position: relative;
}
span.xscript sub {
position: absolute;
left: 0.1em;
bottom: -1ex;
}
</style>
 <font color="MidnightBlue"><div align=center><span style="font-weight:bold">Characteristics of injury <br><br> 2  Variables   20207  Observations</span></div></font> <hr class="thinhr"> <span style="font-weight:bold">injurytime</span>: Hours Since Injury <span style='font-family:Verdana;font-size:75%;'>hours</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAWklEQVQ4je3VOwoAIAxEwY33P7Qm+G/U7hVuIQophsCirEQyWpRKFCcq3/UWuAsHiyaKV8i2L9rGhosFc42qi0SbXKil7S4KzIu4uOKzrC31S38e+mNXY9czGQXhDQPyr+JzAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable974889 {
 border: none;
 font-size: 80%;
 }
 .hmisctable974889 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable974889 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable974889">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20196</td><td>11</td><td>93</td><td>0.972</td><td>2.844</td><td>2.35</td><td>0.5</td><td>1.0</td><td>1.0</td><td>2.0</td><td>4.0</td><td>6.0</td><td>7.0</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.10  0.15  0.20  0.25  0.30 ,  <font color="MidnightBlue">highest</font>: 22.00 45.00 48.00 72.00 96.00</span> <hr class="thinhr"> <span style="font-weight:bold">injurytype</span>: Injury type<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAAoAAAANCAMAAACn6Q83AAAACVBMVEUAAADMzMz////1iUV5AAAAJ0lEQVQImWNgYIQBBgYmGCCKCeUyMIC0wk2Ai+JlMjCgMKEmMDAAADRjAKoEq8d0AAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable773544 {
 border: none;
 font-size: 80%;
 }
 .hmisctable773544 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable773544 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable773544">
 <tr><th>n</th><th>missing</th><th>distinct</th></tr>
 <tr><td>20207</td><td>0</td><td>3</td></tr>
 </table>
 <pre style="font-size:85%;">
 Value                      blunt           penetrating blunt and penetrating
 Frequency                  11189                  6552                  2466
 Proportion                 0.554                 0.324                 0.122
 </pre>
 <hr class="thinhr">
```

## Categorical variables

We now provide a closer visual examination of the categorical predictors. 

<img src="Crash2_univar_files/figure-html/catplot-1.png" width="768" />

### Categorical ordinal plots

The Glasgow coma score, an ordinal categorical variable, is also displayed separately. 

<img src="Crash2_univar_files/figure-html/unnamed-chunk-2-1.png" width="768" />



## Continuous variables 

A closer visual examination of continuous predictors. 

<img src="Crash2_univar_files/figure-html/unnamed-chunk-3-1.png" width="864" />


There is evidence of digit preference. Explore further with targeted summaries. A more detailed univariate summaries for the variables of interest are also provided below. 

### Age

<div class="figure">
<img src="Crash2_univar_files/figure-html/unnamed-chunk-4-1.png" alt="Distribution of subject age [years]" width="768" />
<p class="caption">Distribution of subject age [years]</p>
</div>

Five patients under the age of 17, the inclusion criteria for the study, with one patient aged 1. 

### Blood pressure

<div class="figure">
<img src="Crash2_univar_files/figure-html/unnamed-chunk-5-1.png" alt="Distribution of SBP" width="768" />
<p class="caption">Distribution of SBP</p>
</div>


### Respiratory rate


<div class="figure">
<img src="Crash2_univar_files/figure-html/unnamed-chunk-6-1.png" alt="Distribution of respiratory rate" width="768" />
<p class="caption">Distribution of respiratory rate</p>
</div>


### Heart rate


<div class="figure">
<img src="Crash2_univar_files/figure-html/unnamed-chunk-7-1.png" alt="Distribution of heart rate" width="768" />
<p class="caption">Distribution of heart rate</p>
</div>


### Central capillary refill time


<div class="figure">
<img src="Crash2_univar_files/figure-html/unnamed-chunk-8-1.png" alt="Distribution of Central capillary refill time" width="768" />
<p class="caption">Distribution of Central capillary refill time</p>
</div>


### Hours since injury


<div class="figure">
<img src="Crash2_univar_files/figure-html/unnamed-chunk-9-1.png" alt="Distribution of hours since injury" width="768" />
<p class="caption">Distribution of hours since injury</p>
</div>



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
##  [5] forcats_0.5.1   stringr_1.4.0   dplyr_1.0.4     purrr_0.3.4    
##  [9] readr_1.4.0     tidyr_1.1.2     tibble_3.0.6    ggplot2_3.3.3  
## [13] tidyverse_1.3.0 here_1.0.1     
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_1.0.6          lubridate_1.7.9.2   png_0.1-7          
##  [4] assertthat_0.2.1    rprojroot_2.0.2     digest_0.6.27      
##  [7] R6_2.5.0            cellranger_1.1.0    backports_1.2.1    
## [10] reprex_1.0.0        evaluate_0.14       highr_0.8          
## [13] httr_1.4.2          pillar_1.4.7        rlang_0.4.10       
## [16] readxl_1.3.1        data.table_1.13.6   rstudioapi_0.13    
## [19] rpart_4.1-15        Matrix_1.2-18       checkmate_2.0.0    
## [22] rmarkdown_2.6       labeling_0.4.2      splines_4.0.2      
## [25] foreign_0.8-80      htmlwidgets_1.5.3   munsell_0.5.0      
## [28] broom_0.7.4         compiler_4.0.2      modelr_0.1.8       
## [31] xfun_0.20           pkgconfig_2.0.3     base64enc_0.1-3    
## [34] htmltools_0.5.1.1   nnet_7.3-14         tidyselect_1.1.0   
## [37] htmlTable_2.1.0     gridExtra_2.3       bookdown_0.21      
## [40] crayon_1.4.1        dbplyr_2.1.0        withr_2.4.1        
## [43] grid_4.0.2          jsonlite_1.7.2      gtable_0.3.0       
## [46] lifecycle_0.2.0     DBI_1.1.1           magrittr_2.0.1     
## [49] scales_1.1.1        rmdformats_1.0.1    cli_2.3.0          
## [52] stringi_1.5.3       farver_2.0.3        fs_1.5.0           
## [55] latticeExtra_0.6-29 xml2_1.3.2          ellipsis_0.3.1     
## [58] generics_0.1.0      vctrs_0.3.6         RColorBrewer_1.1-2 
## [61] tools_4.0.2         glue_1.4.2          hms_1.0.0          
## [64] jpeg_0.1-8.1        yaml_2.2.1          colorspace_2.0-0   
## [67] cluster_2.1.0       rvest_0.3.6         knitr_1.31         
## [70] haven_2.3.1         patchwork_1.1.1
```


