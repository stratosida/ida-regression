# Univariate distributions

Univariate summary CRASH-2 dataset 




## Data set overview

Using Hmisc describe function, provide an overview of the data set is provided including histograms of continuous variables.  

### Demographic variables

**TODO: Should we plot the maringal distribution of the outcome? **

<!--html_preserve--><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
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
 .hmisctable303681 {
 border: none;
 font-size: 80%;
 }
 .hmisctable303681 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable303681 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable303681">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20203</td><td>4</td><td>84</td><td>0.999</td><td>34.56</td><td>15.55</td><td>18</td><td>19</td><td>24</td><td>30</td><td>43</td><td>55</td><td>64</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  1 14 15 16 17 ,  <font color="MidnightBlue">highest</font>: 92 94 95 96 99</span> <hr class="thinhr"> <span style="font-weight:bold">sex</span>: Sex <style>
 .hmisctable288402 {
 border: none;
 font-size: 80%;
 }
 .hmisctable288402 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable288402 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable288402">
 <tr><th>n</th><th>missing</th><th>distinct</th></tr>
 <tr><td>20206</td><td>1</td><td>2</td></tr>
 </table>
 <pre style="font-size:85%;">
 Value        male female
 Frequency   16935   3271
 Proportion  0.838  0.162
 </pre>
 <hr class="thinhr"><!--/html_preserve-->


### Pyhisological measurements

<!--html_preserve--><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
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
 <font color="MidnightBlue"><div align=center><span style="font-weight:bold">Pyhisological measurements <br><br> 5  Variables   20207  Observations</span></div></font> <hr class="thinhr"> <span style="font-weight:bold">sbp</span>: Systolic Blood Pressure <span style='font-family:Verdana;font-size:75%;'>mmHg</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAeUlEQVQ4jeWTUQ6AMAhDO+9/aC2LQZ2a0bEf5aOQZdAXElCEAJSumMUiBKSumIXUBNdJ8RUug/kzV/ROsMtJ02N4X5O21j/1gNFypdOlciXS9UxqrN+5UujiXFtmacUz1yicnZcfF2sKXU2uCXePsS/u4Y41l3rb1BUP7gxgD5zU4QAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable288962 {
 border: none;
 font-size: 80%;
 }
 .hmisctable288962 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable288962 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable288962">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>19887</td><td>320</td><td>173</td><td>0.989</td><td>98.45</td><td>27.86</td><td> 60</td><td> 70</td><td> 80</td><td> 95</td><td>110</td><td>130</td><td>143</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   4  10  12  20  25 ,  <font color="MidnightBlue">highest</font>: 225 230 234 240 250</span> <hr class="thinhr"> <span style="font-weight:bold">hr</span>: Heart Rate <span style='font-family:Verdana;font-size:75%;'>/min</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAc0lEQVQ4je2T6wqAIBSDZ+//0HkhbVB4aoOCGng5PxyfR4ekCxizS1h0AWPeFtnT4fFzXfP4EpcjO/s8mmIp3Y5a9Ip3PEBhLhXPxQVQ8SRXRUFTX5nrPl34YG9HVCJX+fs1RMUrnQwuwprbtfjmPWUxjxVbmQwFkspBGQAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable373468 {
 border: none;
 font-size: 80%;
 }
 .hmisctable373468 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable373468 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable373468">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20070</td><td>137</td><td>173</td><td>0.996</td><td>104.5</td><td>23.38</td><td> 70</td><td> 80</td><td> 90</td><td>105</td><td>120</td><td>130</td><td>140</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   3   4   5   6  10 ,  <font color="MidnightBlue">highest</font>: 190 192 198 200 220</span> <hr class="thinhr"> <span style="font-weight:bold">rr</span>: Respiratory Rate <span style='font-family:Verdana;font-size:75%;'>/min</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAdklEQVQ4je2T2wrAMAhD4/7/o9eumyCt1j6Yp4VAL0h7UAKJBWwKioQrFnYFRfq5zpTj4tMluIbJCuPWwqgmK2yENos/zTQXeZr+VzMUEy3LBTKa84nFgcdVx9iDBhO8xyvNVQsL3vdEPfIl5qh3uvtC359pyw0sKAx5Ml+DtwAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable620729 {
 border: none;
 font-size: 80%;
 }
 .hmisctable620729 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable620729 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable620729">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20016</td><td>191</td><td>68</td><td>0.99</td><td>23.06</td><td>7.052</td><td>14</td><td>16</td><td>20</td><td>22</td><td>26</td><td>30</td><td>35</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  1  2  3  4  5 ,  <font color="MidnightBlue">highest</font>: 90 91 94 95 96</span> <hr class="thinhr"> <span style="font-weight:bold">gcs</span>: Glasgow Coma Score Total <span style='font-family:Verdana;font-size:75%;'>points</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAACgAAAANCAMAAADsQdzaAAAACVBMVEUAAADMzMz////1iUV5AAAAK0lEQVQokWNgJAYwMDAyMBEDGBiYhoTC4eFrkCoCCqFKoAjkKQwEoRiQEACOggNMVmIG8gAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable672289 {
 border: none;
 font-size: 80%;
 }
 .hmisctable672289 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable672289 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable672289">
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
 .hmisctable181532 {
 border: none;
 font-size: 80%;
 }
 .hmisctable181532 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable181532 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable181532">
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
 <hr class="thinhr"><!--/html_preserve-->

### Characteristics of injury

<!--html_preserve--><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
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
 .hmisctable194119 {
 border: none;
 font-size: 80%;
 }
 .hmisctable194119 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable194119 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable194119">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20196</td><td>11</td><td>93</td><td>0.972</td><td>2.844</td><td>2.35</td><td>0.5</td><td>1.0</td><td>1.0</td><td>2.0</td><td>4.0</td><td>6.0</td><td>7.0</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.10  0.15  0.20  0.25  0.30 ,  <font color="MidnightBlue">highest</font>: 22.00 45.00 48.00 72.00 96.00</span> <hr class="thinhr"> <span style="font-weight:bold">injurytype</span>: Injury type<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAAoAAAANCAMAAACn6Q83AAAACVBMVEUAAADMzMz////1iUV5AAAAJ0lEQVQImWNgYIQBBgYmGCCKCeUyMIC0wk2Ai+JlMjCgMKEmMDAAADRjAKoEq8d0AAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable238136 {
 border: none;
 font-size: 80%;
 }
 .hmisctable238136 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable238136 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable238136">
 <tr><th>n</th><th>missing</th><th>distinct</th></tr>
 <tr><td>20207</td><td>0</td><td>3</td></tr>
 </table>
 <pre style="font-size:85%;">
 Value                      blunt           penetrating blunt and penetrating
 Frequency                  11189                  6552                  2466
 Proportion                 0.554                 0.324                 0.122
 </pre>
 <hr class="thinhr"><!--/html_preserve-->

## Categorical plots

A closer examination of the categorical predictors. 

<img src="Univar_crash2_files/figure-html/catplot-1.png" width="672" />

### Cateogrical ordinal plots

The Glasgow coma score, an ordinal cateogrical variable, is also displayed seperately. 


```r
a_crash2 %>%
  dplyr::select(gcs) %>%
  dplyr::mutate(gcs = as_factor(gcs)) %>%
  tidyr::pivot_longer(
    dplyr::everything(),
    names_to = "var",
    values_to = "value",
    values_drop_na = FALSE
  ) %>%
  dplyr::group_by(var, value) %>%
  dplyr::summarize(N = n()) %>%
  dplyr::mutate(
    freq = N / sum(N),
    pct = round((freq * 100), 1),
    value = as_factor(value),
    axis_lab = as_factor(paste0(value, ' ', '(', N, ', ', round(pct, digits = 1), '%)'))
  ) %>%
  ggplot(aes(
    x = axis_lab,
    y = pct,
    label = pct
  )) +
  geom_point(color = "firebrick2",
             alpha = 0.6,
             size = 3) +
  ylab("Percentage (%)") +
  scale_y_continuous(limits = c(0, 100)) +
  labs(caption = "Number and percentage of subjects reported in brackets.\nNA = missing") +
  coord_flip() +
  theme_minimal(base_size = 12) +
  theme(axis.title.y = element_blank(),
        panel.grid.minor = element_blank())
```

```
## Warning: Factor `value` contains implicit NA, consider using
## `forcats::fct_explicit_na`
```

<img src="Univar_crash2_files/figure-html/unnamed-chunk-2-1.png" width="672" />



## Continous plots 

A closer examination of continous predictors. 

<img src="Univar_crash2_files/figure-html/unnamed-chunk-3-1.png" width="864" />


There is evidence of digit preference. Explore further with targeted summaries. 

More detailed univariate summaries for the variables of interest are also provided below. 

### Age

<div class="figure">
<img src="Univar_crash2_files/figure-html/unnamed-chunk-4-1.png" alt="Distribution of subject age [years]" width="768" />
<p class="caption">(\#fig:unnamed-chunk-4)Distribution of subject age [years]</p>
</div>


### Blood pressure

<div class="figure">
<img src="Univar_crash2_files/figure-html/unnamed-chunk-5-1.png" alt="Distribution of SBP" width="768" />
<p class="caption">(\#fig:unnamed-chunk-5)Distribution of SBP</p>
</div>


### Respiratory rate


<div class="figure">
<img src="Univar_crash2_files/figure-html/unnamed-chunk-6-1.png" alt="Distribution of respiratory rate" width="768" />
<p class="caption">(\#fig:unnamed-chunk-6)Distribution of respiratory rate</p>
</div>


### Heart rate


<div class="figure">
<img src="Univar_crash2_files/figure-html/unnamed-chunk-7-1.png" alt="Distribution of heart rate" width="768" />
<p class="caption">(\#fig:unnamed-chunk-7)Distribution of heart rate</p>
</div>


### Central capillary refill time


<div class="figure">
<img src="Univar_crash2_files/figure-html/unnamed-chunk-8-1.png" alt="Distribution of Central capillary refill time" width="768" />
<p class="caption">(\#fig:unnamed-chunk-8)Distribution of Central capillary refill time</p>
</div>


### Hours since injury


<div class="figure">
<img src="Univar_crash2_files/figure-html/unnamed-chunk-9-1.png" alt="Distribution of hours since injury" width="768" />
<p class="caption">(\#fig:unnamed-chunk-9)Distribution of hours since injury</p>
</div>



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
##  [1] Hmisc_4.4-0     Formula_1.2-3   survival_3.2-3  lattice_0.20-40
##  [5] forcats_0.5.0   stringr_1.4.0   dplyr_0.8.5     purrr_0.3.4    
##  [9] readr_1.3.1     tidyr_1.0.2     tibble_3.0.1    ggplot2_3.3.0  
## [13] tidyverse_1.3.0 here_0.1       
## 
## loaded via a namespace (and not attached):
##  [1] httr_1.4.1          jsonlite_1.6.1      splines_3.6.1      
##  [4] modelr_0.1.6        assertthat_0.2.1    highr_0.8          
##  [7] latticeExtra_0.6-29 cellranger_1.1.0    yaml_2.2.1         
## [10] pillar_1.4.4        backports_1.1.7     glue_1.4.1         
## [13] digest_0.6.25       RColorBrewer_1.1-2  checkmate_2.0.0    
## [16] rvest_0.3.5         colorspace_1.4-1    htmltools_0.4.0    
## [19] Matrix_1.2-18       pkgconfig_2.0.3     broom_0.5.5        
## [22] haven_2.2.0         bookdown_0.18       patchwork_1.0.0    
## [25] scales_1.1.1        jpeg_0.1-8.1        htmlTable_1.13.3   
## [28] farver_2.0.3        generics_0.0.2      ellipsis_0.3.0     
## [31] withr_2.2.0         nnet_7.3-13         cli_2.0.2          
## [34] magrittr_1.5        crayon_1.3.4        readxl_1.3.1       
## [37] evaluate_0.14       fs_1.3.2            fansi_0.4.1        
## [40] nlme_3.1-145        xml2_1.2.5          foreign_0.8-76     
## [43] tools_3.6.1         data.table_1.12.8   hms_0.5.3          
## [46] lifecycle_0.2.0     munsell_0.5.0       reprex_0.3.0       
## [49] cluster_2.1.0       compiler_3.6.1      rlang_0.4.6        
## [52] grid_3.6.1          rstudioapi_0.11     htmlwidgets_1.5.1  
## [55] base64enc_0.1-3     labeling_0.3        rmarkdown_2.1      
## [58] gtable_0.3.0        DBI_1.1.0           R6_2.4.1           
## [61] gridExtra_2.3       lubridate_1.7.4     knitr_1.28         
## [64] rprojroot_1.3-2     stringi_1.4.6       Rcpp_1.0.4.6       
## [67] vctrs_0.3.0         rpart_4.1-15        acepack_1.4.1      
## [70] png_0.1-7           dbplyr_1.4.2        tidyselect_1.1.0   
## [73] xfun_0.12
```


