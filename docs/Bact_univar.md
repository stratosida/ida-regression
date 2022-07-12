# Univariate distribution checks

This section reports a series of univariate summary checks of the bacteremia dataset.



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
 <font color="MidnightBlue"><div align=center><span style="font-weight:bold">Demographic variables <br><br> 2  Variables   14691  Observations</span></div></font> <hr class="thinhr"> <span style="font-weight:bold">Alter</span>: Patient Age <span style='font-family:Verdana;font-size:75%;'>years</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAeUlEQVQ4jcXTSw4AERAE0Gr3P/REhzDM+PSHWohVe0iB7IMczYxgGSCgimaSpemF0tFUrnxuz1HLpK4hpZWlxcNVTeXtjkvyevPOgHsldXyEVoraXCDdqby9X9b/0VMhd51VzWi4hhrLLrt+cdw1y7YJEgtalughegBpCgbX7iPW9QAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable866347 {
 border: none;
 font-size: 80%;
 }
 .hmisctable866347 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable866347 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable866347">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14691</td><td>0</td><td>85</td><td>1</td><td>56.17</td><td>20.78</td><td>24</td><td>29</td><td>43</td><td>58</td><td>70</td><td>79</td><td>84</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  16  17  18  19  20 ,  <font color="MidnightBlue">highest</font>:  96  97  98  99 101</span> <hr class="thinhr"> <span style="font-weight:bold">sex</span>: Patient Sex <span style='font-family:Verdana;font-size:75%;'>1=male, 2=female</span> <style>
 .hmisctable587462 {
 border: none;
 font-size: 80%;
 }
 .hmisctable587462 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable587462 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable587462">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th></tr>
 <tr><td>14691</td><td>0</td><td>2</td><td>0.73</td><td>1.419</td><td>0.4869</td></tr>
 </table>
 <pre style="font-size:85%;">
 Value          1     2
 Frequency   8536  6155
 Proportion 0.581 0.419
 </pre>
 <hr class="thinhr">
```


### Pivotal variables and very important predictors


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
 <font color="MidnightBlue"><div align=center><span style="font-weight:bold">Pivotal variables and VIPs <br><br> 6  Variables   14691  Observations</span></div></font> <hr class="thinhr"> <span style="font-weight:bold">WBC</span>: White blood count <span style='font-family:Verdana;font-size:75%;'>G/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAIIAAAANCAMAAABSO0bCAAAACVBMVEUAAADMzMz////1iUV5AAAAVklEQVQ4je2TSwoAIAhEx+5/6PwRSdB2XDiRVG4e0oNoACEGSwOvrDRBwCA0QHAhqErkFJhjGIQbgciAJGAihBBPQhNb4hf7uVLM8d45Rwm/6vPfBt0b3GoLNRPwTDwAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable298229 {
 border: none;
 font-size: 70%;
 }
 .hmisctable298229 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable298229 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable298229">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14229</td><td>462</td><td>2710</td><td>1</td><td>11.23</td><td>7.602</td><td> 2.66</td><td> 4.26</td><td> 6.63</td><td> 9.60</td><td>13.53</td><td>18.22</td><td>22.27</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   0.00   0.01   0.02   0.03   0.04 ,  <font color="MidnightBlue">highest</font>: 365.30 383.74 387.73 433.83 604.47</span> <hr class="thinhr"> <span style="font-weight:bold">Alter</span>: Patient Age <span style='font-family:Verdana;font-size:75%;'>years</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAeUlEQVQ4jcXTSw4AERAE0Gr3P/REhzDM+PSHWohVe0iB7IMczYxgGSCgimaSpemF0tFUrnxuz1HLpK4hpZWlxcNVTeXtjkvyevPOgHsldXyEVoraXCDdqby9X9b/0VMhd51VzWi4hhrLLrt+cdw1y7YJEgtalughegBpCgbX7iPW9QAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable113842 {
 border: none;
 font-size: 80%;
 }
 .hmisctable113842 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable113842 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable113842">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14691</td><td>0</td><td>85</td><td>1</td><td>56.17</td><td>20.78</td><td>24</td><td>29</td><td>43</td><td>58</td><td>70</td><td>79</td><td>84</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  16  17  18  19  20 ,  <font color="MidnightBlue">highest</font>:  96  97  98  99 101</span> <hr class="thinhr"> <span style="font-weight:bold">BUN</span>: Blood urea nitrogen <span style='font-family:Verdana;font-size:75%;'>mg/dl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAZElEQVQ4jdXTwQrAIAwD0NT//+jhaiZ0U7wlCz1IT49iEAx6wiVozO1qLvmJywZWXS4yMgAzF///jLSHzPteHidLA2rEqqVLTlu7tDbsWEJhb98BCzFn//xalW0WbsxT/1yMV1y21QwKyo8xNQAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable899114 {
 border: none;
 font-size: 80%;
 }
 .hmisctable899114 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable899114 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable899114">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14519</td><td>172</td><td>947</td><td>1</td><td>22.66</td><td>16.92</td><td> 7.1</td><td> 8.6</td><td>11.6</td><td>16.6</td><td>26.9</td><td>44.8</td><td>60.8</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   2.5   2.7   2.8   2.9   3.0 ,  <font color="MidnightBlue">highest</font>: 160.6 171.3 171.9 176.0 184.8</span> <hr class="thinhr"> <span style="font-weight:bold">KREA</span>: Creatinine <span style='font-family:Verdana;font-size:75%;'>mg/dl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAWUlEQVQ4je2TMQoAIAwDE///aG3sIAqCWwqeQ6mKHoWAAqAXaAKD5sT3euN7vZE5DC+rSM4pSctqYBW8nMxqePm4RQjB1Usd93LuXK5pUU9nZX6TzT36cdoBj3gMym+2tjYAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable847743 {
 border: none;
 font-size: 70%;
 }
 .hmisctable847743 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable847743 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable847743">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14532</td><td>159</td><td>674</td><td>1</td><td>1.329</td><td>0.8518</td><td>0.620</td><td>0.690</td><td>0.810</td><td>1.000</td><td>1.350</td><td>2.160</td><td>3.144</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.26  0.27  0.28  0.29  0.30 ,  <font color="MidnightBlue">highest</font>: 15.24 15.40 15.67 16.64 20.75</span> <hr class="thinhr"> <span style="font-weight:bold">NEU</span>: Neutrophiles <span style='font-family:Verdana;font-size:75%;'>G/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAZ0lEQVQ4jc2VSw7AIAgFx97/0A19JUVru+WNnwCriRFlJKDlAUcCWh5Ur8BFbfXC18tCLRXAzCvv/0RrK8rn1nvTfF6+Xnq4dnR7/eHqRc9by9qKG+LbvMaz1bgWRkzFJZ077TOpxRPORQvfG+yn6gAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable374979 {
 border: none;
 font-size: 70%;
 }
 .hmisctable374979 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable374979 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable374979">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13963</td><td>728</td><td>374</td><td>1</td><td>8.367</td><td>5.776</td><td> 1.60</td><td> 2.70</td><td> 4.60</td><td> 7.30</td><td>10.80</td><td>15.08</td><td>18.40</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.0  0.1  0.2  0.3  0.4 ,  <font color="MidnightBlue">highest</font>: 54.0 56.4 63.7 71.6 83.8</span> <hr class="thinhr"> <span style="font-weight:bold">PLT</span>: Blood platelets <span style='font-family:Verdana;font-size:75%;'>G/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAb0lEQVQ4jc3VSxKAIAwD0NT7H1oRyoTyW6YRBHZvdDLAOEAZGYKHA5SRIdFVI8KwZDikdIGiAzmGtplg1L7BpWtiw3RgjPJr9f84qdQwbFlaGk4sIe3qEuEQi7hOvTl5+mL4HzNfWp/oPXXt1sVvvvKdC/MeZXfKAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable302453 {
 border: none;
 font-size: 80%;
 }
 .hmisctable302453 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable302453 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable302453">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14649</td><td>42</td><td>718</td><td>1</td><td>220</td><td>130.1</td><td> 50</td><td> 81</td><td>140</td><td>204</td><td>277</td><td>369</td><td>445</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :    0    1    2    3    4 ,  <font color="MidnightBlue">highest</font>: 1068 1211 1321 1639 2092</span> <hr class="thinhr">
```

### Further variables related to leukocyte types and leukocyte ratios


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
 <font color="MidnightBlue"><div align=center><span style="font-weight:bold">Leukocyte related variables and leukocyte ratios <br><br> 11  Variables   14691  Observations</span></div></font> <hr class="thinhr"> <span style="font-weight:bold">WBC</span>: White blood count <span style='font-family:Verdana;font-size:75%;'>G/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAIIAAAANCAMAAABSO0bCAAAACVBMVEUAAADMzMz////1iUV5AAAAVklEQVQ4je2TSwoAIAhEx+5/6PwRSdB2XDiRVG4e0oNoACEGSwOvrDRBwCA0QHAhqErkFJhjGIQbgciAJGAihBBPQhNb4hf7uVLM8d45Rwm/6vPfBt0b3GoLNRPwTDwAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable141450 {
 border: none;
 font-size: 70%;
 }
 .hmisctable141450 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable141450 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable141450">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14229</td><td>462</td><td>2710</td><td>1</td><td>11.23</td><td>7.602</td><td> 2.66</td><td> 4.26</td><td> 6.63</td><td> 9.60</td><td>13.53</td><td>18.22</td><td>22.27</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   0.00   0.01   0.02   0.03   0.04 ,  <font color="MidnightBlue">highest</font>: 365.30 383.74 387.73 433.83 604.47</span> <hr class="thinhr"> <span style="font-weight:bold">NEU</span>: Neutrophiles <span style='font-family:Verdana;font-size:75%;'>G/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAZ0lEQVQ4jc2VSw7AIAgFx97/0A19JUVru+WNnwCriRFlJKDlAUcCWh5Ur8BFbfXC18tCLRXAzCvv/0RrK8rn1nvTfF6+Xnq4dnR7/eHqRc9by9qKG+LbvMaz1bgWRkzFJZ077TOpxRPORQvfG+yn6gAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable125567 {
 border: none;
 font-size: 70%;
 }
 .hmisctable125567 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable125567 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable125567">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13963</td><td>728</td><td>374</td><td>1</td><td>8.367</td><td>5.776</td><td> 1.60</td><td> 2.70</td><td> 4.60</td><td> 7.30</td><td>10.80</td><td>15.08</td><td>18.40</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.0  0.1  0.2  0.3  0.4 ,  <font color="MidnightBlue">highest</font>: 54.0 56.4 63.7 71.6 83.8</span> <hr class="thinhr"> <span style="font-weight:bold">EOS</span>: Eosinophils <span style='font-family:Verdana;font-size:75%;'>G/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAG0AAAANCAMAAACU0hA+AAAACVBMVEUAAADMzMz////1iUV5AAAAQklEQVQ4jWNgZGBgpBtgYGJgYKIbGLWNmrbRzzoGYJqkX6Kks9/obxvdrBvWtoHSJBoAFZ3AdIqUVvGlWgacHEyFAKxGCXLIBO+sAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable657747 {
 border: none;
 font-size: 80%;
 }
 .hmisctable657747 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable657747 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable657747">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14556</td><td>135</td><td>36</td><td>0.867</td><td>0.1148</td><td>0.1585</td><td>0.0</td><td>0.0</td><td>0.0</td><td>0.1</td><td>0.1</td><td>0.3</td><td>0.4</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.0  0.1  0.2  0.3  0.4 ,  <font color="MidnightBlue">highest</font>:  3.8  5.3  9.6 11.5 15.8</span> <hr class="thinhr"> <span style="font-weight:bold">BASO</span>: Basophiles <span style='font-family:Verdana;font-size:75%;'>G/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAADcAAAANCAMAAAA65Aa/AAAACVBMVEUAAADMzMz////1iUV5AAAAJklEQVQokWNgYGAkBzAwMDCRA0aAvtHwxK6PLI0MqAASVoRDkxEAwHkEtC6j9aoAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable362959 {
 border: none;
 font-size: 80%;
 }
 .hmisctable362959 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable362959 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable362959">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14545</td><td>146</td><td>18</td><td>0.337</td><td>0.01725</td><td>0.03111</td><td>0.0</td><td>0.0</td><td>0.0</td><td>0.0</td><td>0.0</td><td>0.1</td><td>0.1</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 0.0 0.1 0.2 0.3 0.4 ,  <font color="MidnightBlue">highest</font>: 1.3 1.4 1.5 2.2 6.5</span> <pre style="font-size:85%;">
 Value        0.0   0.1   0.2   0.3   0.4   0.5   0.6   0.7   0.8   0.9   1.0   1.1
 Frequency  12671  1636   109    59    31    14     6     7     1     2     1     2
 Proportion 0.871 0.112 0.007 0.004 0.002 0.001 0.000 0.000 0.000 0.000 0.000 0.000
                                               
 Value        1.2   1.3   1.4   1.5   2.2   6.5
 Frequency      1     1     1     1     1     1
 Proportion 0.000 0.000 0.000 0.000 0.000 0.000
 </pre>
 <hr class="thinhr"> <span style="font-weight:bold">LYM</span>: Lymphocytes <span style='font-family:Verdana;font-size:75%;'>G/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAADQAAAANCAMAAADR0728AAAACVBMVEUAAADMzMz////1iUV5AAAAJ0lEQVQokWNgYGAkGTAwMDCRDIapptHQo0QTCDBCICNGUGIJXQZGAAh1BHO9ZpTEAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable845411 {
 border: none;
 font-size: 80%;
 }
 .hmisctable845411 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable845411 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable845411">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14429</td><td>262</td><td>114</td><td>0.998</td><td>1.366</td><td>1.162</td><td>0.2</td><td>0.4</td><td>0.7</td><td>1.0</td><td>1.6</td><td>2.1</td><td>2.6</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   0.0   0.1   0.2   0.3   0.4 ,  <font color="MidnightBlue">highest</font>: 149.9 357.5 366.8 375.1 578.1</span> <pre style="font-size:85%;">
 Value          0     5    10    15    20    30    35    40    45    75   100   115
 Frequency  13675   703    27     7     4     2     1     1     1     1     1     1
 Proportion 0.948 0.049 0.002 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
                                         
 Value        150   360   365   375   580
 Frequency      1     1     1     1     1
 Proportion 0.000 0.000 0.000 0.000 0.000
 </pre>
  For the frequency table, variable is rounded to the nearest 5 <hr class="thinhr"> <span style="font-weight:bold">MONO</span>: Monocytes <span style='font-family:Verdana;font-size:75%;'>G/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAZElEQVQ4jc3TQQrAIAxE0R/vf+g2SQVt6/7PQkQMPAJDVLgTpjAq6RqmtAZsMLULt8sEqxZOl6iS275EC0sK+GBsLA/s7bLAPi6JjKWN5wT1L7q9T2PqmC/0cWrXMrde/wfy9QKVEwyUdyZZMgAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable900675 {
 border: none;
 font-size: 80%;
 }
 .hmisctable900675 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable900675 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable900675">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14445</td><td>246</td><td>67</td><td>0.996</td><td>0.8527</td><td>0.5965</td><td>0.1</td><td>0.3</td><td>0.5</td><td>0.8</td><td>1.1</td><td>1.5</td><td>1.8</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.0  0.1  0.2  0.3  0.4 ,  <font color="MidnightBlue">highest</font>: 13.9 14.6 16.2 17.3 20.4</span> <hr class="thinhr"> <span style="font-weight:bold">NEUR</span>: Neutrophile ratio <span style='font-family:Verdana;font-size:75%;'>%</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAcUlEQVQ4jcXUgQqAIAwE0NP//+gsI8TtRDRvR0iMKY9oIgUETVhL1gZ9SsXtk5ocF8JdHonCZC6uinK9f9E4ZpN2+njU8zinMp/spGueZGHI5AJRozrZ/64l0CkXuzKXZbjnpT5w3kjZNHzrbp4jyzxeD/MJrwib458AAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable128056 {
 border: none;
 font-size: 70%;
 }
 .hmisctable128056 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable128056 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable128056">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13959</td><td>732</td><td>3850</td><td>1</td><td>75.15</td><td>15.6</td><td>47.42</td><td>57.88</td><td>69.23</td><td>78.33</td><td>85.32</td><td>90.13</td><td>92.63</td></tr>
 </table>
 <style>
 .hmisctable313885 {
 border: none;
 font-size: 85%;
 }
 .hmisctable313885 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable313885 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable313885">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td>  0.000000</td><td>  1.484829</td><td>  1.935484</td><td>  1.960784</td><td>  2.413793</td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td> 99.122807</td><td> 99.166667</td><td> 99.476440</td><td> 99.484536</td><td>100.000000</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">EOSR</span>: Eosinophil ratio <span style='font-family:Verdana;font-size:75%;'>%</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAGEAAAANCAMAAACO7vCwAAAACVBMVEUAAADMzMz////1iUV5AAAARElEQVQ4je2SQQoAIAzDGv//aFEKQ/Da4cFCCzuFQYRENBrSiOYTHiG0uJR9ookQRXQRkpDlkoNbg4ddYetKPh3XTSSYF4MIVFDP+KgAAAAASUVORK5CYII=" alt="image" /></div> <pre style="font-size:80%;">
        n  missing distinct     Info     Mean      Gmd      .05      .10      .25 
    13959      732      927    0.891    1.297    1.825   0.0000   0.0000   0.0000 
      .50      .75      .90      .95 
   0.5882   1.7857   3.4900   5.0000 
 </pre>
 <style>
 .hmisctable811205 {
 border: none;
 font-size: 85%;
 }
 .hmisctable811205 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable811205 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable811205">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td> 0.0000000</td><td> 0.1834862</td><td> 0.2028398</td><td> 0.2178649</td><td> 0.2188184</td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td>39.1752577</td><td>46.6019417</td><td>46.9026549</td><td>50.0000000</td><td>73.4883721</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">BASOR</span>: Basophile ratio <span style='font-family:Verdana;font-size:75%;'>%</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAHMAAAANCAMAAACttaFlAAAACVBMVEUAAADMzMz////1iUV5AAAAPklEQVQ4jWNgZGBgpDNgYGJgYKIzGLVzmNk5mm5H7RyKdgLTLTbACMGgVAakGZHSNgOcQEuNjCgSuHIDUBwA2JUKBUCC2pEAAAAASUVORK5CYII=" alt="image" /></div> <pre style="font-size:80%;">
        n  missing distinct     Info     Mean      Gmd      .05      .10      .25 
    13959      732      419    0.322    0.145   0.2679   0.0000   0.0000   0.0000 
      .50      .75      .90      .95 
   0.0000   0.0000   0.5501   1.0526 
 </pre>
 <style>
 .hmisctable772727 {
 border: none;
 font-size: 85%;
 }
 .hmisctable772727 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable772727 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable772727">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td> 0.0000000</td><td> 0.1358696</td><td> 0.1545595</td><td> 0.1652893</td><td> 0.1818182</td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td>11.1111111</td><td>15.2173913</td><td>16.6666667</td><td>18.4210526</td><td>23.6559140</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">LYMR</span>: Lymphocyte ratio <span style='font-family:Verdana;font-size:75%;'>% (mg/dl)</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAZ0lEQVQ4jdXTUQrAIAwD0NT7H9o5rBNXtV+mBhERwUchkC8okRhB0qAlBYjliiBrBNzg4tP0/5HFlmn/DBe1mphNizy1rYskc7ge2XkcHCzG4OBWnQXCruIu0q316X8tdR8fvDXUUwbBUQsZjNtF2AAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable955608 {
 border: none;
 font-size: 70%;
 }
 .hmisctable955608 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable955608 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable955608">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13959</td><td>732</td><td>3121</td><td>1</td><td>14.61</td><td>11.87</td><td> 2.752</td><td> 4.000</td><td> 6.757</td><td>11.340</td><td>18.182</td><td>27.869</td><td>36.620</td></tr>
 </table>
 <style>
 .hmisctable153003 {
 border: none;
 font-size: 85%;
 }
 .hmisctable153003 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable153003 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable153003">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td>  0.0000000</td><td>  0.3215434</td><td>  0.4484305</td><td>  0.4608295</td><td>  0.4636785</td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td> 97.2413793</td><td> 97.4193548</td><td> 98.0000000</td><td> 99.1847826</td><td>100.0000000</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">MONOR</span>: Monocyte ratio <span style='font-family:Verdana;font-size:75%;'>%</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAZUlEQVQ4jdWTQQrAIAwEJ/7/0U2tRkkRest2ZFHBwxBZbAPHNKAt6DQJ9L0ICnWCP3kpiEX/2Kls4tAJQaQGNhXQ83IN3qh6FZuRv1BEjdTEhD2x4ykud4d6Rpvn1petB1+66LkAcgcMIWflPQ8AAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable768250 {
 border: none;
 font-size: 70%;
 }
 .hmisctable768250 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable768250 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable768250">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13959</td><td>732</td><td>2334</td><td>1</td><td>8.793</td><td>5.4</td><td> 2.000</td><td> 3.390</td><td> 5.634</td><td> 8.000</td><td>10.870</td><td>14.141</td><td>17.021</td></tr>
 </table>
 <style>
 .hmisctable446836 {
 border: none;
 font-size: 85%;
 }
 .hmisctable446836 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable446836 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable446836">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td>  0.0000000</td><td>  0.2747253</td><td>  0.3412969</td><td>  0.3448276</td><td>  0.4566210</td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td> 68.5446009</td><td> 69.2307692</td><td> 70.3703704</td><td> 72.7272727</td><td>100.0000000</td></tr>
 </table>
 <hr class="thinhr">
```

### Kidney function related variables


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
 <font color="MidnightBlue"><div align=center><span style="font-weight:bold">Kidney function related variables <br><br> 5  Variables   14691  Observations</span></div></font> <hr class="thinhr"> <span style="font-weight:bold">BUN</span>: Blood urea nitrogen <span style='font-family:Verdana;font-size:75%;'>mg/dl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAZElEQVQ4jdXTwQrAIAwD0NT//+jhaiZ0U7wlCz1IT49iEAx6wiVozO1qLvmJywZWXS4yMgAzF///jLSHzPteHidLA2rEqqVLTlu7tDbsWEJhb98BCzFn//xalW0WbsxT/1yMV1y21QwKyo8xNQAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable590242 {
 border: none;
 font-size: 80%;
 }
 .hmisctable590242 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable590242 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable590242">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14519</td><td>172</td><td>947</td><td>1</td><td>22.66</td><td>16.92</td><td> 7.1</td><td> 8.6</td><td>11.6</td><td>16.6</td><td>26.9</td><td>44.8</td><td>60.8</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   2.5   2.7   2.8   2.9   3.0 ,  <font color="MidnightBlue">highest</font>: 160.6 171.3 171.9 176.0 184.8</span> <hr class="thinhr"> <span style="font-weight:bold">K</span>: Potassium <span style='font-family:Verdana;font-size:75%;'>mmol/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAADcAAAANCAMAAAA65Aa/AAAACVBMVEUAAADMzMz////1iUV5AAAAO0lEQVQokWNgZGRkYGAkGTAwMTExgAgSwQDoY6CrPlBwkhGgEPtIt3Do6GMgTx84OKEAFE4gRDB4GRgBpaoEm4UN9kgAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable145506 {
 border: none;
 font-size: 80%;
 }
 .hmisctable145506 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable145506 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable145506">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>12683</td><td>2008</td><td>408</td><td>1</td><td>4.003</td><td>0.6004</td><td>3.20</td><td>3.39</td><td>3.66</td><td>3.95</td><td>4.29</td><td>4.67</td><td>4.92</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  1.92  2.07  2.11  2.12  2.21 ,  <font color="MidnightBlue">highest</font>:  8.57 11.34 13.55 14.60 36.62</span> <pre style="font-size:85%;">
 Value        2.0   2.5   3.0   3.5   4.0   4.5   5.0   5.5   6.0   6.5   7.0   7.5
 Frequency      6    91   650  3385  5088  2455   692   201    73    26     7     2
 Proportion 0.000 0.007 0.051 0.267 0.401 0.194 0.055 0.016 0.006 0.002 0.001 0.000
                                               
 Value        8.0   8.5  11.5  13.5  14.5  36.5
 Frequency      2     1     1     1     1     1
 Proportion 0.000 0.000 0.000 0.000 0.000 0.000
 </pre>
  For the frequency table, variable is rounded to the nearest 0.5 <hr class="thinhr"> <span style="font-weight:bold">KREA</span>: Creatinine <span style='font-family:Verdana;font-size:75%;'>mg/dl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAWUlEQVQ4je2TMQoAIAwDE///aG3sIAqCWwqeQ6mKHoWAAqAXaAKD5sT3euN7vZE5DC+rSM4pSctqYBW8nMxqePm4RQjB1Usd93LuXK5pUU9nZX6TzT36cdoBj3gMym+2tjYAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable472253 {
 border: none;
 font-size: 70%;
 }
 .hmisctable472253 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable472253 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable472253">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14532</td><td>159</td><td>674</td><td>1</td><td>1.329</td><td>0.8518</td><td>0.620</td><td>0.690</td><td>0.810</td><td>1.000</td><td>1.350</td><td>2.160</td><td>3.144</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.26  0.27  0.28  0.29  0.30 ,  <font color="MidnightBlue">highest</font>: 15.24 15.40 15.67 16.64 20.75</span> <hr class="thinhr"> <span style="font-weight:bold">eGFR</span>: estimated glomerular filtration rate <span style='font-family:Verdana;font-size:75%;'>mL/min/1.73 m<sup>2</sup></span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAb0lEQVQ4jcXTUQrAIAwD0MT7H1oWhjKYuNY489G/tk+hoC8AfLOKJWjxzCurczDIKdfIc8x1rZyhDLRI9zeOyTW5MGoFGTS1mO9R781aHP/26PJZbC4N2IDK8tBZ2xN2/aKK6cD8reWiI38rovAuFWKaB/icc14MAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable750811 {
 border: none;
 font-size: 70%;
 }
 .hmisctable750811 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable750811 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable750811">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14532</td><td>159</td><td>9708</td><td>1</td><td>72.14</td><td>35.06</td><td> 17.52</td><td> 27.21</td><td> 49.70</td><td> 75.59</td><td> 95.22</td><td>109.76</td><td>118.09</td></tr>
 </table>
 <style>
 .hmisctable674332 {
 border: none;
 font-size: 85%;
 }
 .hmisctable674332 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable674332 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable674332">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td>  2.430496</td><td>  2.644088</td><td>  2.783769</td><td>  2.874308</td><td>  2.901780</td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td>162.497066</td><td>163.668639</td><td>165.504354</td><td>169.958856</td><td>175.747773</td></tr>
 </table>
 <hr class="thinhr"> <span style="font-weight:bold">BUN_KREA</span>: BUN/Scr ratio <span style='font-family:Verdana;font-size:75%;'>unitless</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAb0lEQVQ4jc2TMQ6AMAwD7f7/0VCgqgNJxYS5IWrUwadIBiM4oB20AC6am8LLbhbzgb+I1V5eMU3HHZvV7qIdeGCrI5f3Ml5MkhMtn9qMLbRMZiO0tvLI4aXW13a9ckiaWMIx8ocsPId0bC7LpvfPDeFBC5RbtXCMAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable700310 {
 border: none;
 font-size: 70%;
 }
 .hmisctable700310 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable700310 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable700310">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14517</td><td>174</td><td>9708</td><td>1</td><td>17.87</td><td>8.898</td><td> 8.048</td><td> 9.482</td><td>12.101</td><td>15.902</td><td>21.136</td><td>28.906</td><td>34.683</td></tr>
 </table>
 <style>
 .hmisctable229953 {
 border: none;
 font-size: 85%;
 }
 .hmisctable229953 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable229953 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable229953">
 <tr><td><font color="MidnightBlue">lowest</font> :</td><td>  2.101990</td><td>  2.486957</td><td>  2.674419</td><td>  3.215339</td><td>  3.222222</td></tr>
 <tr><td><font color="MidnightBlue">highest</font>:</td><td> 82.463768</td><td> 83.625000</td><td> 84.230769</td><td> 90.526316</td><td>112.857143</td></tr>
 </table>
 <hr class="thinhr">
```

### Acute phase reaction related variables


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
 <font color="MidnightBlue"><div align=center><span style="font-weight:bold">Acute phase related variables <br><br> 5  Variables   14691  Observations</span></div></font> <hr class="thinhr"> <span style="font-weight:bold">FIB</span>: Fibrinogen <span style='font-family:Verdana;font-size:75%;'>mg/dl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAdUlEQVQ4jdXT4QrAIAgE4HPv/9BDV1vBzEndxi6k/CMfgZAwgFW5zuIG2zCAlqZ92pub0OWETRtOd1UV94krUlF1/tSnLJLLXcJEXtzHlIvwaXcDsyaG7y+uGdNKWzNkBam6ppG6SzjOukjfXKdr+rZe5hHZAUlUCS1CNfA/AAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable786676 {
 border: none;
 font-size: 80%;
 }
 .hmisctable786676 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable786676 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable786676">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>12124</td><td>2567</td><td>1084</td><td>1</td><td>547.4</td><td>231</td><td>247</td><td>301</td><td>397</td><td>529</td><td>674</td><td>816</td><td>892</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   55   60   66   67   69 ,  <font color="MidnightBlue">highest</font>: 1506 1508 1529 1537 1593</span> <hr class="thinhr"> <span style="font-weight:bold">CRP</span>: C-reactive protein <span style='font-family:Verdana;font-size:75%;'>mg/dl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAaElEQVQ4je2T0QrAIAhFr/7/R5fLVVsRbrD0YUcs9OkgXFAGoGiAGRmOhnqFM/u9nlG9ilkYP0gab3hnUejuNeB6r4WXp57By8XO7LVZ8Y3Xafel4SyPNuhoKf1aTRbUjSVw2tcU1jcBTcULVJrKiXAAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable585452 {
 border: none;
 font-size: 70%;
 }
 .hmisctable585452 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable585452 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable585452">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14536</td><td>155</td><td>3328</td><td>1</td><td>10.92</td><td>10.39</td><td> 0.29</td><td> 0.77</td><td> 2.87</td><td> 8.57</td><td>16.45</td><td>24.49</td><td>29.61</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.00  0.01  0.02  0.03  0.04 ,  <font color="MidnightBlue">highest</font>: 58.40 61.81 63.96 73.04 76.32</span> <hr class="thinhr"> <span style="font-weight:bold">ASAT</span>: Aspartate transaminase <span style='font-family:Verdana;font-size:75%;'>U/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAUUlEQVQ4je2TOw4AIAjFivc/tKiRz8jGQCNRgeEtRQSkH6yFVjsmV43JVYPxsUTrXA2DTa4a10cjvnPnKPKOfbRuCxOav2NW+e3SB/3Jk7CwAYVuDSQpvkmaAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable652122 {
 border: none;
 font-size: 80%;
 }
 .hmisctable652122 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable652122 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable652122">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13537</td><td>1154</td><td>650</td><td>1</td><td>86.9</td><td>115.6</td><td> 15</td><td> 17</td><td> 22</td><td> 31</td><td> 56</td><td>121</td><td>218</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :     3     5     6     7     8 ,  <font color="MidnightBlue">highest</font>: 10845 11928 12079 12380 13991</span> <hr class="thinhr"> <span style="font-weight:bold">ALAT</span>: Alanin transaminase <span style='font-family:Verdana;font-size:75%;'>U/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAGcAAAANCAMAAACD8ID3AAAACVBMVEUAAADMzMz////1iUV5AAAAPElEQVQ4jWNgZGBgpANgYGJgYKIDGLVnkNszmt5G7YHaQw+LQOkNBaNxIImFEZwqQWJoyRNrYsUQAwoAAOjvCPHpfMT7AAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable909320 {
 border: none;
 font-size: 80%;
 }
 .hmisctable909320 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable909320 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable909320">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13704</td><td>987</td><td>578</td><td>1</td><td>67.66</td><td>90.07</td><td>  9</td><td> 11</td><td> 16</td><td> 26</td><td> 48</td><td>101</td><td>175</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :     0     1     2     3     4 ,  <font color="MidnightBlue">highest</font>:  7109  9136  9314 12329 15059</span> <hr class="thinhr"> <span style="font-weight:bold">GGT</span>: Γ-glutamyl transpeptidase <span style='font-family:Verdana;font-size:75%;'>G/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAWElEQVQ4je2TOQoAIBADE///aPdQQVHQLoWD8WwGIaABUA0UAzFL8b3egFt9r2vgbdTso+Z/pZecmLqXmtjwEjNrfQyY2S5ty8M7ffTEufdqbtl6se+ipQIV2Az96NLBUwAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable765640 {
 border: none;
 font-size: 70%;
 }
 .hmisctable765640 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable765640 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable765640">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13429</td><td>1262</td><td>858</td><td>1</td><td>115.1</td><td>141.3</td><td> 13.0</td><td> 16.0</td><td> 25.0</td><td> 49.0</td><td>117.0</td><td>262.2</td><td>429.0</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :    3    5    6    7    8 ,  <font color="MidnightBlue">highest</font>: 2932 3303 3782 3919 5171</span> <hr class="thinhr">
```

### Remaining variables


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
 <font color="MidnightBlue"><div align=center><span style="font-weight:bold">Remaining variables <br><br> 29  Variables   14691  Observations</span></div></font> <hr class="thinhr"> <span style="font-weight:bold">MCV</span>: Mean corpuscular volume <span style='font-family:Verdana;font-size:75%;'>pg</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAcElEQVQ4jdWTUQrAIAxDn7v/ocesiB8dTpPBFqnoh+mjEopBEGUUh0EQZZTuxigDUXPVHf7BZWLTXMjk4dJSk+kDeczn5RjZvkXKZPvKd7h0ts3nMyjUaC4/fUDkGNuVnl6UYd0cVzWxq62p7WNrlxOhtwtH44vcgwAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable968469 {
 border: none;
 font-size: 80%;
 }
 .hmisctable968469 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable968469 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable968469">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14649</td><td>42</td><td>506</td><td>1</td><td>88.35</td><td>6.992</td><td>78.2</td><td>81.1</td><td>84.7</td><td>88.3</td><td>92.0</td><td>95.9</td><td>99.0</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  51.0  52.6  54.9  56.3  57.5 ,  <font color="MidnightBlue">highest</font>: 121.0 121.8 124.6 127.9 128.7</span> <hr class="thinhr"> <span style="font-weight:bold">HGB</span>: Haemoglobin <span style='font-family:Verdana;font-size:75%;'>G/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAeklEQVQ4jcXVjQqAIAwE4LP3f+jYlQoh4W5TD8MKfz6EIYoY1PD9eRKDSwiG4X9lueEWea7uO+H6NzVblLfIFT437+x5VszmqyKnitlQjwpLPLMNLgnnmBBQrXOFUAJuYmwKyYvj9cZmN5w1+2CP1ufmuzo3rGX4EsoNO8II7dvgDOcAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable105822 {
 border: none;
 font-size: 80%;
 }
 .hmisctable105822 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable105822 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable105822">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14650</td><td>41</td><td>157</td><td>1</td><td>11.57</td><td>2.558</td><td> 8.2</td><td> 8.8</td><td> 9.9</td><td>11.4</td><td>13.2</td><td>14.6</td><td>15.4</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  3.0  3.1  3.5  3.9  4.1 ,  <font color="MidnightBlue">highest</font>: 19.5 20.5 20.7 20.8 21.0</span> <hr class="thinhr"> <span style="font-weight:bold">HCT</span>: Haematocrit <span style='font-family:Verdana;font-size:75%;'>%</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAcklEQVQ4jc3TUQrAIAwD0Or9Dy1miAjq2kTB/NT91Icjlk7EkDaObMxibBp1a77kkmmqa8kSbZprr1Jkiutfxcv49vhUbD35h/aHWn+fRcnY3/+kK6hicHEXh4rSal2mlUGRsGxsnruHm6Q+2+34+k6YBR+yCdg4QZ3BAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable423259 {
 border: none;
 font-size: 80%;
 }
 .hmisctable423259 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable423259 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable423259">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14649</td><td>42</td><td>404</td><td>1</td><td>34.48</td><td>7.316</td><td>24.6</td><td>26.4</td><td>29.8</td><td>34.3</td><td>39.1</td><td>42.9</td><td>44.8</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.0  0.1  0.2  9.7  9.8 ,  <font color="MidnightBlue">highest</font>: 61.4 61.9 63.2 65.3 66.6</span> <hr class="thinhr"> <span style="font-weight:bold">MCH</span>: Mean corpuscular hemoglobin <span style='font-family:Verdana;font-size:75%;'>fl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAdElEQVQ4jeWTUQqAMAxDo/c/9Kqb0tZNcMmHaECXr8ejECx0YOEpGbqSwR57WFDC0oC3e2nNSBjwNy9qNGdaVa2R2WM7kruX8mZf8woy3kukNkO5yEQvidkjxkgmewnctgnZmuovlE51yxtVV25RR+1u0b4CzcYLwaC5pgUAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable396053 {
 border: none;
 font-size: 80%;
 }
 .hmisctable396053 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable396053 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable396053">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14649</td><td>42</td><td>232</td><td>1</td><td>29.58</td><td>2.693</td><td>25.3</td><td>26.7</td><td>28.4</td><td>29.7</td><td>31.0</td><td>32.4</td><td>33.4</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 14.9 15.6 15.9 16.0 16.5 ,  <font color="MidnightBlue">highest</font>: 42.0 42.3 42.4 42.5 47.4</span> <hr class="thinhr"> <span style="font-weight:bold">MCHC</span>: Mean corpuscular hemoglobin concentration <span style='font-family:Verdana;font-size:75%;'>g/dl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAcUlEQVQ4jd2T0QoAERRE5/r/j17cJQkrM7Vloni446QOTBO8EdUZgiSo0fQFOZeITNKCPoJKPdTdXLQ4w/zu4xiL/zGuYEbFkxHjKyga7Hz6C4tDOxndIWLRkjluD8pyy/LKupVLe9pP12DtKzMX434A7S8LO8VcvNwAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable543684 {
 border: none;
 font-size: 80%;
 }
 .hmisctable543684 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable543684 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable543684">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14649</td><td>42</td><td>124</td><td>0.999</td><td>33.47</td><td>1.546</td><td>31.1</td><td>31.7</td><td>32.6</td><td>33.5</td><td>34.4</td><td>35.2</td><td>35.6</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 23.7 24.4 24.8 25.1 26.1 ,  <font color="MidnightBlue">highest</font>: 38.3 38.4 38.9 39.3 43.5</span> <hr class="thinhr"> <span style="font-weight:bold">RDW</span>: Red blood cell distribution width <span style='font-family:Verdana;font-size:75%;'>%</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAdElEQVQ4jc3TgQqAMAgE0Fv//9G1JErPjTbo1oEEDvIhiJIEluxJFWwc3EleNeHJcFlAMgV38AcZjY2sKluAe+NasTU6uoZLfZ1hEU2Veml+Vp+llA26ZLYJl4Tnfj/C+lhYz8xqEnWmcCWt0LbJ1/d5i0ftuIIK0HvoXwYAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable234424 {
 border: none;
 font-size: 80%;
 }
 .hmisctable234424 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable234424 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable234424">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14635</td><td>56</td><td>173</td><td>1</td><td>15</td><td>2.385</td><td>12.4</td><td>12.7</td><td>13.4</td><td>14.5</td><td>16.0</td><td>18.0</td><td>19.5</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 10.6 11.1 11.2 11.3 11.4 ,  <font color="MidnightBlue">highest</font>: 28.6 28.9 29.1 29.7 31.8</span> <hr class="thinhr"> <span style="font-weight:bold">MPV</span>: Mean platelet volume <span style='font-family:Verdana;font-size:75%;'>fl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAdUlEQVQ4jc3T3QrAIAgFYNv7P/SKGdhF5fFndaKLBurHQCqWUIupUj3hQUJjvg9QB/Ukj0sAT7pmqgyZuuEKlWC71gUsoC6/7SNgivtx2x64KsS2qbeq3LJFtcfk5s3KglBmYVufvkJU167wyYhoz0PEgx39vmZECVh6tdxsAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable798608 {
 border: none;
 font-size: 80%;
 }
 .hmisctable798608 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable798608 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable798608">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13989</td><td>702</td><td>71</td><td>0.999</td><td>10.38</td><td>1.132</td><td> 8.9</td><td> 9.2</td><td> 9.7</td><td>10.3</td><td>11.0</td><td>11.7</td><td>12.2</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  7.3  7.7  7.8  7.9  8.0 ,  <font color="MidnightBlue">highest</font>: 14.2 14.3 14.6 14.8 15.0</span> <hr class="thinhr"> <span style="font-weight:bold">NT</span>: Normotest <span style='font-family:Verdana;font-size:75%;'>%</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAg0lEQVQ4jc2U2wqAMAxDM///o7UMUbt2621gJDD30B4iEa1IQDc/R8cdBQJkZ0buYvoxVwYvxTXL6sUVYYtzscULLi9bvDVX4e7eKZau9/ZRCWSRlyc3P5e6mGTisrD5uIbFBsXY1lzy1JjsvxF2P/0S5ZrESBXB8+Dj8bVWfF93I6YTnuAJy58nGcwAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable542841 {
 border: none;
 font-size: 80%;
 }
 .hmisctable542841 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable542841 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable542841">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>12224</td><td>2467</td><td>149</td><td>1</td><td>83.22</td><td>30.56</td><td> 35</td><td> 48</td><td> 67</td><td> 83</td><td>101</td><td>118</td><td>128</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   4   5   6   7   8 ,  <font color="MidnightBlue">highest</font>: 148 149 150 151 152</span> <hr class="thinhr"> <span style="font-weight:bold">APTT</span>: Activated partial thromboplastin time <span style='font-family:Verdana;font-size:75%;'>sec</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAbklEQVQ4je2TQQ7AIAgEl/7/0Y0ULautPS6HDlERLxOThTGAlQAHg3kggjXgiFSIJ68KZqSA3+sLit/wUqUwqZAkyvxYEgCjc3KZ1M7orJLXYqUV23oJ7Vr00OodixrN/tKvtr7d0whd7Ne4H75OK0cMQxHtiFsAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable938199 {
 border: none;
 font-size: 80%;
 }
 .hmisctable938199 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable938199 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable938199">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>12142</td><td>2549</td><td>631</td><td>1</td><td>40.06</td><td>9.533</td><td>30.1</td><td>31.4</td><td>34.1</td><td>37.7</td><td>42.7</td><td>49.9</td><td>56.6</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  21.4  21.6  23.4  23.5  23.6 ,  <font color="MidnightBlue">highest</font>: 160.7 163.0 168.7 171.6 176.1</span> <hr class="thinhr"> <span style="font-weight:bold">NA.</span>: Sodium <span style='font-family:Verdana;font-size:75%;'>mmol/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAeklEQVQ4je2TUQqAMAxDE+9/aLc66uqGig0IYvYTBsteCwFlQpEubJEITZq0GiiKgZhMkVNgfq77CYhcGrR8g6yGOxc1pcwO50vq9qXY2De5Akywr3EFnJErS/bo+cgw40qh1fJYgWDHDc5M172DiXfXSfTybr83AnIFjHcLui7Xzt8AAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable174109 {
 border: none;
 font-size: 80%;
 }
 .hmisctable174109 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable174109 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable174109">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13409</td><td>1282</td><td>58</td><td>0.994</td><td>137.2</td><td>5.034</td><td>129</td><td>132</td><td>135</td><td>137</td><td>140</td><td>142</td><td>144</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 106 108 109 110 112 ,  <font color="MidnightBlue">highest</font>: 161 165 166 168 170</span> <hr class="thinhr"> <span style="font-weight:bold">CA</span>: Calcium <span style='font-family:Verdana;font-size:75%;'>mmol/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAdklEQVQ4jc3T0QrAIAgF0Gv//9FjkmUjRrfl0F6SMA+RkI2Axk7leovCBlBQg64luvAVKV3KSeeqHCBc9tEVJmOmyijiXQnmsT3RH+9Fq3K5BgoQLjvhiqAtXDmDxLvuv68DMCyfPAZwlr5U2+3WoyXSTy11mwvxHQuvQvNUbgAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable782640 {
 border: none;
 font-size: 80%;
 }
 .hmisctable782640 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable782640 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable782640">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13415</td><td>1276</td><td>185</td><td>1</td><td>2.214</td><td>0.2213</td><td>1.89</td><td>1.96</td><td>2.09</td><td>2.22</td><td>2.35</td><td>2.45</td><td>2.51</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 1.03 1.15 1.18 1.20 1.23 ,  <font color="MidnightBlue">highest</font>: 3.84 3.88 3.96 4.18 4.40</span> <hr class="thinhr"> <span style="font-weight:bold">PHOS</span>: Phosphate <span style='font-family:Verdana;font-size:75%;'>mmol/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAa0lEQVQ4jc2TSQoAIQwEO/7/0YML0SzmOG0RhPTFQmlIAOhDBs2BiY//xglA4ehsEbvhFbG7F1fsWS9TAguri0PldAzQnuv8x6hFFNObMyuiGEornhlqKZoeYg3vyD6lCEafdGa6trR6WfABbasLwR0lD8AAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable923959 {
 border: none;
 font-size: 80%;
 }
 .hmisctable923959 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable923959 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable923959">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13449</td><td>1242</td><td>306</td><td>1</td><td>1.048</td><td>0.3993</td><td>0.55</td><td>0.64</td><td>0.81</td><td>0.99</td><td>1.20</td><td>1.47</td><td>1.74</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 0.30 0.31 0.32 0.33 0.34 ,  <font color="MidnightBlue">highest</font>: 4.36 4.43 4.53 5.48 6.22</span> <hr class="thinhr"> <span style="font-weight:bold">MG</span>: Magnesium <span style='font-family:Verdana;font-size:75%;'>mmol/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAfElEQVQ4jc2TgQqAIAxEb/3/R9dWStq0K5n4Ch2k2yM4CA+UD+dHwEaDBH/lP+wQFIQqnfPYc5PFyAlY0qu2muFFhePJCnl0tMJ/2Wt7XypcbMAr1Kzbu+cUrNZuTEgFymmwcDyaObH32rwQtihv1W0kVTbKPll9W/KW6x1Hygtarmv88wAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable583663 {
 border: none;
 font-size: 70%;
 }
 .hmisctable583663 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable583663 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable583663">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>12822</td><td>1869</td><td>146</td><td>0.999</td><td>0.8136</td><td>0.1609</td><td>0.59</td><td>0.64</td><td>0.72</td><td>0.81</td><td>0.89</td><td>0.98</td><td>1.06</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 0.20 0.21 0.22 0.26 0.28 ,  <font color="MidnightBlue">highest</font>: 1.83 1.88 1.96 2.07 2.22</span> <hr class="thinhr"> <span style="font-weight:bold">HS</span>: Uric acid <span style='font-family:Verdana;font-size:75%;'>mg/dl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAd0lEQVQ4je3V0QqAIAyF4X+9/0Nnm4TiEinauuigKLv6UKaIF3DLgWHzgl8OzABQ0u+6Sg8onoOErpbvuIxDLqxvvNKHVSO0yexHu8DxvHKOrXN5niQcDWpuiqVRWWuoOByVdSsvvnNoFz6JrE859/YF6xheBK3symYLHOFQ42YAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable423223 {
 border: none;
 font-size: 80%;
 }
 .hmisctable423223 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable423223 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable423223">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>11630</td><td>3061</td><td>169</td><td>1</td><td>5.413</td><td>2.625</td><td> 2.2</td><td> 2.7</td><td> 3.7</td><td> 5.0</td><td> 6.6</td><td> 8.5</td><td>10.0</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  1.3  1.4  1.5  1.6  1.7 ,  <font color="MidnightBlue">highest</font>: 19.8 20.2 22.2 22.3 22.7</span> <hr class="thinhr"> <span style="font-weight:bold">GBIL</span>: Bilirubin <span style='font-family:Verdana;font-size:75%;'>mg/dl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAXklEQVQ4je2TUQrAIAxDk93/0HZpq+BgbH/5MGItbZWHEDAE0E24QlC00uH6J3MuOzA5EX6GtP0vhcP1Vc3lBja5zMhuI6LEtZ/pa1Mpwa5Qz2rlWdW8wu7XwOZE1QZdRA0CQR2HNAAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable143097 {
 border: none;
 font-size: 80%;
 }
 .hmisctable143097 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable143097 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable143097">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13250</td><td>1441</td><td>885</td><td>1</td><td>1.406</td><td>1.477</td><td>0.33</td><td>0.39</td><td>0.53</td><td>0.77</td><td>1.23</td><td>2.34</td><td>3.96</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.11  0.12  0.13  0.14  0.15 ,  <font color="MidnightBlue">highest</font>: 42.82 43.83 45.10 51.72 51.77</span> <hr class="thinhr"> <span style="font-weight:bold">TP</span>: Total protein <span style='font-family:Verdana;font-size:75%;'>G/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAh0lEQVQ4jcWV2w7AIAhD6/7/oxfsJNuyecFGGyL6IJ6gCNK8ADOtcIQEmNGBCwRD/RwQhkIhcu3j8szgS8qUDUSqEO3jur2kljRcffWW2jiuNfU4AKRMWT1E172t5opCSdD+9k8QSdDem8FvXKU4l7393OHY5lBGja7e6T5P2VETjeX7KGJbnJG6CWzjhVAaAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable786664 {
 border: none;
 font-size: 70%;
 }
 .hmisctable786664 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable786664 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable786664">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13108</td><td>1583</td><td>649</td><td>1</td><td>64.9</td><td>12.97</td><td>45.20</td><td>49.47</td><td>56.90</td><td>65.70</td><td>73.30</td><td>78.80</td><td>82.00</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  29.9  30.0  30.3  30.5  30.6 ,  <font color="MidnightBlue">highest</font>: 107.8 108.1 108.7 112.8 120.9</span> <hr class="thinhr"> <span style="font-weight:bold">ALB</span>: Albumin <span style='font-family:Verdana;font-size:75%;'>G/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAe0lEQVQ4jb3VUQ4AEQwE0Kn7H9rSn9pEtEM7HyIIL5ICeRwAps9v0y7zObS10VGdIrclMZbyV63ERulYVzAlrrCK0MVctCgsi1TMtQr+Ag3c1wvWjOuwcpUPdlxzeAayaKcFGSaPbTuZCTK0nW4UCMZHpo3tVmU9enpEOnyCB5E+XdsVAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable301673 {
 border: none;
 font-size: 80%;
 }
 .hmisctable301673 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable301673 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable301673">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13015</td><td>1676</td><td>401</td><td>1</td><td>33.42</td><td>8.513</td><td>21.3</td><td>23.6</td><td>27.9</td><td>33.6</td><td>39.1</td><td>43.2</td><td>45.2</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 10.0 10.2 10.5 10.6 10.7 ,  <font color="MidnightBlue">highest</font>: 52.9 53.2 53.7 54.0 55.7</span> <hr class="thinhr"> <span style="font-weight:bold">AMY</span>: Amylase <span style='font-family:Verdana;font-size:75%;'>U/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAACUAAAANCAMAAAAZv1dqAAAACVBMVEUAAADMzMz////1iUV5AAAAH0lEQVQYlWNgYCQCMDAwEQEGr6qR4EcQwO4xRpg4AwAewgM2/m5ecQAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable137191 {
 border: none;
 font-size: 80%;
 }
 .hmisctable137191 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable137191 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable137191">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>10778</td><td>3913</td><td>488</td><td>1</td><td>90.83</td><td>100.5</td><td> 18</td><td> 23</td><td> 33</td><td> 49</td><td> 76</td><td>125</td><td>187</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :     8     9    10    11    12 ,  <font color="MidnightBlue">highest</font>:  4984  5248 40372 43970 56146</span> <pre style="font-size:85%;">
 Value          0   500  1000  1500  2000  2500  4000  4500  5000 40500 44000 56000
 Frequency  10432   268    39    14    12     4     2     2     2     1     1     1
 Proportion 0.968 0.025 0.004 0.001 0.001 0.000 0.000 0.000 0.000 0.000 0.000 0.000
 </pre>
  For the frequency table, variable is rounded to the nearest 500 <hr class="thinhr"> <span style="font-weight:bold">PAMY</span>: Pancreas amylase <span style='font-family:Verdana;font-size:75%;'>U/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAABYAAAANCAMAAACae25RAAAACVBMVEUAAADMzMz////1iUV5AAAAGklEQVQYlWNgYMQGGBiYsAHaCg8el2BzCwMAGi8B4ah/57sAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable723524 {
 border: none;
 font-size: 80%;
 }
 .hmisctable723524 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable723524 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable723524">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>7577</td><td>7114</td><td>280</td><td>0.999</td><td>41.66</td><td>47.28</td><td> 7</td><td> 9</td><td>14</td><td>22</td><td>36</td><td>64</td><td>97</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :     1     2     3     4     5 ,  <font color="MidnightBlue">highest</font>:  1673  2083  2116  3066 38369</span> <pre style="font-size:85%;">
 Value          0   500  1000  1500  2000  3000 38500
 Frequency   7495    65     7     6     2     1     1
 Proportion 0.989 0.009 0.001 0.001 0.000 0.000 0.000
 </pre>
  For the frequency table, variable is rounded to the nearest 500 <hr class="thinhr"> <span style="font-weight:bold">LIP</span>: Lipases <span style='font-family:Verdana;font-size:75%;'>U/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAEAAAAANCAMAAAAucZheAAAACVBMVEUAAADMzMz////1iUV5AAAAKklEQVQokWNgYGCkCDAwMDBRBEYNABswGguDwQAkAApVSNjCWATiiIERACyhBYM6jKyHAAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable464116 {
 border: none;
 font-size: 80%;
 }
 .hmisctable464116 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable464116 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable464116">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>10992</td><td>3699</td><td>444</td><td>1</td><td>63.82</td><td>89.88</td><td>  6</td><td>  8</td><td> 14</td><td> 23</td><td> 40</td><td> 79</td><td>135</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :     0     1     2     3     4 ,  <font color="MidnightBlue">highest</font>: 11469 15843 18560 22339 45991</span> <hr class="thinhr"> <span style="font-weight:bold">CHE</span>: Cholinesterase <span style='font-family:Verdana;font-size:75%;'>kU/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAc0lEQVQ4jb3TUQrAIAwD0HT3P/TQakFo2bBp86GCqA8hkCiY0VnGQoem4HEDP7bhnyLGfyFgHcJu17epw5d1VeGOOy9IJiPrdsXuSZaSPhJcGtZ/kVksGtgolaVxNa6ly7mqWCkiKFX8EwlXMqsMkVXpMb07Bwe5a1dAeQAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable456298 {
 border: none;
 font-size: 80%;
 }
 .hmisctable456298 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable456298 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable456298">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>12244</td><td>2447</td><td>997</td><td>1</td><td>4.79</td><td>2.378</td><td>1.70</td><td>2.17</td><td>3.15</td><td>4.60</td><td>6.22</td><td>7.65</td><td>8.49</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  0.98  0.99  1.00  1.01  1.02 ,  <font color="MidnightBlue">highest</font>: 12.39 12.55 12.97 13.32 13.89</span> <hr class="thinhr"> <span style="font-weight:bold">AP</span>: Alkaline phosphatase <span style='font-family:Verdana;font-size:75%;'>U/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAH8AAAANCAMAAAC3iUHrAAAACVBMVEUAAADMzMz////1iUV5AAAAR0lEQVQ4jWNgBAIGBsaBAgxMQMAABEwDA0btH+H2Q9L/gOWAAff/YLF/gFwwiOwfEBcwQJM/GDCSD8FpGYyReSgpHYsIIyMAyJIK1pgJl1IAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable351148 {
 border: none;
 font-size: 80%;
 }
 .hmisctable351148 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable351148 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable351148">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13291</td><td>1400</td><td>672</td><td>1</td><td>118.8</td><td>91.51</td><td> 42</td><td> 49</td><td> 63</td><td> 84</td><td>123</td><td>206</td><td>302</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   11   14   15   16   17 ,  <font color="MidnightBlue">highest</font>: 1980 2132 2549 2596 2995</span> <hr class="thinhr"> <span style="font-weight:bold">LDH</span>: Lactate dehydrogenase <span style='font-family:Verdana;font-size:75%;'>U/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAYUlEQVQ4je2VQQrAMAgEx/7/0VWzlR7agzcPDsQYkbAIi5gDNg0uh4yjWF09VlePdCLzDKl5jRvY6uoRgmCesNI1TFgYEVHJN2pU9FcuVrRdIzu3vRauqlQpv3na/rzo5wZjhw0MlTTx5wAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable120847 {
 border: none;
 font-size: 80%;
 }
 .hmisctable120847 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable120847 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable120847">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>12977</td><td>1714</td><td>1137</td><td>1</td><td>331.2</td><td>240.9</td><td>136</td><td>152</td><td>187</td><td>239</td><td>332</td><td>508</td><td>724</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :    39    46    54    55    56 ,  <font color="MidnightBlue">highest</font>: 10473 10784 10822 11246 13906</span> <hr class="thinhr"> <span style="font-weight:bold">CK</span>: Creatinine kinases <span style='font-family:Verdana;font-size:75%;'>U/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAHYAAAANCAMAAABLnGohAAAACVBMVEUAAADMzMz////1iUV5AAAAQElEQVQ4jWNgZGBgpD9gYGJgYKI/GLV2GFs7mpJHraW+tQNgMSglwwAjGoMRyoCkPShGkMg5gAGNjySBKQ4UAABqTQpC9fFEkwAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable960579 {
 border: none;
 font-size: 80%;
 }
 .hmisctable960579 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable960579 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable960579">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>12611</td><td>2080</td><td>1506</td><td>1</td><td>385</td><td>615.4</td><td>  18</td><td>  25</td><td>  42</td><td>  80</td><td> 184</td><td> 577</td><td>1155</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :     8     9    10    11    12 ,  <font color="MidnightBlue">highest</font>: 60799 63011 82180 83880 98801</span> <hr class="thinhr"> <span style="font-weight:bold">GLU</span>: Glucoses <span style='font-family:Verdana;font-size:75%;'>mg/dl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAYklEQVQ4je2TSwrAIAwFJ73/oVs/bWIRtKu8RWchBkUGYTAHMBU4Hi6tMCXze33j5SVjJusVEqjkJTjg/4PWf/kOJTN1LyKpRo2pl4BZ6Y8VkxtWyu319nOrb3lR47iZ4b2cJ/QMq8QIwM4AAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable938424 {
 border: none;
 font-size: 80%;
 }
 .hmisctable938424 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable938424 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable938424">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>10499</td><td>4192</td><td>389</td><td>1</td><td>126.4</td><td>48.3</td><td> 78</td><td> 85</td><td> 97</td><td>113</td><td>138</td><td>177</td><td>216</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   19   22   23   26   28 ,  <font color="MidnightBlue">highest</font>:  843  848  890 1349 1403</span> <hr class="thinhr"> <span style="font-weight:bold">TRIG</span>: Triclyceride <span style='font-family:Verdana;font-size:75%;'>mg/dl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAF4AAAANCAMAAAAXFikFAAAACVBMVEUAAADMzMz////1iUV5AAAARElEQVQ4jWNgZGRgYKQZYGBiYgBiWoFR4wkZTzvzGUAph3ZJh9aup4fxNDOfPsbTynxIykED0HIIhhnhNLIIEcmGkREAyCUIGNCg8jUAAAAASUVORK5CYII=" alt="image" /></div> <style>
 .hmisctable674264 {
 border: none;
 font-size: 80%;
 }
 .hmisctable674264 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable674264 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable674264">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>9630</td><td>5061</td><td>538</td><td>1</td><td>141.7</td><td>90.33</td><td> 54</td><td> 64</td><td> 83</td><td>115</td><td>165</td><td>241</td><td>307</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   14   15   16   20   22 ,  <font color="MidnightBlue">highest</font>: 1796 2247 2662 2918 5440</span> <hr class="thinhr"> <span style="font-weight:bold">CHOL</span>: Cholesterol <span style='font-family:Verdana;font-size:75%;'>mg/dl</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAZ0lEQVQ4jc2TQQrAIAwEN/7/0Y1aBLep4sXNgAZyGgIDI+DwTgAKUb384/VtQi9k88JAfbI/L/XJ0npNERCqGG3qka2kF1t6CdXSe4VWOjNsrFRutTl8QmQsfi1he0efoydenLTo7wG9Hgvy83CMIQAAAABJRU5ErkJggg==" alt="image" /></div> <style>
 .hmisctable561480 {
 border: none;
 font-size: 80%;
 }
 .hmisctable561480 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable561480 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable561480">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>9646</td><td>5045</td><td>339</td><td>1</td><td>150.8</td><td>59.23</td><td> 74</td><td> 89</td><td>113</td><td>145</td><td>182</td><td>219</td><td>243</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :   25   26   27   28   29 ,  <font color="MidnightBlue">highest</font>:  646  662  676  710 1104</span> <hr class="thinhr"> <span style="font-weight:bold">PDW</span>: Platelet distribution width <span style='font-family:Verdana;font-size:75%;'>%</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAfklEQVQ4jc3V3QqAIAwF4LPe/6FrGV3o/optddCikPkljEB+AJ587Qs2PwBPILI2K+5ehwZz/uFa871LUrXIrB00VAdNbzJbheIG1T874Co8M6V0BFVKk+vGWVU2qeZD1a3LBC6lXqKyT5B7CvwH5DHuGaF5GC8IF2FQzmfaAVQ1CjiAt1m9AAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable249062 {
 border: none;
 font-size: 80%;
 }
 .hmisctable249062 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable249062 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable249062">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>13589</td><td>1102</td><td>167</td><td>1</td><td>12.29</td><td>2.375</td><td> 9.3</td><td> 9.8</td><td>10.8</td><td>12.0</td><td>13.4</td><td>15.1</td><td>16.4</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> :  6.6  6.8  6.9  7.0  7.1 ,  <font color="MidnightBlue">highest</font>: 24.1 24.7 24.9 25.2 25.3</span> <hr class="thinhr"> <span style="font-weight:bold">RBC</span>: Red blood count <span style='font-family:Verdana;font-size:75%;'>T/L</span><div style='float: right; text-align: right;'><img src="data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAJcAAAANCAMAAACTvAxuAAAACVBMVEUAAADMzMz////1iUV5AAAAcklEQVQ4jc3TUQrAMAgD0Lj7H7otlO7LGjWwZRT20/g2EFYIsM6bSkc04kkGTrI90RiNSm5Ldd1VX7kildRG93AqmYzeJd4l2U/y6zIqyT+jGrKq/7rasvB+xSSwXe92TE3b2h14jyJuu+3JZjhvexfnGZo2CX2KyxI1AAAAAElFTkSuQmCC" alt="image" /></div> <style>
 .hmisctable353099 {
 border: none;
 font-size: 80%;
 }
 .hmisctable353099 td {
 text-align: center;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable353099 th {
 color: MidnightBlue;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: normal;
 }
 </style>
 <table class="hmisctable353099">
 <tr><th>n</th><th>missing</th><th>distinct</th><th>Info</th><th>Mean</th><th>Gmd</th><th>.05</th><th>.10</th><th>.25</th><th>.50</th><th>.75</th><th>.90</th><th>.95</th></tr>
 <tr><td>14230</td><td>461</td><td>65</td><td>0.999</td><td>3.936</td><td>0.8772</td><td>2.7</td><td>2.9</td><td>3.4</td><td>3.9</td><td>4.5</td><td>4.9</td><td>5.2</td></tr>
 </table>
 <span style="font-size: 85%;"><font color="MidnightBlue">lowest</font> : 1.0 1.1 1.2 1.3 1.4 ,  <font color="MidnightBlue">highest</font>: 7.2 7.4 7.6 7.7 8.2</span> <hr class="thinhr">
```

## Categorical variables

We now provide a closer visual examination of the categorical predictors. 

<img src="Bact_univar_files/figure-html/catplot-1.png" width="672" />


## Continuous variables 



### Suggested transformations

Next we investigate whether a transformation of continuous variables may improve any further analyses to reduce disproportional impact of highly influential points, also in multivariate summaries. We employ a function `ida_trans` for this purpose, which optimises the parameter `sigma` of the pseudo-logarithm for that purpose. The optimization targets the best possible linear correlation of the transformed values with normal deviates. If no better transformation can be found, no transformation is suggested.


```r
variables<- c("Alter", pivotal_vars, vip_vars, leuko_related_vars, leuko_ratio_vars, kidney_related_vars, acute_related_vars, remaining_vars)
unique.variables <- unique(variables)
#variables<- c("Alter", pivotal_vars, vip_vars)

res<-sapply(unique.variables, function(X) ida_trans(b_bact[,X])$const) #takes long, calculate once, and save?

res
```

```
##      Alter        WBC        BUN       KREA        NEU        PLT        EOS 
##         NA 2.51471408 0.03198339 0.03193846 2.30783002         NA 0.11873740 
##       BASO        LYM       MONO       NEUR       EOSR      BASOR       LYMR 
## 0.12980073 0.17957981 0.26505156         NA 0.42874860 0.17300902 1.77333947 
##      MONOR          K       eGFR   BUN_KREA        FIB        CRP       ASAT 
## 3.00040692 0.02677349         NA 0.03194543         NA         NA 0.03185536 
##       ALAT        GGT        MCV        HGB        HCT        MCH       MCHC 
## 1.02570312 0.03185702         NA         NA         NA         NA         NA 
##        RDW        MPV         NT       APTT        NA.         CA       PHOS 
##         NA         NA         NA 0.03047767         NA         NA 0.14534462 
##         MG         HS       GBIL         TP        ALB        AMY       PAMY 
##         NA         NA 0.03306450         NA         NA 0.02970893 0.03005131 
##        LIP        CHE         AP        LDH         CK        GLU       TRIG 
## 1.02558160         NA 0.02888640 0.02191602 0.02786388 0.01875994 0.02911146 
##       CHOL        PDW        RBC 
##         NA         NA         NA
```

Register transformed variables in the data set:


```r
for(j in 1:length(unique.variables)){
  if(!is.na(res[j])){
    newname <- paste("t_",unique.variables[j],sep="")
    newlabel <- paste("pseudo-log of",label(b_bact)[unique.variables[j]])
    names(newlabel)<-newname
    x<-pseudo_log(b_bact[[unique.variables[j]]], sigma=res[j], base=10)
    label(x)<-newlabel
    b_bact[[newname]] <- x
    upData(b_bact, labels=newlabel)
  }
}
```

```
## Input object size:	 5575040 bytes;	 57 variables	 14691 observations
## New object size:	5574816 bytes;	57 variables	14691 observations
## Input object size:	 5693696 bytes;	 58 variables	 14691 observations
## New object size:	5693472 bytes;	58 variables	14691 observations
## Input object size:	 5812336 bytes;	 59 variables	 14691 observations
## New object size:	5812112 bytes;	59 variables	14691 observations
## Input object size:	 5930976 bytes;	 60 variables	 14691 observations
## New object size:	5930752 bytes;	60 variables	14691 observations
## Input object size:	 6049616 bytes;	 61 variables	 14691 observations
## New object size:	6049392 bytes;	61 variables	14691 observations
## Input object size:	 6168256 bytes;	 62 variables	 14691 observations
## New object size:	6168032 bytes;	62 variables	14691 observations
## Input object size:	 6286896 bytes;	 63 variables	 14691 observations
## New object size:	6286672 bytes;	63 variables	14691 observations
## Input object size:	 6405536 bytes;	 64 variables	 14691 observations
## New object size:	6405312 bytes;	64 variables	14691 observations
## Input object size:	 6524176 bytes;	 65 variables	 14691 observations
## New object size:	6523952 bytes;	65 variables	14691 observations
## Input object size:	 6642816 bytes;	 66 variables	 14691 observations
## New object size:	6642592 bytes;	66 variables	14691 observations
## Input object size:	 6761464 bytes;	 67 variables	 14691 observations
## New object size:	6761240 bytes;	67 variables	14691 observations
## Input object size:	 6880104 bytes;	 68 variables	 14691 observations
## New object size:	6879880 bytes;	68 variables	14691 observations
## Input object size:	 6998744 bytes;	 69 variables	 14691 observations
## New object size:	6998520 bytes;	69 variables	14691 observations
## Input object size:	 7117408 bytes;	 70 variables	 14691 observations
## New object size:	7117176 bytes;	70 variables	14691 observations
## Input object size:	 7236064 bytes;	 71 variables	 14691 observations
## New object size:	7235840 bytes;	71 variables	14691 observations
## Input object size:	 7354720 bytes;	 72 variables	 14691 observations
## New object size:	7354496 bytes;	72 variables	14691 observations
## Input object size:	 7473376 bytes;	 73 variables	 14691 observations
## New object size:	7473152 bytes;	73 variables	14691 observations
## Input object size:	 7592048 bytes;	 74 variables	 14691 observations
## New object size:	7591824 bytes;	74 variables	14691 observations
## Input object size:	 7710688 bytes;	 75 variables	 14691 observations
## New object size:	7710464 bytes;	75 variables	14691 observations
## Input object size:	 7829328 bytes;	 76 variables	 14691 observations
## New object size:	7829104 bytes;	76 variables	14691 observations
## Input object size:	 7947968 bytes;	 77 variables	 14691 observations
## New object size:	7947744 bytes;	77 variables	14691 observations
## Input object size:	 8066608 bytes;	 78 variables	 14691 observations
## New object size:	8066384 bytes;	78 variables	14691 observations
## Input object size:	 8185248 bytes;	 79 variables	 14691 observations
## New object size:	8185024 bytes;	79 variables	14691 observations
## Input object size:	 8303904 bytes;	 80 variables	 14691 observations
## New object size:	8303680 bytes;	80 variables	14691 observations
## Input object size:	 8422560 bytes;	 81 variables	 14691 observations
## New object size:	8422336 bytes;	81 variables	14691 observations
## Input object size:	 8541216 bytes;	 82 variables	 14691 observations
## New object size:	8540992 bytes;	82 variables	14691 observations
## Input object size:	 8659856 bytes;	 83 variables	 14691 observations
## New object size:	8659632 bytes;	83 variables	14691 observations
## Input object size:	 8778496 bytes;	 84 variables	 14691 observations
## New object size:	8778272 bytes;	84 variables	14691 observations
```

```r
sigma_values <- res


c_bact <- b_bact

# update variable lists - generate a second list with transformed variables replacing the originals

bact_transformed <- bact_variables

for(j in 1:length(bact_variables)){
  for(jj in 1:length(bact_variables[[j]])){
      if(!is.na(res[bact_variables[[j]][jj]])) bact_transformed[[j]][jj] <- paste("t_", bact_variables[[j]][jj], sep="")
  }
}
```


### Univariate distribution with variables using the original variable and the suggested transformations


```r
for(j in 1:length(unique.variables)){
  print(ida_plot_univar(b_bact, unique.variables[j], sigma=res[j], n_bars=100))
#  if(!is.na(res[j])){
#    print(ida_plot_univar(b_bact, paste("t_",variables[j],sep="")))
#  }
}
```

```
## Warning: Removed 4 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-1.png" width="672" />

```
## Warning: Removed 95 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-2.png" width="672" />

```
## Warning: Removed 3 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-3.png" width="672" />

```
## Warning: Removed 5 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-4.png" width="672" />

```
## Warning: Removed 162 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-5.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-6.png" width="672" />

```
## Warning: Removed 3483 rows containing missing values (geom_point).
```

```
## Warning: Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-7.png" width="672" />

```
## Warning: Removed 6249 rows containing missing values (geom_point).
## Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-8.png" width="672" />

```
## Warning: Removed 56 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-9.png" width="672" />

```
## Warning: Removed 233 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-10.png" width="672" />

```
## Warning: Removed 76 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-11.png" width="672" />

```
## Warning: Removed 3325 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-12.png" width="672" />

```
## Warning: Removed 6233 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-13.png" width="672" />

```
## Warning: Removed 92 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-14.png" width="672" />

```
## Warning: Removed 204 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-15.png" width="672" />

```
## Warning: Removed 6 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-16.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
## Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-17.png" width="672" /><img src="Bact_univar_files/figure-html/unnamed-chunk-4-18.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-19.png" width="672" />

```
## Warning: Removed 57 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-20.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
## Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-21.png" width="672" /><img src="Bact_univar_files/figure-html/unnamed-chunk-4-22.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-23.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-24.png" width="672" /><img src="Bact_univar_files/figure-html/unnamed-chunk-4-25.png" width="672" />

```
## Warning: Removed 7 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-26.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
## Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-27.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-28.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-29.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-30.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-31.png" width="672" />

```
## Warning: Removed 12 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-32.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-33.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
## Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-34.png" width="672" />

```
## Warning: Removed 27 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-35.png" width="672" />

```
## Warning: Removed 5 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-36.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-37.png" width="672" />

```
## Warning: Removed 4 rows containing missing values (geom_point).
## Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-38.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-39.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-40.png" width="672" />

```
## Warning: Removed 9 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-41.png" width="672" />

```
## Warning: Removed 3 rows containing missing values (geom_point).
## Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-42.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-43.png" width="672" />

```
## Warning: Removed 17 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-44.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-45.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-46.png" width="672" />

```
## Warning: Removed 7 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-47.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-48.png" width="672" />

```
## Warning: Removed 3 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-49.png" width="672" /><img src="Bact_univar_files/figure-html/unnamed-chunk-4-50.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-51.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-4-52.png" width="672" />



```r
save(list=c("c_bact", "bact_variables", "sigma_values", "bact_transformed"), 
     file=here::here("data", "bact_env_c.rda"))
```

### Univariate distribution with variables using only the original variable without the suggested transformations


```r
for(j in 1:length(unique.variables)){
  print(ida_plot_univar(b_bact, unique.variables[j], sigma=res[j], n_bars=100, transform = FALSE))
#  if(!is.na(res[j])){
#    print(ida_plot_univar(b_bact, paste("t_",variables[j],sep="")))
#  }
}
```

```
## Warning: Removed 3 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-1.png" width="672" />

```
## Warning: Removed 6 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-2.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-3.png" width="672" />

```
## Warning: Removed 3 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-4.png" width="672" />

```
## Warning: Removed 59 rows containing missing values (geom_point).
```

```
## Warning: Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-5.png" width="672" />

```
## Warning: Removed 3 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-6.png" width="672" />

```
## Warning: Removed 3407 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-7.png" width="672" />

```
## Warning: Removed 6332 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-8.png" width="672" />

```
## Warning: Removed 54 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-9.png" width="672" />

```
## Warning: Removed 188 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-10.png" width="672" />

```
## Warning: Removed 82 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-11.png" width="672" />

```
## Warning: Removed 3333 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-12.png" width="672" />

```
## Warning: Removed 6181 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-13.png" width="672" />

```
## Warning: Removed 68 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-14.png" width="672" />

```
## Warning: Removed 177 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-15.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-16.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
## Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-17.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-18.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-19.png" width="672" />

```
## Warning: Removed 46 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-20.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-21.png" width="672" /><img src="Bact_univar_files/figure-html/unnamed-chunk-6-22.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-23.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-24.png" width="672" /><img src="Bact_univar_files/figure-html/unnamed-chunk-6-25.png" width="672" />

```
## Warning: Removed 7 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-26.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
## Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-27.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
## Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-28.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-29.png" width="672" /><img src="Bact_univar_files/figure-html/unnamed-chunk-6-30.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-31.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-32.png" width="672" /><img src="Bact_univar_files/figure-html/unnamed-chunk-6-33.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-34.png" width="672" />

```
## Warning: Removed 28 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-35.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-36.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-37.png" width="672" />

```
## Warning: Removed 5 rows containing missing values (geom_point).
## Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-38.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-39.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-40.png" width="672" />

```
## Warning: Removed 3 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-41.png" width="672" />

```
## Warning: Removed 3 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-42.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-43.png" width="672" />

```
## Warning: Removed 18 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-44.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-45.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-46.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-47.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-48.png" width="672" /><img src="Bact_univar_files/figure-html/unnamed-chunk-6-49.png" width="672" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-50.png" width="672" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-51.png" width="672" />

```
## Warning: Removed 3 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-6-52.png" width="672" />

### Comparison of univariate distributions with and without pseudo-log transformation

The comparison is only shown for variables where a transformation is suggested.


```r
for(j in 1:length(unique.variables)){
#  print(ida_plot_univar_orig_vs_trans(b_bact, unique.variables[j], sigma=res[j], n_bars=100))
 if(!is.na(res[j])){
   print(ida_plot_univar_orig_vs_trans(b_bact, unique.variables[j], sigma=res[j], n_bars=100))
 }
}
```

```
## Warning: Removed 5 rows containing missing values (geom_point).
```

```
## Warning: Removed 91 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-1.png" width="1152" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

```
## Warning: Removed 8 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-2.png" width="1152" />

```
## Warning: Removed 6 rows containing missing values (geom_point).
```

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-3.png" width="1152" />

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

```
## Warning: Removed 1 rows containing missing values (geom_bar).
```

```
## Warning: Removed 188 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-4.png" width="1152" />

```
## Warning: Removed 3437 rows containing missing values (geom_point).
```

```
## Warning: Removed 3417 rows containing missing values (geom_point).
```

```
## Warning: Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-5.png" width="1152" />

```
## Warning: Removed 6396 rows containing missing values (geom_point).
```

```
## Warning: Removed 6306 rows containing missing values (geom_point).
```

```
## Warning: Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-6.png" width="1152" />

```
## Warning: Removed 57 rows containing missing values (geom_point).
```

```
## Warning: Removed 57 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-7.png" width="1152" />

```
## Warning: Removed 188 rows containing missing values (geom_point).
```

```
## Warning: Removed 222 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-8.png" width="1152" />

```
## Warning: Removed 3361 rows containing missing values (geom_point).
```

```
## Warning: Removed 3381 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-9.png" width="1152" />

```
## Warning: Removed 5993 rows containing missing values (geom_point).
```

```
## Warning: Removed 6175 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-10.png" width="1152" />

```
## Warning: Removed 76 rows containing missing values (geom_point).
```

```
## Warning: Removed 87 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-11.png" width="1152" />

```
## Warning: Removed 193 rows containing missing values (geom_point).
```

```
## Warning: Removed 204 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-12.png" width="1152" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

```
## Warning: Removed 3 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-13.png" width="1152" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-14.png" width="1152" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

```
## Warning: Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-15.png" width="1152" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-16.png" width="1152" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-17.png" width="1152" />

```
## Warning: Removed 6 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-18.png" width="1152" />

```
## Warning: Removed 32 rows containing missing values (geom_point).
```

```
## Warning: Removed 22 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-19.png" width="1152" />

```
## Warning: Removed 7 rows containing missing values (geom_point).
```

```
## Warning: Removed 1 rows containing missing values (geom_bar).
```

```
## Warning: Removed 5 rows containing missing values (geom_point).
```

```
## Warning: Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-20.png" width="1152" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

```
## Warning: Removed 7 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-21.png" width="1152" />

```
## Warning: Removed 3 rows containing missing values (geom_point).
```

```
## Warning: Removed 3 rows containing missing values (geom_point).
```

```
## Warning: Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-22.png" width="1152" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-23.png" width="1152" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-24.png" width="1152" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
## Removed 1 rows containing missing values (geom_bar).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-25.png" width="1152" />

```
## Warning: Removed 1 rows containing missing values (geom_point).
```

```
## Warning: Removed 5 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-26.png" width="1152" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-27.png" width="1152" />

```
## Warning: Removed 2 rows containing missing values (geom_point).
```

```
## Warning: Removed 3 rows containing missing values (geom_point).
```

<img src="Bact_univar_files/figure-html/unnamed-chunk-7-28.png" width="1152" />


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
##  [1] fs_1.5.2            lubridate_1.8.0     RColorBrewer_1.1-2 
##  [4] httr_1.4.2          rprojroot_2.0.2     tools_4.1.3        
##  [7] backports_1.4.1     bslib_0.3.1         utf8_1.2.2         
## [10] R6_2.5.1            rpart_4.1.16        DBI_1.1.2          
## [13] colorspace_2.0-3    nnet_7.3-17         withr_2.5.0        
## [16] tidyselect_1.1.2    gridExtra_2.3       compiler_4.1.3     
## [19] cli_3.2.0           rvest_1.0.2         htmlTable_2.4.0    
## [22] xml2_1.3.3          labeling_0.4.2      bookdown_0.25      
## [25] sass_0.4.1          scales_1.1.1        checkmate_2.0.0    
## [28] digest_0.6.29       foreign_0.8-82      rmarkdown_2.13     
## [31] base64enc_0.1-3     jpeg_0.1-9          pkgconfig_2.0.3    
## [34] htmltools_0.5.2     highr_0.9           dbplyr_2.1.1       
## [37] fastmap_1.1.0       htmlwidgets_1.5.4   rlang_1.0.2        
## [40] readxl_1.3.1        rstudioapi_0.13     jquerylib_0.1.4    
## [43] generics_0.1.2      farver_2.1.0        jsonlite_1.8.0     
## [46] magrittr_2.0.2      patchwork_1.1.1     Matrix_1.4-0       
## [49] Rcpp_1.0.8.3        munsell_0.5.0       fansi_1.0.3        
## [52] lifecycle_1.0.1     stringi_1.7.6       yaml_2.3.5         
## [55] grid_4.1.3          crayon_1.5.1        haven_2.4.3        
## [58] splines_4.1.3       hms_1.1.1           knitr_1.38         
## [61] pillar_1.7.0        reprex_2.0.1        glue_1.6.2         
## [64] evaluate_0.15       latticeExtra_0.6-29 data.table_1.14.2  
## [67] modelr_0.1.8        png_0.1-7           vctrs_0.3.8        
## [70] tzdb_0.2.0          cellranger_1.1.0    gtable_0.3.0       
## [73] assertthat_0.2.1    xfun_0.30           broom_0.7.12       
## [76] cluster_2.1.2       ellipsis_0.3.2
```


