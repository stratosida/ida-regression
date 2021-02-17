# NHANES {-}




# Introduction to NHANES

Since a key principle of IDA is not to touch the research questions, before IDA commences the research aim and statistical analysis plan need to be in place. 
IDA may lead to an update or refinement of the analysis plan. To demonstrate the workflow and content of IDA, we created a hypothetical research aim and corresponding statistical analysis plan, which is described in more detail in the section [nhanes_SAP.Rmd](nhanes_SAP.Rmd).

**Hypothetical research aim for IDA** is to 
develop a multivariable model for MVPA (minutes of moderate/vigorous physical activity) with primary aim of variable selection to predict MVPA and secondary aim to study the role of systolic blood pressure in addition to variables identified.
*MVPA can be used to examine factors distinguishing very active participants with large amounts of time spent on MVPA from others (using untransformed data) or distinguishing participants according to percentage changes in MVPA (logarithmic scale) thus de-emphasizing extreme values.*




## NHANES Description

The National Health and Nutrition Examination Survey (NHANES) is a program of studies designed to assess the health and nutritional status of adults and children in the United States. The survey examines a nationally representative sample of non-institutionalized US civilians using a multistage probability sampling design that considers geographical area and minority representation. Sample weights are generated to create nationally representative estimates for the US population and subgroups defined by age, sex, and race/ethnicity. [Link to CDC  NHANES website](https://www.cdc.gov/nchs/nhanes/about_nhanes.htm). NHANES collects data on various health and behavior indicators, including physical activity and self‐reported diagnosis of prevalent health conditions such as diabetes mellitus, coronary artery disease, stroke, and cancer.

Physical activity was measured with a waist‐worn uniaxial accelerometer (AM‐7164; ActiGraph) for up to 7 days. Participants were asked to wear the devie while awake except when simming or bathing. Data were cleaned according to calibration specification and nonwear time defined by an interval of at least 60 consecutive minutes of zero activity intensity counts. Days with fewer than 10 hours of wear time were excluded and participants with at least 1 valid day of accelerometer data were included in the analysis. Mean counts per minute were calculated by dividing the sum of activity counts for a valid day by the number of minutes of wear time in that day across all valid days. (Troiano 2008) 

Moderate or vigorous intensity was based on count thresholds. Time spent in such activities was determined by summing minutes in a day where the count met the criterion for that intensity.(Troiano 2008) 

The NHANES 2003–2004 and 2005–2006 have a total of 14,631 participants with accelerometry data. Participants aged 30 to 85 at the time they wore the accelerometer are included. Other inclusion criteria are in line with the choices for the prediction model of 5 year mortality presented by [Smirnova et al, J Gerontol A Biol Sci Med Sci 2020](https://doi.org/10.1093/gerona/glz193). The preparation of the data was based on "Organizing and Analyzing the Activity Data in NHANES"
  [Leroux et al, Statistics in Biosciences 2019](https://doi.org/10.1007/s12561-018-09229-9).  High quality processed activity data combined with mortality and demographic information can be downloaded and used in R with code from Andrew Leroux (https://andrew-leroux.github.io/rnhanesdata/articles).



## Preparations

High quality processed activity data combined with mortality and demographic information can be downloaded and used in R with code from Andrew Leroux (https://andrew-leroux.github.io/rnhanesdata/articles). The R code was modified to have fewer exclusions criteria as noted below.

* Re-level comorbidities to assign refused/don't know as not having the condition
* Re-level education to have 3 levels and categorize don't know/refused to be missing
* Re-level alcohol consumption to include a level set to missing
* Removed the "bad" days from Act_Analysis and Act_Flags
* Systolic blood pressure is the mean of the non-missing of four blood pressure variables

* Following Smirnova et al, participants were excluded who 
(i) had fewer than 3 days of data with at least 10 hours of estimated wear time or were deemed by NHANES to have poor quality data; non-wear periods were identified as intervals with at least 60 consecutive minutes of zero activity counts and at most 2 minutes with counts between 0 and 100;
(ii) missing mortality information or accidental death; 
(iii) alive with follow up less than 1 year 

The NHANES dataset used in this project contains 6680  participants.

* For the purposes of this IDA project, in contrast to Smirnova et al, we did **not** exclude participants who  
(iv) had missing body mass index (BMI) or education predictor variables ;  
(v) had missing systolic blood pressure, total or high-density lipoproteins (HDL) cholesterol measurements. 
The final data set in Smirnova et al contained 2,978 participants.



## Sources

Leroux A. Vignettes for  downloading and working with NHANES 2003-2004 and 2005-2006 accelerometry data https://andrew-leroux.github.io/rnhanesdata/articles/

To download the analysis data set, click the [link to data set  ---GITHUB](...IDA Github....)


### Data dictionary  

The data dictionary can be found [LINK ---- GITHUB](.....IDA GITHUB....)



## References

Troiano RP, Berrigan D, Dodd KW, Mâsse LC, Tilert T, McDowell M. Physical activity in the United States measured by accelerometer. Med Sci Sports Exerc. 2008 Jan;40(1):181-8. doi: 10.1249/mss.0b013e31815a51b3. PMID: 18091006.

Leroux A, Di J, Smirnova E,  Mcguffey E, Cao Q, Bayatmokhtari E, Tabacu L, Zipunnikov V, Urbanek JK,  Crainiceanu C. Organizing and Analyzing the Activity Data in NHANES. Stat Biosci 11, 262–287 (2019). https://doi-org.proxy1.cl.msu.edu/10.1007/s12561-018-09229-9

Smirnova E,  Leroux A,   Tabacu L, Zipunnikov V, Crainiceanu C,  Urbanek JK. The Predictive Performance of Objective Measures of Physical Activity Derived From Accelerometry Data for 5-Year All-Cause Mortality in Older Adults: National Health and Nutritional Examination Survey 2003–2006, The Journals of Gerontology: Series A, Volume 75, Issue 9, September 2020, Pages 1779–1785, https://doi.org/10.1093/gerona/glz193


## NHANES dataset contents

### Source dataset 

We refer to the source data set as the dataset available online [here](.... Github .....)

Display the source dataset contents. This dataset is in the **data-raw** folder of the project directory. 


```{=html}
<hr><h4>Data frame:nhanesdat</h4>6680 observations and 58 variables, maximum # NAs:5529  
 <hr>
 <style>
 .hmisctable611238 {
 border: 1px solid gray;
 border-collapse: collapse;
 font-size: 100%;
 }
 .hmisctable611238 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable611238 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable611238" border="1">
 <tr><th>Name</th><th>Levels</th><th>Storage</th><th>NAs</th></tr>
 <tr><td>seqn</td><td></td><td>integer</td><td>   0</td></tr>
 <tr><td>paxcal</td><td></td><td>integer</td><td>   0</td></tr>
 <tr><td>paxstat</td><td></td><td>integer</td><td>   0</td></tr>
 <tr><td>weekday</td><td></td><td>integer</td><td>   0</td></tr>
 <tr><td>sddsrvyr</td><td></td><td>double</td><td>   0</td></tr>
 <tr><td>eligstat</td><td></td><td>integer</td><td>   0</td></tr>
 <tr><td>mortstat</td><td></td><td>integer</td><td>   9</td></tr>
 <tr><td>permth.exm</td><td></td><td>integer</td><td>   9</td></tr>
 <tr><td>sdmvpsu</td><td></td><td>double</td><td>   0</td></tr>
 <tr><td>sdmvstra</td><td></td><td>double</td><td>   0</td></tr>
 <tr><td>wtint2yr</td><td></td><td>double</td><td>   0</td></tr>
 <tr><td>wtmec2yr</td><td></td><td>double</td><td>   0</td></tr>
 <tr><td>ridagemn</td><td></td><td>double</td><td>   0</td></tr>
 <tr><td>ridageex</td><td></td><td>double</td><td>   0</td></tr>
 <tr><td>ridageyr</td><td></td><td>double</td><td>   0</td></tr>
 <tr><td>bmi</td><td></td><td>double</td><td>  56</td></tr>
 <tr><td>bmi.cat</td><td><a href="#levels.bmi.cat">4</a></td><td>integer</td><td>  56</td></tr>
 <tr><td>race</td><td><a href="#levels.race">5</a></td><td>integer</td><td>   0</td></tr>
 <tr><td>gender</td><td><a href="#levels.gender">2</a></td><td>integer</td><td>   0</td></tr>
 <tr><td>diabetes</td><td><a href="#levels.diabetes">2</a></td><td>integer</td><td>   0</td></tr>
 <tr><td>chf</td><td><a href="#levels.diabetes">2</a></td><td>integer</td><td>   0</td></tr>
 <tr><td>chd</td><td><a href="#levels.diabetes">2</a></td><td>integer</td><td>   0</td></tr>
 <tr><td>cancer</td><td><a href="#levels.diabetes">2</a></td><td>integer</td><td>   0</td></tr>
 <tr><td>stroke</td><td><a href="#levels.diabetes">2</a></td><td>integer</td><td>   0</td></tr>
 <tr><td>educationadult</td><td><a href="#levels.educationadult">3</a></td><td>integer</td><td>   7</td></tr>
 <tr><td>mobilityproblem</td><td><a href="#levels.mobilityproblem">2</a></td><td>integer</td><td>   0</td></tr>
 <tr><td>drinkstatus</td><td><a href="#levels.drinkstatus">4</a></td><td>integer</td><td>   0</td></tr>
 <tr><td>drinksperweek</td><td></td><td>double</td><td> 466</td></tr>
 <tr><td>smokecigs</td><td><a href="#levels.smokecigs">3</a></td><td>integer</td><td>   4</td></tr>
 <tr><td>bpxsy1</td><td></td><td>double</td><td> 972</td></tr>
 <tr><td>bpxsy2</td><td></td><td>double</td><td>1224</td></tr>
 <tr><td>bpxsy3</td><td></td><td>double</td><td>1296</td></tr>
 <tr><td>bpxsy4</td><td></td><td>double</td><td>5529</td></tr>
 <tr><td>lbxtc</td><td></td><td>double</td><td> 270</td></tr>
 <tr><td>lbdhdd</td><td></td><td>double</td><td> 270</td></tr>
 <tr><td>age</td><td></td><td>double</td><td>   0</td></tr>
 <tr><td>sys</td><td></td><td>double</td><td> 320</td></tr>
 <tr><td>tac</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>tlac</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>wt</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>st</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>mvpa</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>about</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>sbout</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>satp</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>astp</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>tlac.1</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>tlac.2</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>tlac.3</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>tlac.4</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>tlac.5</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>tlac.6</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>tlac.7</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>tlac.8</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>tlac.9</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>tlac.10</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>tlac.11</td><td></td><td>double</td><td> 708</td></tr>
 <tr><td>tlac.12</td><td></td><td>double</td><td> 708</td></tr>
 </table>

 <hr>
 <style>
 .hmisctable900516 {
 border: 1px solid gray;
 border-collapse: collapse;
 font-size: 100%;
 }
 .hmisctable900516 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable900516 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable900516" border="1">
 <tr><th>Variable</th><th>Levels</th></tr>
 <tr><td><a name="levels.bmi.cat">bmi.cat</a></td><td>Normal</td></tr>
 <tr><td></td><td>Underweight</td></tr>
 <tr><td></td><td>Overweight</td></tr>
 <tr><td></td><td>Obese</td></tr>
 <tr><td><a name="levels.educationadult">race</a></td><td>White</td></tr>
 <tr><td></td><td>Mexican American</td></tr>
 <tr><td></td><td>Other Hispanic</td></tr>
 <tr><td></td><td>Black</td></tr>
 <tr><td></td><td>Other</td></tr>
 <tr><td><a name="levels.race">gender</a></td><td>Male</td></tr>
 <tr><td></td><td>Female</td></tr>
 <tr><td><a name="levels.diabetes">diabetes, chf, chd</a></td><td>No</td></tr>
 <tr><td><a name="levels.educationadult">&emsp;cancer, stroke</a></td><td>Yes</td></tr>
 <tr><td><a name="levels.mobilityproblem">educationadult</a></td><td>Less than high school</td></tr>
 <tr><td></td><td>High school</td></tr>
 <tr><td></td><td>More than high school</td></tr>
 <tr><td><a name="levels.bmi.cat">mobilityproblem</a></td><td>No Difficulty</td></tr>
 <tr><td></td><td>Any Difficulty</td></tr>
 <tr><td><a name="levels.gender">drinkstatus</a></td><td>Moderate Drinker</td></tr>
 <tr><td></td><td>Non-Drinker</td></tr>
 <tr><td></td><td>Heavy Drinker</td></tr>
 <tr><td></td><td>Missing alcohol</td></tr>
 <tr><td><a name="levels.drinkstatus">smokecigs</a></td><td>Never</td></tr>
 <tr><td></td><td>Former</td></tr>
 <tr><td></td><td>Current</td></tr>
 </table>

 <hr>

```


### Updated analysis dataset

Additional meta-data is added to the original *source* data set. We write this new modified data set back to the **data** folder after adding additional meta-data for the following variables:


* **seqn** - add label "respondent sequence number"
* **gender** - add label "gender',
* **age** - add label "age" and unit "years"
* **educationadult** - add label "education level"
* **permth.exm** - add label "Person Months of Follow-up from MEC/Exam Date"
* **mortstat** - add label "Final mortality status"
* **sys** - add label "Systolic Blood pressure" and unit "mg/dl" 
* **lbxtc** - add label "Total cholesterol" and unit "mg/dL"
* **lbdhdd** - add label "HDL cholesterol" and unit "mg/dL"
* **smokecigs** - add label "smoking status"
* **drinkstatus** - add label "alcohol consumption" 
* **bmi** - add label "body mass index" and unit "kg/m2"
* **diabetes** - add label "diabetes"
* **chf** - add label "congestive heart failure" 
* **cancer** - add label "cancer"  
* **stroke** - add label "stroke" 
* **mobilityproblem** - add label "'difficulties with mobility"
* **tac** - add label "total activity counts per day" 
* **tlac** - add label "total log activity count (log(1+activity))" 
* **wt** - add label "total accelerometer wear time" and unit "minutes"
* **mvpa** - add label "Moderate or vigorous physical activity" and unit "minutes" 



At this stage we select the variables of interest to take in to the IDA phase by dropping variables we do not check in IDA.

As a cross check we display the contents again to ensure the additional data is added, and then write back the changes to the data folder in the file "data/a_nhanes.rda". 

Input object size:	 1479216 bytes;	 33 variables	 6680 observations
New object size:	1416624 bytes;	33 variables	6680 observations

```{=html}
<hr><h4>Data frame:a_nhanes</h4>6680 observations and 33 variables, maximum # NAs:708  
 <hr>
 <style>
 .hmisctable242921 {
 border: 1px solid gray;
 border-collapse: collapse;
 font-size: 100%;
 }
 .hmisctable242921 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable242921 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable242921" border="1">
 <tr><th>Name</th><th>Labels</th><th>Units</th><th>Levels</th><th>Class</th><th>Storage</th><th>NAs</th></tr>
 <tr><td>seqn</td><td>respondent sequence number</td><td></td><td></td><td>integer</td><td>integer</td><td>  0</td></tr>
 <tr><td>age</td><td>age</td><td>years</td><td></td><td>numeric</td><td>double</td><td>  0</td></tr>
 <tr><td>gender</td><td>gender</td><td></td><td><a href="#levels.gender">2</a></td><td></td><td>integer</td><td>  0</td></tr>
 <tr><td>permth.exm</td><td>Person Months of Follow-up from MEC/Exam Date</td><td></td><td></td><td>integer</td><td>integer</td><td>  9</td></tr>
 <tr><td>mortstat</td><td>Final mortality status</td><td></td><td></td><td>integer</td><td>integer</td><td>  9</td></tr>
 <tr><td>educationadult</td><td>education level</td><td></td><td><a href="#levels.educationadult">3</a></td><td></td><td>integer</td><td>  7</td></tr>
 <tr><td>smokecigs</td><td>smoking status</td><td></td><td><a href="#levels.smokecigs">3</a></td><td></td><td>integer</td><td>  4</td></tr>
 <tr><td>drinkstatus</td><td>alcohol consumption</td><td></td><td><a href="#levels.drinkstatus">4</a></td><td></td><td>integer</td><td>  0</td></tr>
 <tr><td>bmi</td><td>body mass index</td><td>kg/m2</td><td></td><td>numeric</td><td>double</td><td> 56</td></tr>
 <tr><td>diabetes</td><td>diabetes</td><td></td><td><a href="#levels.diabetes">2</a></td><td></td><td>integer</td><td>  0</td></tr>
 <tr><td>chf</td><td>congestive heart failure</td><td></td><td><a href="#levels.diabetes">2</a></td><td></td><td>integer</td><td>  0</td></tr>
 <tr><td>cancer</td><td>cancer</td><td></td><td><a href="#levels.diabetes">2</a></td><td></td><td>integer</td><td>  0</td></tr>
 <tr><td>stroke</td><td>stroke</td><td></td><td><a href="#levels.diabetes">2</a></td><td></td><td>integer</td><td>  0</td></tr>
 <tr><td>sys</td><td>Systolic blood pressure</td><td>mg/dl</td><td></td><td>integer</td><td>integer</td><td>320</td></tr>
 <tr><td>lbxtc</td><td>Total cholesterol</td><td>mg/dL</td><td></td><td>integer</td><td>integer</td><td>270</td></tr>
 <tr><td>lbdhdd</td><td>HDL cholesterol</td><td>mg/dL</td><td></td><td>integer</td><td>integer</td><td>270</td></tr>
 <tr><td>mobilityproblem</td><td>difficulties with mobility</td><td></td><td><a href="#levels.mobilityproblem">2</a></td><td></td><td>integer</td><td>  0</td></tr>
 <tr><td>tac</td><td>total activity counts per day</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>tlac</td><td>total log activity count (log(1+activity))</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>mvpa</td><td>Moderate or vigorous physical activity</td><td>minutes</td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>wt</td><td>total accelerometer wear time</td><td>minutes</td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>tlac.1</td><td>total log actvity count 12:00AM-2:00AM</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>tlac.2</td><td>total log actvity count 2:00AM-4:00AM</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>tlac.3</td><td>total log actvity count 4:00AM-6:00AM</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>tlac.4</td><td>total log actvity count 6:00AM-8:00AM</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>tlac.5</td><td>total log actvity count 8:00AM-10:00AM</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>tlac.6</td><td>total log actvity count 10:00AM-12:00PM</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>tlac.7</td><td>total log actvity count 12:00PM-2:00PM</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>tlac.8</td><td>total log actvity count 2:00PM-4:00PM</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>tlac.9</td><td>total log actvity count 4:00PM-6:00PM</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>tlac.10</td><td>total log actvity count 6:00PM-8:00PM</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>tlac.11</td><td>total log actvity count 8:00PM-10:00PM</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 <tr><td>tlac.12</td><td>total log actvity count 10:00PM-12:00AM</td><td></td><td></td><td>numeric</td><td>double</td><td>708</td></tr>
 </table>

 <hr>
 <style>
 .hmisctable380688 {
 border: 1px solid gray;
 border-collapse: collapse;
 font-size: 100%;
 }
 .hmisctable380688 td {
 text-align: right;
 padding: 0 1ex 0 1ex;
 }
 .hmisctable380688 th {
 color: Black;
 text-align: center;
 padding: 0 1ex 0 1ex;
 font-weight: bold;
 }
 </style>
 <table class="hmisctable380688" border="1">
 <tr><th>Variable</th><th>Levels</th></tr>
 <tr><td><a name="levels.gender">gender</a></td><td>Male</td></tr>
 <tr><td></td><td>Female</td></tr>
 <tr><td><a name="levels.smokecigs">educationadult</a></td><td>Less than high school</td></tr>
 <tr><td></td><td>High school</td></tr>
 <tr><td></td><td>More than high school</td></tr>
 <tr><td><a name="levels.mobilityproblem">smokecigs</a></td><td>Never</td></tr>
 <tr><td></td><td>Former</td></tr>
 <tr><td></td><td>Current</td></tr>
 <tr><td><a name="levels.smokecigs">drinkstatus</a></td><td>Moderate Drinker</td></tr>
 <tr><td></td><td>Non-Drinker</td></tr>
 <tr><td></td><td>Heavy Drinker</td></tr>
 <tr><td></td><td>Missing alcohol</td></tr>
 <tr><td><a name="levels.gender">diabetes, chf</a></td><td>No</td></tr>
 <tr><td><a name="levels.educationadult">&emsp;cancer, stroke</a></td><td>Yes</td></tr>
 <tr><td><a name="levels.smokecigs">mobilityproblem</a></td><td>No Difficulty</td></tr>
 <tr><td></td><td>Any Difficulty</td></tr>
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
##  [1] Hmisc_4.4-2     Formula_1.2-4   survival_3.1-12 lattice_0.20-41
##  [5] forcats_0.5.1   stringr_1.4.0   dplyr_1.0.4     purrr_0.3.4    
##  [9] readr_1.4.0     tidyr_1.1.2     tibble_3.0.6    ggplot2_3.3.3  
## [13] tidyverse_1.3.0 here_1.0.1     
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_1.0.6          lubridate_1.7.9.2   png_0.1-7          
##  [4] assertthat_0.2.1    rprojroot_2.0.2     digest_0.6.27      
##  [7] R6_2.5.0            cellranger_1.1.0    backports_1.2.1    
## [10] reprex_1.0.0        evaluate_0.14       httr_1.4.2         
## [13] pillar_1.4.7        rlang_0.4.10        readxl_1.3.1       
## [16] data.table_1.13.6   rstudioapi_0.13     rpart_4.1-15       
## [19] Matrix_1.2-18       checkmate_2.0.0     rmarkdown_2.6      
## [22] splines_4.0.2       foreign_0.8-80      htmlwidgets_1.5.3  
## [25] munsell_0.5.0       broom_0.7.4         compiler_4.0.2     
## [28] modelr_0.1.8        xfun_0.20           pkgconfig_2.0.3    
## [31] base64enc_0.1-3     htmltools_0.5.1.1   nnet_7.3-14        
## [34] tidyselect_1.1.0    htmlTable_2.1.0     gridExtra_2.3      
## [37] bookdown_0.21       crayon_1.4.1        dbplyr_2.1.0       
## [40] withr_2.4.1         grid_4.0.2          jsonlite_1.7.2     
## [43] gtable_0.3.0        lifecycle_0.2.0     DBI_1.1.1          
## [46] magrittr_2.0.1      scales_1.1.1        rmdformats_1.0.1   
## [49] cli_2.3.0           stringi_1.5.3       fs_1.5.0           
## [52] latticeExtra_0.6-29 xml2_1.3.2          ellipsis_0.3.1     
## [55] generics_0.1.0      vctrs_0.3.6         RColorBrewer_1.1-2 
## [58] tools_4.0.2         glue_1.4.2          hms_1.0.0          
## [61] jpeg_0.1-8.1        yaml_2.2.1          colorspace_2.0-0   
## [64] cluster_2.1.0       rvest_0.3.6         knitr_1.31         
## [67] haven_2.3.1
```
