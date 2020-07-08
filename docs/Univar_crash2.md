# Univariate distributions

Univariate summary CRASH-2 dataset 


```r
library(here)
library(tidyverse)
library(janitor)
library(summarytools)
library(Hmisc)
source(here("R", "tmp_hist_plot.R"))
```

## Read data

### Load the dataset.


```r
load(here::here("data", "crash2.rda"))
```


Complete metadata by adding missing labels. 


```r
crash2 <- Hmisc::upData(crash2,
               labels = c(age = 'Age'),
               units = c(age = "years"))
```

```
## Input object size:	 4094896 bytes;	 44 variables	 20207 observations
## New object size:	4095640 bytes;	44 variables	20207 observations
```



### Describe the dataset

Use Hmisc describe function. 


```r
crash2 %>%
  Hmisc::describe(descript = "Crash2 data set") %>%
  Hmisc::html()
```

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
 <font color="MidnightBlue"><div align=center><span style="font-weight:bold">Crash2 data set <br><br> 44  Variables   20207  Observations</span></div></font> <hr class="thinhr"> <span style="font-weight:bold">entryid</span>: Unique Numbers for Entry Forms<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAQ0lEQVQ4je3TsQ0AQAhCUXX/oc/DylhZQeGf4CUE88ykcpAiY0t6AZKeC7JzLVJ2qb3xV39kK2a1I1sxO9cuZZfoHx9reQCQzx59LQAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable371815 {
 border: none;
 font-size: 85%;
 }
 .hmisctable371815 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable371815 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable371815">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20207</td><td>0</td><td>20207</td><td>1</td><td>10132</td><td>6760</td><td> 1011</td><td> 2022</td><td> 5060</td><td>10130</td><td>15204</td><td>18242</td><td>19255</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :     1     2     3     4     5 ,  <font color="MidnightBlue">highest</font>: 20266 20267 20268 20269 20270</span> <hr class="thinhr"> <span style="font-weight:bold">source</span>: Method of Transmission of Entry Form to CC<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAABAAAAANCAMAAACXZR4WAAAACVBMVEUAAADMzMz////1iUV5AAAAKUlEQVQImWNgBAMGBkYoYGACAwYoDWRRQ4BUWxgYSBKAYLDxDGBbIBgAiGgBKa79/KkAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable955408 {
 border: none;
 font-size: 85%;
 }
 .hmisctable955408 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable955408 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable955408">
 <tr><th>n</th><th>missing</th><th>distinct</th></tr>
 <tr><td>20207</td><td>0</td><td>5</td></tr>
 </table>
 <style>
 .hmisctable562309 {
 border: none;
 font-size: 85%;
 }
 .hmisctable562309 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable562309 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable562309">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td>telephone                           </td><td>telephone entered manually          </td><td>electronic CRF by email             </td><td>paper CRF enteredd in electronic CRF</td><td>electronic CRF                      </td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td>telephone                           </td><td>telephone entered manually          </td><td>electronic CRF by email             </td><td>paper CRF enteredd in electronic CRF</td><td>electronic CRF                      </td></tr>
 </table>
  telephone (86, 0.004), telephone entered manually (6, 0.000), electronic CRF by email (13767, 0.681), paper CRF enteredd in electronic CRF (1711, 0.085), electronic CRF (4637, 0.229) <hr class="thinhr"> <span style="font-weight:bold">trandomised</span>: Date of Randomization<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAjUlEQVQ4jcWT2w7AIAhD6/7/ozdHme4Sh9HGPhiMgge1SGIByEN32iYUit5LP6kqJju85joGhmf0QHuAiricpC2n4axGE3DZeRHd9wm4WNS7j3J9s1rFIatlt6FEMxT3o/fAbvh9B66kqeA7+u6SJeIJcHFRDNDBNfZjp5KhhlpNZLr8iERjrSYypcy0A7OlBnDWMD1pAAAAAElFTkSuQmCC" alt="image" /></div> <pre style="font-size:85%;">
          n    missing   distinct       Info       Mean        Gmd        .05 
      20207          0       1664          1 2008-04-01      466.9 2006-03-10 
        .10        .25        .50        .75        .90        .95 
 2006-07-19 2007-06-10 2008-06-06 2009-02-26 2009-08-27 2009-10-28 
 </pre>
 <style>
 .hmisctable332302 {
 border: none;
 font-size: 85%;
 }
 .hmisctable332302 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable332302 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable332302">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td>2005-05-19</td><td>2005-05-22</td><td>2005-05-25</td><td>2005-05-26</td><td>2005-05-27</td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td>2010-01-11</td><td>2010-01-12</td><td>2010-01-14</td><td>2010-01-22</td><td>2010-01-23</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">outcomeid</span>: Unique Number From Outcome Database<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAQ0lEQVQ4je3TsQ0AMAgDQWD/oUNwFdGEChf+CU6ybJ4ZVV6kyLYlb1EkuX6TaxZcbG+84Y/bih523Fb05JrF7CL94wG8gQCglVs6JAAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable322436 {
 border: none;
 font-size: 74%;
 }
 .hmisctable322436 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable322436 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable322436">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20127</td><td>80</td><td>20127</td><td>1</td><td>10112</td><td>6734</td><td> 1010</td><td> 2023</td><td> 5062</td><td>10116</td><td>15164</td><td>18185</td><td>19193</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :     1     2     3     4     5 ,  <font color="MidnightBlue">highest</font>: 20195 20196 20197 20198 20199</span> <hr class="thinhr"> <span style="font-weight:bold">sex</span> <style>
 .hmisctable679138 {
 border: none;
 font-size: 85%;
 }
 .hmisctable679138 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable679138 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable679138">
 <tr><th>n</th><th>missing</th><th>distinct</th></tr>
 <tr><td>20206</td><td>1</td><td>2</td></tr>
 </table>
 <pre style="font-size:85%;">
 Value        male female
 Frequency   16935   3271
 Proportion  0.838  0.162
 </pre>
 <hr class="thinhr"> <span style="font-weight:bold">age</span>: Age <span style='font-family:Verdana;font-size:75%;'>years</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAhUlEQVQ4jc3TSw6AIAwE0Kn3P7TyUaAtCpFqJ8YmbnxKBzQSoJ32wTYSoJ32eXhRhnh0BQtzMe3XroRCTDF6cLF0XBa+u4IJ15FYyVxLy5Z2P1VDoVq38vdMjnXWxYjn4nlyoXaJ5fvVJZmrTnepizNf8EKVlDpBLeNs6BrsUh8RcrPDbQcg0QqG35KihwAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable886172 {
 border: none;
 font-size: 85%;
 }
 .hmisctable886172 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable886172 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable886172">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20203</td><td>4</td><td>84</td><td>0.999</td><td>34.56</td><td>15.55</td><td>18</td><td>19</td><td>24</td><td>30</td><td>43</td><td>55</td><td>64</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  1 14 15 16 17 ,  <font color="MidnightBlue">highest</font>: 92 94 95 96 99</span> <hr class="thinhr"> <span style="font-weight:bold">injurytime</span>: Hours Since Injury<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAWklEQVQ4je3VOwoAIAxEwY33P7Qm+G/U7hVuIQophsCirEQyWpRKFCcq3/UWuAsHiyaKV8i2L9rGhosFc42qi0SbXKil7S4KzIu4uOKzrC31S38e+mNXY9czGQXhDQPyr+JzAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable581123 {
 border: none;
 font-size: 85%;
 }
 .hmisctable581123 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable581123 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable581123">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20196</td><td>11</td><td>93</td><td>0.972</td><td>2.844</td><td>2.35</td><td>0.5</td><td>1.0</td><td>1.0</td><td>2.0</td><td>4.0</td><td>6.0</td><td>7.0</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.10  0.15  0.20  0.25  0.30 ,  <font color="MidnightBlue">highest</font>: 22.00 45.00 48.00 72.00 96.00</span> <hr class="thinhr"> <span style="font-weight:bold">injurytype</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAAoAAAANCAMAAACn6Q83AAAACVBMVEUAAADMzMz////1iUV5AAAAJ0lEQVQImWNgYIQBBgYmGCCKCeUyMIC0wk2Ai+JlMjCgMKEmMDAAADRjAKoEq8d0AAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable921274 {
 border: none;
 font-size: 85%;
 }
 .hmisctable921274 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable921274 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable921274">
 <tr><th>n</th><th>missing</th><th>distinct</th></tr>
 <tr><td>20207</td><td>0</td><td>3</td></tr>
 </table>
 <pre style="font-size:85%;">
 Value                      blunt           penetrating blunt and penetrating
 Frequency                  11189                  6552                  2466
 Proportion                 0.554                 0.324                 0.122
 </pre>
 <hr class="thinhr"> <span style="font-weight:bold">sbp</span>: Systolic Blood Pressure <span style='font-family:Verdana;font-size:75%;'>mmHg</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAeUlEQVQ4jeWTUQ6AMAhDO+9/aC2LQZ2a0bEf5aOQZdAXElCEAJSumMUiBKSumIXUBNdJ8RUug/kzV/ROsMtJ02N4X5O21j/1gNFypdOlciXS9UxqrN+5UujiXFtmacUz1yicnZcfF2sKXU2uCXePsS/u4Y41l3rb1BUP7gxgD5zU4QAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable108960 {
 border: none;
 font-size: 85%;
 }
 .hmisctable108960 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable108960 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable108960">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>19887</td><td>320</td><td>173</td><td>0.989</td><td>98.45</td><td>27.86</td><td> 60</td><td> 70</td><td> 80</td><td> 95</td><td>110</td><td>130</td><td>143</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   4  10  12  20  25 ,  <font color="MidnightBlue">highest</font>: 225 230 234 240 250</span> <hr class="thinhr"> <span style="font-weight:bold">rr</span>: Respiratory Rate <span style='font-family:Verdana;font-size:75%;'>/min</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAdklEQVQ4je2T2wrAMAhD4/7/o9eumyCt1j6Yp4VAL0h7UAKJBWwKioQrFnYFRfq5zpTj4tMluIbJCuPWwqgmK2yENos/zTQXeZr+VzMUEy3LBTKa84nFgcdVx9iDBhO8xyvNVQsL3vdEPfIl5qh3uvtC359pyw0sKAx5Ml+DtwAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable520467 {
 border: none;
 font-size: 85%;
 }
 .hmisctable520467 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable520467 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable520467">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20016</td><td>191</td><td>68</td><td>0.99</td><td>23.06</td><td>7.052</td><td>14</td><td>16</td><td>20</td><td>22</td><td>26</td><td>30</td><td>35</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  1  2  3  4  5 ,  <font color="MidnightBlue">highest</font>: 90 91 94 95 96</span> <hr class="thinhr"> <span style="font-weight:bold">cc</span>: Central Capillary Refille Time <span style='font-family:Verdana;font-size:75%;'>s</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAD0AAAANCAMAAAAtxpZ2AAAACVBMVEUAAADMzMz////1iUV5AAAAOklEQVQokdXRMQoAMAgEwT3//+ggFsEmxVlIth8EDwnkRgDh9rm2OUo9+rl/e6arTW1yerXA3eC5BjoXeQULuh8a6gAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable323274 {
 border: none;
 font-size: 85%;
 }
 .hmisctable323274 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable323274 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable323274">
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
 <hr class="thinhr"> <span style="font-weight:bold">hr</span>: Heart Rate <span style='font-family:Verdana;font-size:75%;'>/min</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAc0lEQVQ4je2T6wqAIBSDZ+//0HkhbVB4aoOCGng5PxyfR4ekCxizS1h0AWPeFtnT4fFzXfP4EpcjO/s8mmIp3Y5a9Ip3PEBhLhXPxQVQ8SRXRUFTX5nrPl34YG9HVCJX+fs1RMUrnQwuwprbtfjmPWUxjxVbmQwFkspBGQAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable787329 {
 border: none;
 font-size: 85%;
 }
 .hmisctable787329 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable787329 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable787329">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20070</td><td>137</td><td>173</td><td>0.996</td><td>104.5</td><td>23.38</td><td> 70</td><td> 80</td><td> 90</td><td>105</td><td>120</td><td>130</td><td>140</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   3   4   5   6  10 ,  <font color="MidnightBlue">highest</font>: 190 192 198 200 220</span> <hr class="thinhr"> <span style="font-weight:bold">gcseye</span>: Glasgow Coma Score Eye Opening<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAABAAAAANCAMAAACXZR4WAAAACVBMVEUAAADMzMz////1iUV5AAAAJ0lEQVQImWNgRAEMDAxMKIBKAuTZAhUFUdgEwCSUAxEAGc0IpYAYAIghAR5+GojGAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable354079 {
 border: none;
 font-size: 85%;
 }
 .hmisctable354079 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable354079 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable354079">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>19475</td><td>732</td><td>5</td><td>0.822</td><td>2.948</td><td>1.414</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 0 1 2 3 4 ,  <font color="MidnightBlue">highest</font>: 0 1 2 3 4</span> <pre style="font-size:85%;">
 Value          0     1     2     3     4
 Frequency   1639  2653  1615  2740 10828
 Proportion 0.084 0.136 0.083 0.141 0.556
 </pre>
 <hr class="thinhr"> <span style="font-weight:bold">gcsmotor</span>: Glasgow Coma Score Motor Response<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAABYAAAANCAMAAACae25RAAAACVBMVEUAAADMzMz////1iUV5AAAAJ0lEQVQYlWNgxAIYGBiYsAAaC9PEJSAR3MIMaGIwYZDNcMQAQkAMAAwHAbPGyMlJAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable278071 {
 border: none;
 font-size: 85%;
 }
 .hmisctable278071 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable278071 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable278071">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>19475</td><td>732</td><td>7</td><td>0.782</td><td>4.794</td><td>1.797</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 0 1 2 3 4 ,  <font color="MidnightBlue">highest</font>: 2 3 4 5 6</span> <pre style="font-size:85%;">
 Value          0     1     2     3     4     5     6
 Frequency   1639   789   607   658  1144  3009 11629
 Proportion 0.084 0.041 0.031 0.034 0.059 0.155 0.597
 </pre>
 <hr class="thinhr"> <span style="font-weight:bold">gcsverbal</span>: Glasgow Coma Score Verbal Response<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAABMAAAANCAMAAAB8UqUVAAAACVBMVEUAAADMzMz////1iUV5AAAAJ0lEQVQYlWNgRAcMDAxM6IAGYmTZC+JCxBASUDEGnGIoFMhiIEahAMDoAVcEiR5yAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable865330 {
 border: none;
 font-size: 85%;
 }
 .hmisctable865330 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable865330 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable865330">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>19472</td><td>735</td><td>6</td><td>0.857</td><td>3.611</td><td>1.833</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 0 1 2 3 4 ,  <font color="MidnightBlue">highest</font>: 1 2 3 4 5</span> <pre style="font-size:85%;">
 Value          0     1     2     3     4     5
 Frequency   1642  2568  1200   903  3161  9998
 Proportion 0.084 0.132 0.062 0.046 0.162 0.513
 </pre>
 <hr class="thinhr"> <span style="font-weight:bold">gcs</span>: Glasgow Coma Score Total<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAACgAAAANCAMAAADsQdzaAAAACVBMVEUAAADMzMz////1iUV5AAAAK0lEQVQokWNgJAYwMDAyMBEDGBiYhoTC4eFrkCoCCqFKoAjkKQwEoRiQEACOggNMVmIG8gAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable734404 {
 border: none;
 font-size: 85%;
 }
 .hmisctable734404 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable734404 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable734404">
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
 <hr class="thinhr"> <span style="font-weight:bold">ddeath</span>: Date of Death<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAk0lEQVQ4jcWTCxLAEAxEl/sfuiWSCUX97YzGtCRPY2EOCOjfYg8I/VUuclVp93LBiwjcI0yQ4UooV3FJVR8AJhDxCsSyDLqE69sCSq3rJlzgFbV3Kt+QvbzBQPEdKrOej6jfj3IePtskQUHFPkZ/kwmsbNpD88el7+d+hkau6PMNplBacR1pUaPEj2SiWSctk3FMD8C7BuvPoQ4QAAAAAElFTkSuQmCC" alt="image" /></div> <pre style="font-size:85%;">
          n    missing   distinct       Info       Mean        Gmd        .05 
       3086      17121       1320          1 2008-03-08      477.7 2006-02-11 
        .10        .25        .50        .75        .90        .95 
 2006-06-29 2007-05-01 2008-05-03 2009-02-18 2009-08-23 2009-10-21 
 </pre>
 <style>
 .hmisctable270234 {
 border: none;
 font-size: 85%;
 }
 .hmisctable270234 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable270234 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable270234">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td>2005-05-28</td><td>2005-06-05</td><td>2005-06-12</td><td>2005-06-14</td><td>2005-06-22</td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td>2010-01-09</td><td>2010-01-15</td><td>2010-01-17</td><td>2010-01-20</td><td>2010-01-24</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">cause</span>: Main Cause of Death<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAABYAAAANCAMAAACae25RAAAACVBMVEUAAADMzMz////1iUV5AAAALElEQVQYlWNgZGRkYGBEBwwMTEwgjAZoK0yRSyAcUoQZGHAKQ1wCQUAMEQAA+hQBmHDagFgAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable589083 {
 border: none;
 font-size: 85%;
 }
 .hmisctable589083 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable589083 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable589083">
 <tr><th>n</th><th>missing</th><th>distinct</th></tr>
 <tr><td>3089</td><td>17118</td><td>7</td></tr>
 </table>
 <style>
 .hmisctable532215 {
 border: none;
 font-size: 85%;
 }
 .hmisctable532215 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable532215 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable532215">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td>bleeding             </td><td>head injury          </td><td>myocardial infarction</td><td>stroke               </td><td>pulmonary embolism   </td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td>myocardial infarction</td><td>stroke               </td><td>pulmonary embolism   </td><td>multi organ failure  </td><td>other                </td></tr>
 </table>
  bleeding (1064, 0.344), head injury (1225, 0.397), myocardial infarction (29, 0.009), stroke (13, 0.004), pulmonary embolism (40, 0.013), multi organ failure (447, 0.145), other (271, 0.088) <hr class="thinhr"> <span style="font-weight:bold">scauseother</span>: Description of Other Cause of Death <style>
 .hmisctable791780 {
 border: none;
 font-size: 85%;
 }
 .hmisctable791780 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable791780 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable791780">
 <tr><th>n</th><th>missing</th><th>distinct</th></tr>
 <tr><td>20207</td><td>0</td><td>227</td></tr>
 </table>
 <style>
 .hmisctable437343 {
 border: none;
 font-size: 85%;
 }
 .hmisctable437343 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable437343 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable437343">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td>                          </td><td>Acute Hypoxia             </td><td>ACUTE LUNG INJURY         </td><td>Acute Pulmonary Oedema    </td><td>Acute Renal Failure       </td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td>trauma raquimedular       </td><td>Traumatic Shock           </td><td>Type I Respiratory failure</td><td>Unsurvivable injuries     </td><td>Visceral injury           </td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">status</span>: Status of Patient at Outcome if Alive<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAAoAAAANCAMAAACn6Q83AAAACVBMVEUAAADMzMz////1iUV5AAAAH0lEQVQImWNgYIQBBgYmGCCNSbYJYC4DA8gEsCkMDAA5cADEv6lXIAAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable856569 {
 border: none;
 font-size: 85%;
 }
 .hmisctable856569 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable856569 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable856569">
 <tr><th>n</th><th>missing</th><th>distinct</th></tr>
 <tr><td>17038</td><td>3169</td><td>3</td></tr>
 </table>
 <pre style="font-size:85%;">
 Value                         discharged             still in hospital
 Frequency                          13681                          1969
 Proportion                         0.803                         0.116
                                         
 Value      transferred to other hospital
 Frequency                           1388
 Proportion                         0.081
 </pre>
 <hr class="thinhr"> <span style="font-weight:bold">ddischarge</span>: Date of discharge, transfer to other hospital or day 28 from randomization<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAfklEQVQ4jcXTiwqAMAgF0Jv//9E1TSaVe7tug8GY7kCIIz7AQA1FB5zuqgiKaa8xJ3bzC7eoFCeLnlg52+K6GeXwteyytCBXTVSySoMl46YTx/u4KWXBPM4BnGjvtsezIkbzkn27lB1u6HL9onFdO35RY0jmEekDMDlJ63KZTpJZBwR6QcwiAAAAAElFTkSuQmCC" alt="image" /></div> <pre style="font-size:85%;">
          n    missing   distinct       Info       Mean        Gmd        .05 
      17022       3185       1658          1 2008-04-18      464.7 2006-03-24 
        .10        .25        .50        .75        .90        .95 
 2006-08-04 2007-06-30 2008-06-25 2009-03-12 2009-09-08 2009-11-09 
 </pre>
 <style>
 .hmisctable974718 {
 border: none;
 font-size: 85%;
 }
 .hmisctable974718 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable974718 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable974718">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td>2005-05-26</td><td>2005-06-03</td><td>2005-06-06</td><td>2005-06-08</td><td>2005-06-10</td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td>2010-02-02</td><td>2010-02-03</td><td>2010-02-04</td><td>2010-02-07</td><td>2010-02-10</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">condition</span>: Condition of Patient at Outcome if Alive<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAABAAAAANCAMAAACXZR4WAAAACVBMVEUAAADMzMz////1iUV5AAAAM0lEQVQImWNgZGRkYGBEAAYmJiYGEAEDRAsgxDAFILYgLAJJQVVAVJEswMCARQBuCwQDAHkwAPh+8VbKAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable894456 {
 border: none;
 font-size: 85%;
 }
 .hmisctable894456 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable894456 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable894456">
 <tr><th>n</th><th>missing</th><th>distinct</th></tr>
 <tr><td>16956</td><td>3251</td><td>5</td></tr>
 </table>
 <style>
 .hmisctable258429 {
 border: none;
 font-size: 85%;
 }
 .hmisctable258429 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable258429 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable258429">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td>no symptoms                                       </td><td>minor symptoms                                    </td><td>some restriction in lifestyle but independent     </td><td>dependent, but not requiring constant attention   </td><td>fully dependent, requiring attention day and night</td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td>no symptoms                                       </td><td>minor symptoms                                    </td><td>some restriction in lifestyle but independent     </td><td>dependent, but not requiring constant attention   </td><td>fully dependent, requiring attention day and night</td></tr>
 </table>
  no symptoms (2817, 0.166), minor symptoms (6115, 0.361), some restriction in lifestyle but independent (4085, 0.241), dependent, but not requiring constant attention (2567, 0.151), fully dependent, requiring attention day and night (1372, 0.081) <hr class="thinhr"> <span style="font-weight:bold">ndaysicu</span>: Number of Days Spent in ICU<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJQAAAANCAMAAAB4i7dtAAAACVBMVEUAAADMzMz////1iUV5AAAATUlEQVQ4jWNgZGRgYBxkgIGJiQGIBxcYdRSxYNRRxAKG0dxHJBh1FLEA4qhB5i6Yo0BgoN0CB+DcBwVAJiMyQZoAftXgTAUnMPMbCgsAd8YM3zFInn4AAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable871803 {
 border: none;
 font-size: 85%;
 }
 .hmisctable871803 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable871803 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable871803">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20025</td><td>182</td><td>49</td><td>0.822</td><td>2.662</td><td>4.249</td><td> 0</td><td> 0</td><td> 0</td><td> 0</td><td> 3</td><td> 8</td><td>14</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.00  0.12  0.30  0.50  1.00 ,  <font color="MidnightBlue">highest</font>: 40.00 43.00 45.00 54.00 58.00</span> <hr class="thinhr"> <span style="font-weight:bold">bheadinj</span>: Significant Head Injury <style>
 .hmisctable296108 {
 border: none;
 font-size: 85%;
 }
 .hmisctable296108 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable296108 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable296108">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.652</td><td>6422</td><td>0.3191</td><td>0.4346</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">bneuro</span>: Neurosurgery Done <style>
 .hmisctable391712 {
 border: none;
 font-size: 85%;
 }
 .hmisctable391712 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable391712 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable391712">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.28</td><td>2099</td><td>0.1043</td><td>0.1868</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">bchest</span>: Chest Surgery Done <style>
 .hmisctable373018 {
 border: none;
 font-size: 85%;
 }
 .hmisctable373018 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable373018 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable373018">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.385</td><td>3043</td><td>0.1512</td><td>0.2567</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">babdomen</span>: Abdominal Surgery Done <style>
 .hmisctable886142 {
 border: none;
 font-size: 85%;
 }
 .hmisctable886142 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable886142 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable886142">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.563</td><td>5042</td><td>0.2505</td><td>0.3755</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">bpelvis</span>: Pelvis Surgery Done <style>
 .hmisctable936999 {
 border: none;
 font-size: 85%;
 }
 .hmisctable936999 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable936999 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable936999">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.185</td><td>1331</td><td>0.06613</td><td>0.1235</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">bpe</span>: Pulmonary Embolism <style>
 .hmisctable843599 {
 border: none;
 font-size: 85%;
 }
 .hmisctable843599 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable843599 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable843599">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.021</td><td>139</td><td>0.006906</td><td>0.01372</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">bdvt</span>: Deep Vein Thrombosis <style>
 .hmisctable302870 {
 border: none;
 font-size: 85%;
 }
 .hmisctable302870 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable302870 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable302870">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.012</td><td>81</td><td>0.004024</td><td>0.008017</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">bstroke</span>: Stroke <style>
 .hmisctable571936 {
 border: none;
 font-size: 85%;
 }
 .hmisctable571936 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable571936 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable571936">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.018</td><td>121</td><td>0.006012</td><td>0.01195</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">bbleed</span>: Surgery for Bleeding <style>
 .hmisctable814301 {
 border: none;
 font-size: 85%;
 }
 .hmisctable814301 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable814301 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable814301">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.214</td><td>1553</td><td>0.07716</td><td>0.1424</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">bmi</span>: Myocardial Infarction <style>
 .hmisctable134302 {
 border: none;
 font-size: 85%;
 }
 .hmisctable134302 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable134302 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable134302">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.013</td><td>87</td><td>0.004323</td><td>0.008608</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">bgi</span>: Gastrointestinal Bleeding <style>
 .hmisctable895319 {
 border: none;
 font-size: 85%;
 }
 .hmisctable895319 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable895319 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable895319">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.039</td><td>264</td><td>0.01312</td><td>0.02589</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">bloading</span>: Complete Loading Dose of Trial Drug Given <style>
 .hmisctable417381 {
 border: none;
 font-size: 85%;
 }
 .hmisctable417381 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable417381 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable417381">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.027</td><td>19944</td><td>0.9909</td><td>0.01802</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">bmaint</span>: Complete Maintenance Dose of Trial Drug Given <style>
 .hmisctable673204 {
 border: none;
 font-size: 85%;
 }
 .hmisctable673204 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable673204 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable673204">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.163</td><td>18965</td><td>0.9423</td><td>0.1088</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">btransf</span>: Blood Products Transfusion <style>
 .hmisctable420249 {
 border: none;
 font-size: 85%;
 }
 .hmisctable420249 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable420249 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable420249">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>20127</td><td>80</td><td>2</td><td>0.75</td><td>10232</td><td>0.5084</td><td>0.4999</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">ncell</span>: Number of Units of Red Call Products Transfused<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAI4AAAANCAMAAABIB6ZMAAAACVBMVEUAAADMzMz////1iUV5AAAAXUlEQVQ4je2TQQoAIAgEd/v/o7NMSpDoZgcnIrPLIC2oAPwBNAVW5FI6N6aFuJROxAyUxAr4Ilt7OoPs4bTSueF10v90oJM5phEnHNAOaa/1UoSP5BFW2MX1XKpkd8A2DAGzLX2aAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable885813 {
 border: none;
 font-size: 85%;
 }
 .hmisctable885813 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable885813 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable885813">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>10244</td><td>9963</td><td>47</td><td>0.966</td><td>3.919</td><td>3.445</td><td> 1</td><td> 1</td><td> 2</td><td> 3</td><td> 5</td><td> 8</td><td>11</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.0  0.5  1.0  1.5  2.0 ,  <font color="MidnightBlue">highest</font>: 45.0 46.0 49.0 54.0 60.0</span> <hr class="thinhr"> <span style="font-weight:bold">nplasma</span>: Number of Units of Fresh Frozen Plasma Transfused<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAIgAAAANCAMAAABFGdYLAAAACVBMVEUAAADMzMz////1iUV5AAAARklEQVQ4jWNgZGRgYBwEgIGJiQGIBx6MOgQdjDoEHTCM5ho0MOoQdDDqEHQAyTUQyMiAAnFzCChlBBNQJjRPoGURZEGIQgDQfgvfio4AgwAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable603381 {
 border: none;
 font-size: 85%;
 }
 .hmisctable603381 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable603381 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable603381">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>10243</td><td>9964</td><td>45</td><td>0.59</td><td>1.44</td><td>2.46</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>5</td><td>8</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0  1  2  3  4 ,  <font color="MidnightBlue">highest</font>: 46 53 56 59 60</span> <hr class="thinhr"> <span style="font-weight:bold">nplatelets</span>: Number of Units of Platelets Transfused<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAH8AAAANCAMAAAC3iUHrAAAACVBMVEUAAADMzMz////1iUV5AAAAOklEQVQ4jWNgZGRgYBw4wMDExADEAwZG7R/h9o+m/1H7R7L9oPQPzAFghERhiiBLQPMMmCQ/94B0AgBujwsT9a+boAAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable669981 {
 border: none;
 font-size: 85%;
 }
 .hmisctable669981 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable669981 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable669981">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>10243</td><td>9964</td><td>42</td><td>0.218</td><td>0.5526</td><td>1.057</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0  1  2  3  4 ,  <font color="MidnightBlue">highest</font>: 38 41 42 45 87</span> <hr class="thinhr"> <span style="font-weight:bold">ncryo</span>: Number of Units of Cryoprecipitate Transfused<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAFUAAAANCAMAAADv9tLyAAAACVBMVEUAAADMzMz////1iUV5AAAANElEQVQ4jWNgZGBgpDpgYGJgYKI6GDWVRqaOpoFRU4FpgAFMIGMgAYQQBCKgfDjGnwAYGQFAGAdbHi1V6wAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable969343 {
 border: none;
 font-size: 85%;
 }
 .hmisctable969343 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable969343 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable969343">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>10243</td><td>9964</td><td>28</td><td>0.11</td><td>0.2577</td><td>0.5038</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0  1  2  3  4 ,  <font color="MidnightBlue">highest</font>: 28 30 33 36 61</span> <hr class="thinhr"> <span style="font-weight:bold">bvii</span>: Recombinant Factor VIIa Given <style>
 .hmisctable216670 {
 border: none;
 font-size: 85%;
 }
 .hmisctable216670 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable216670 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable216670">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Sum</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>19833</td><td>374</td><td>2</td><td>0.007</td><td>46</td><td>0.002319</td><td>0.004628</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">boxid</span>: Treatment Box Number<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAG0AAAANCAMAAACU0hA+AAAACVBMVEUAAADMzMz////1iUV5AAAAcUlEQVQ4je2SQQ6AMAgEF/7/aLUVpUAJvRhN3FOTyXTbZEFEaKF2IhtAcADTXOJtgpnlwuPENilME5i6raOJE8JaG55sw1va3J0DWSoMTKjZnYkWGcLaJrUJ+7Px+Smsf03Mv+2jbX52mO8KC6N04q5uj3UF8ZHwQWgAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable795739 {
 border: none;
 font-size: 85%;
 }
 .hmisctable795739 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable795739 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable795739">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20207</td><td>0</td><td>2728</td><td>1</td><td>5131</td><td>2767</td><td>2140</td><td>2276</td><td>2734</td><td>4464</td><td>8226</td><td>8674</td><td>8829</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 2001 2002 2003 2004 2005 ,  <font color="MidnightBlue">highest</font>: 9055 9056 9057 9061 9065</span> <hr class="thinhr"> <span style="font-weight:bold">packnum</span>: Treatment Pack Number<div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJEAAAANCAMAAACeonwpAAAACVBMVEUAAADMzMz////1iUV5AAAAWElEQVQ4je2TOwoAMAhDE+9/6NKh9IOWFBw6+FyDBuGBxAp9lIyAsgFm2DEPIaIgnapG1Sij0eFR4IEQeXHteuq/H1WjapTRyBUAfcAxrmtrQrUvOjWXkQ2whwkGHgJ1uQAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable637276 {
 border: none;
 font-size: 85%;
 }
 .hmisctable637276 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable637276 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable637276">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>20207</td><td>0</td><td>48</td><td>0.998</td><td>51.35</td><td>27.62</td><td>22</td><td>23</td><td>27</td><td>45</td><td>82</td><td>86</td><td>88</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 21 22 23 24 25 ,  <font color="MidnightBlue">highest</font>: 94 95 96 97 98</span> <hr class="thinhr"><!--/html_preserve-->


## Univariate summary

### Continous variables

#### Age


Plot age. 




```r
ida_plot_all(crash2, "age", n.dodge = 1)
```

<div class="figure">
<img src="Univar_crash2_files/figure-html/unnamed-chunk-3-1.png" alt="Distribution of subject age [years]" width="768" />
<p class="caption">(\#fig:unnamed-chunk-3)Distribution of subject age [years]</p>
</div>



```r
title <- paste0("Univariate summary of ", with(crash2, label(age)), " [", with(crash2, units(age)), "]")
  
y_axis <- "Number of subjects"
x_axis <- paste0(with(crash2, label(age)), " [", with(crash2, units(age)), "]")

nmiss <- crash2 %>% filter(is.na(age)) %>% tally()
bign <- crash2 %>% filter(!is.na(age)) %>% tally()

caption <- paste0("All observed values, the distribution and the, min, max and interquartile range are reported\n", 
                  bign, " subjects are displayed, with ",
                  nmiss, " subjects with missing values are not presented.")

# for calculating five number summary
x <- with(crash2, as.numeric(age))

p2 <-
  crash2 %>%
  filter(!is.na(age)) %>%
  ggplot2::ggplot(aes(age)) +
  geom_histogram(binwidth = 1,
                 center = 0,
                 alpha = 0.6, fill = "firebrick2") +
  geom_rug() +
  scale_x_continuous(limit = c(min(x), max(x)),
                     breaks = round(fivenum(x), 1)) +
  ylab(y_axis) +
  ggplot2::theme_minimal() +
  theme(
    #axis.title.y = element_text(angle = 0),
    #    panel.grid.major.y = element_blank(),
    panel.grid.major.x = element_line(colour = "grey", size = 0.5),
    panel.grid.minor = element_blank(),
    axis.title.x = element_blank()
    #    axis.text.x = element_blank()
  )

p1 <-
  crash2 %>%
  filter(!is.na(age)) %>%
  ggplot(aes(x = age, y = 0)) +
  geom_jitter(width = 0.1,
              height = 0.1,
              alpha = 0.2, color = "firebrick2") +
  geom_rug(sides = "b") +
  scale_x_continuous(limit = c(min(x), max(x)),
                     breaks = round(fivenum(x), 1)) +
  ggplot2::theme_minimal() +
  ylab(y_axis) +
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(),
    axis.title = element_blank(),
    axis.text = element_blank()
  )


p3 <-
  crash2 %>%
  filter(!is.na(age)) %>%
  ggplot(aes(x = age, y = 0)) +
  geom_boxplot(outlier.shape = NA, width = 0.1) +
  scale_x_continuous(limit = c(min(x), max(x)),
                     breaks = c(round(fivenum(x), 1))) +
  xlab(x_axis) +
  ggplot2::theme_minimal() +
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(),
    axis.title.y = element_blank(),
    axis.text = element_blank()
  )

layout <- c(patchwork::area(1, 1, 1, 6),
            patchwork::area(2, 1, 5, 6),
            patchwork::area(6, 1, 6, 6))

gg <- p1 / p2 / p3 +
  patchwork::plot_layout(design = layout) +
  patchwork::plot_annotation(
    title = title,
    caption = caption
  )

gg
```

<div class="figure">
<img src="Univar_crash2_files/figure-html/unnamed-chunk-4-1.png" alt="Distribution of subject age [years]" width="768" />
<p class="caption">(\#fig:unnamed-chunk-4)Distribution of subject age [years]</p>
</div>



#### Blood pressure

Plot blood pressure. 


```r
source(here("R", "tmp_hist_plot.R"))
ida_plot_all(crash2, "sbp", n.dodge = 1)
```

<div class="figure">
<img src="Univar_crash2_files/figure-html/unnamed-chunk-5-1.png" alt="Distribution of SBP" width="768" />
<p class="caption">(\#fig:unnamed-chunk-5)Distribution of SBP</p>
</div>



#### RR



```r
source(here("R", "tmp_hist_plot.R"))
ida_plot_all(crash2, "rr", n.dodge = 2)
```

<div class="figure">
<img src="Univar_crash2_files/figure-html/unnamed-chunk-6-1.png" alt="Distribution of respiratory rate" width="768" />
<p class="caption">(\#fig:unnamed-chunk-6)Distribution of respiratory rate</p>
</div>


#### RR



```r
ida_plot_all(crash2, "hr", n.dodge = 1)
```

<div class="figure">
<img src="Univar_crash2_files/figure-html/unnamed-chunk-7-1.png" alt="Distribution of heart rate" width="768" />
<p class="caption">(\#fig:unnamed-chunk-7)Distribution of heart rate</p>
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
##  [1] Hmisc_4.4-0        Formula_1.2-3      survival_3.2-3     lattice_0.20-40   
##  [5] summarytools_0.9.6 janitor_2.0.1      forcats_0.5.0      stringr_1.4.0     
##  [9] dplyr_0.8.5        purrr_0.3.4        readr_1.3.1        tidyr_1.0.2       
## [13] tibble_3.0.1       ggplot2_3.3.0      tidyverse_1.3.0    here_0.1          
## 
## loaded via a namespace (and not attached):
##  [1] nlme_3.1-145        matrixStats_0.56.0  fs_1.3.2           
##  [4] lubridate_1.7.4     RColorBrewer_1.1-2  httr_1.4.1         
##  [7] rprojroot_1.3-2     tools_3.6.1         backports_1.1.7    
## [10] R6_2.4.1            rpart_4.1-15        DBI_1.1.0          
## [13] colorspace_1.4-1    nnet_7.3-13         withr_2.2.0        
## [16] tidyselect_1.1.0    gridExtra_2.3       compiler_3.6.1     
## [19] cli_2.0.2           rvest_0.3.5         htmlTable_1.13.3   
## [22] xml2_1.2.5          labeling_0.3        bookdown_0.18      
## [25] scales_1.1.1        checkmate_2.0.0     digest_0.6.25      
## [28] foreign_0.8-76      rmarkdown_2.1       base64enc_0.1-3    
## [31] jpeg_0.1-8.1        pkgconfig_2.0.3     htmltools_0.4.0    
## [34] highr_0.8           dbplyr_1.4.2        htmlwidgets_1.5.1  
## [37] rlang_0.4.6         readxl_1.3.1        rstudioapi_0.11    
## [40] pryr_0.1.4          farver_2.0.3        generics_0.0.2     
## [43] jsonlite_1.6.1      acepack_1.4.1       magrittr_1.5       
## [46] rapportools_1.0     patchwork_1.0.0     Matrix_1.2-18      
## [49] Rcpp_1.0.4.6        munsell_0.5.0       fansi_0.4.1        
## [52] lifecycle_0.2.0     stringi_1.4.6       yaml_2.2.1         
## [55] snakecase_0.11.0    plyr_1.8.6          grid_3.6.1         
## [58] crayon_1.3.4        haven_2.2.0         splines_3.6.1      
## [61] pander_0.6.3        hms_0.5.3           magick_2.3         
## [64] knitr_1.28          pillar_1.4.4        tcltk_3.6.1        
## [67] codetools_0.2-16    reprex_0.3.0        glue_1.4.1         
## [70] evaluate_0.14       latticeExtra_0.6-29 data.table_1.12.8  
## [73] modelr_0.1.6        png_0.1-7           vctrs_0.3.0        
## [76] cellranger_1.1.0    gtable_0.3.0        assertthat_0.2.1   
## [79] xfun_0.12           broom_0.5.5         cluster_2.1.0      
## [82] ellipsis_0.3.0
```


