
#  Bivariate distributions

Multivariate Crash2

This code is a continous by example



## Read data 

### Load the dataset.


```r
load(here::here("data", "crash2.rda"))

crash2 <- Hmisc::upData(crash2,
                        labels = c(age = 'Age'),
                        units = c(age = "years"))
```

```
## Input object size:	 4094896 bytes;	 44 variables	 20207 observations
## New object size:	4095640 bytes;	44 variables	20207 observations
```


### Histograms

<!--html_preserve--><div id="htmlwidget-0b79c2dfd2b83487dcec" style="width:672px;height:250px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-0b79c2dfd2b83487dcec">{"x":{"visdat":{"1dc1c45a21ef1":["function () ","plotlyVisDat"],"1dc1c25624b46":["function () ","data"],"1dc1cbf9d67":["function () ","data"],"1dc1c5f425f54":["function () ","data"],"1dc1c71527be9":["function () ","data"],"1dc1c6cd1cec":["function () ","data"],"1dc1c7944274":["function () ","data"],"1dc1c7e802699":["function () ","data"]},"cur_data":"1dc1c7e802699","attrs":{"1dc1c25624b46":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"xend":{},"yend":{},"type":"scatter","mode":"lines","text":{},"hoverinfo":"text","color":["black"],"name":"Histogram","legendgroup":"Histogram","showlegend":true,"inherit":true},"1dc1cbf9d67":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"type":"scatter","mode":"markers","color":["black"],"text":{},"hoverinfo":"text","size":[5],"name":"Mean","legendgroup":"Mean","showlegend":true,"inherit":true},"1dc1c5f425f54":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"xend":{},"yend":{},"type":"scatter","mode":"lines","text":{},"hoverinfo":"text","name":"Median","legendgroup":"Median","showlegend":true,"color":["black"],"line":{"width":3},"inherit":true},"1dc1c71527be9":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"xend":{},"yend":{},"type":"scatter","mode":"lines","text":{},"hoverinfo":"text","name":"Quartiles","legendgroup":"Quartiles","showlegend":true,"color":["blue"],"line":{"width":2},"inherit":true},"1dc1c6cd1cec":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"xend":{},"yend":{},"type":"scatter","mode":"lines","text":{},"hoverinfo":"text","name":"0.05, 0.95<br>Quantiles","legendgroup":"0.05, 0.95<br>Quantiles","showlegend":true,"color":["red"],"line":{"width":2},"inherit":true},"1dc1c6cd1cec.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"xend":{},"yend":{},"type":"scatter","mode":"lines","hoverinfo":"none","showlegend":false,"alpha":0.3,"color":["red"],"legendgroup":"0.05, 0.95<br>Quantiles","name":"ignored","inherit":true},"1dc1c6cd1cec.2":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"xend":{},"yend":{},"type":"scatter","mode":"lines","hoverinfo":"none","showlegend":false,"alpha":0.3,"color":["blue"],"legendgroup":"Quartiles","name":"ignored","inherit":true},"1dc1c6cd1cec.3":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"xend":{},"yend":{},"type":"scatter","mode":"lines","hoverinfo":"none","showlegend":false,"alpha":0.3,"color":["red"],"legendgroup":"0.05, 0.95<br>Quantiles","name":"ignored","inherit":true},"1dc1c7944274":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"xend":{},"yend":{},"type":"scatter","mode":"lines","text":{},"hoverinfo":"text","color":["light gray"],"name":"Gini <span style=\"text-decoration: overline\">|Δ|<\/span>","legendgroup":"Gini <span style=\"text-decoration: overline\">|Δ|<\/span>","visible":"legendonly","showlegend":true,"inherit":true},"1dc1c7e802699":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"xend":{},"yend":{},"type":"scatter","mode":"lines","text":{},"hoverinfo":"text","color":["light blue"],"name":"SD","legendgroup":"SD","visible":"legendonly","showlegend":true,"inherit":true}},"layout":{"height":250,"margin":{"b":40,"l":70,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":"Age <span style='font-family:Verdana;font-size:75%;'>years<\/span>","zeroline":false},"yaxis":{"domain":[0,1],"automargin":true,"title":"","tickvals":[-1,-2],"ticktext":["0","1"]},"hovermode":"closest","showlegend":true},"source":"A","config":{"showSendToCloud":false},"data":[{"x":[1,1,null,14,14,null,15,15,null,16,16,null,17,17,null,18,18,null,19,19,null,20,20,null,21,21,null,22,22,null,23,23,null,24,24,null,25,25,null,26,26,null,27,27,null,28,28,null,29,29,null,30,30,null,31,31,null,32,32,null,33,33,null,34,34,null,35,35,null,36,36,null,37,37,null,38,38,null,39,39,null,40,40,null,41,41,null,42,42,null,43,43,null,44,44,null,45,45,null,46,46,null,47,47,null,48,48,null,49,49,null,50,50,null,51,51,null,52,52,null,53,53,null,54,54,null,55,55,null,56,56,null,57,57,null,58,58,null,59,59,null,60,60,null,61,61,null,62,62,null,63,63,null,64,64,null,65,65,null,66,66,null,67,67,null,68,68,null,69,69,null,70,70,null,71,71,null,72,72,null,73,73,null,74,74,null,75,75,null,76,76,null,77,77,null,78,78,null,79,79,null,80,80,null,81,81,null,82,82,null,83,83,null,84,84,null,85,85,null,86,86,null,87,87,null,88,88,null,89,89,null,90,90,null,91,91,null,92,92,null,94,94,null,95,95,null,96,96,null,99,99,null,16,16,null,18,18,null,19,19,null,20,20,null,21,21,null,24,24,null,25,25,null,26,26,null,28,28,null,29,29,null,30,30,null,31,31,null,33,33,null,34,34,null,35,35,null,36,36,null,37,37,null,39,39,null,40,40,null,42,42,null,43,43,null,44,44,null,45,45,null,46,46,null,48,48,null,49,49,null,50,50,null,51,51,null,53,53,null,54,54,null,55,55,null,57,57,null,59,59,null,60,60,null,61,61,null,64,64,null,65,65,null,66,66,null,67,67,null,69,69,null,70,70,null,71,71,null,73,73,null,77,77,null,90,90],"y":[-1,-0.999565846599132,null,-1,-0.999565846599132,null,-1,-0.998697539797395,null,-1,-0.808538350217077,null,-1,-0.825036179450072,null,-1,-0.704775687409551,null,-1,-0.73603473227207,null,-1,-0.647033285094067,null,-1,-0.75643994211288,null,-1,-0.67698986975398,null,-1,-0.703039073806078,null,-1,-0.710853835021708,null,-1,-0.549782923299566,null,-1,-0.746454413892909,null,-1,-0.735166425470333,null,-1,-0.700868306801737,null,-1,-0.78726483357453,null,-1,-0.550651230101302,null,-1,-0.851953690303907,null,-1,-0.764688856729378,null,-1,-0.845007235890014,null,-1,-0.838060781476122,null,-1,-0.656150506512301,null,-1,-0.850217076700434,null,-1,-0.869753979739508,null,-1,-0.819392185238784,null,-1,-0.888422575976845,null,-1,-0.685238784370478,null,-1,-0.912301013024602,null,-1,-0.86150506512301,null,-1,-0.897973950795948,null,-1,-0.915774240231549,null,-1,-0.749927641099855,null,-1,-0.914037626628075,null,-1,-0.901447178002894,null,-1,-0.895803183791606,null,-1,-0.92315484804631,null,-1,-0.812011577424023,null,-1,-0.935311143270622,null,-1,-0.922286541244573,null,-1,-0.931837916063676,null,-1,-0.947467438494935,null,-1,-0.88451519536903,null,-1,-0.94616497829233,null,-1,-0.956150506512301,null,-1,-0.942691751085384,null,-1,-0.961794500723589,null,-1,-0.903183791606368,null,-1,-0.970043415340087,null,-1,-0.96657018813314,null,-1,-0.973082489146165,null,-1,-0.980897250361795,null,-1,-0.928798842257598,null,-1,-0.981331403762663,null,-1,-0.974819102749638,null,-1,-0.972648335745297,null,-1,-0.978292329956585,null,-1,-0.939218523878437,null,-1,-0.984370477568741,null,-1,-0.978292329956585,null,-1,-0.986975397973951,null,-1,-0.988712011577424,null,-1,-0.979160636758321,null,-1,-0.987409551374819,null,-1,-0.986975397973951,null,-1,-0.987843704775687,null,-1,-0.991316931982634,null,-1,-0.984804630969609,null,-1,-0.993921852387844,null,-1,-0.99218523878437,null,-1,-0.993921852387844,null,-1,-0.996960926193922,null,-1,-0.99479015918958,null,-1,-0.996960926193922,null,-1,-0.997829232995659,null,-1,-0.99739507959479,null,-1,-0.998263386396527,null,-1,-0.999131693198263,null,-1,-0.999131693198263,null,-1,-0.999565846599132,null,-1,-0.999565846599132,null,-1,-0.999131693198263,null,-1,-0.999131693198263,null,-1,-0.999565846599132,null,-2,-1.9,null,-2,-1.7,null,-2,-1.9,null,-2,-1.9,null,-2,-1.7,null,-2,-1.9,null,-2,-1.6,null,-2,-1.8,null,-2,-1.9,null,-2,-1.9,null,-2,-1.5,null,-2,-1.9,null,-2,-1.8,null,-2,-1.8,null,-2,-1.7,null,-2,-1.9,null,-2,-1.8,null,-2,-1.9,null,-2,-1.9,null,-2,-1.7,null,-2,-1.9,null,-2,-1.9,null,-2,-1.8,null,-2,-1.9,null,-2,-1.8,null,-2,-1.9,null,-2,-1.9,null,-2,-1.9,null,-2,-1.6,null,-2,-1.8,null,-2,-1.8,null,-2,-1.8,null,-2,-1.8,null,-2,-1.5,null,-2,-1.8,null,-2,-1.9,null,-2,-1.7,null,-2,-1.9,null,-2,-1.8,null,-2,-1.8,null,-2,-1.4,null,-2,-1.9,null,-2,-1.9,null,-2,-1.9,null,-2,-1.9],"type":"scatter","mode":"lines","text":["1<br>0<br>n=1","1<br>0<br>n=1",null,"14<br>0<br>n=1","14<br>0<br>n=1",null,"15<br>0<br>n=3","15<br>0<br>n=3",null,"16<br>0.022<br>n=441","16<br>0.022<br>n=441",null,"17<br>0.02<br>n=403","17<br>0.02<br>n=403",null,"18<br>0.034<br>n=680","18<br>0.034<br>n=680",null,"19<br>0.03<br>n=608","19<br>0.03<br>n=608",null,"20<br>0.041<br>n=813","20<br>0.041<br>n=813",null,"21<br>0.028<br>n=561","21<br>0.028<br>n=561",null,"22<br>0.037<br>n=744","22<br>0.037<br>n=744",null,"23<br>0.034<br>n=684","23<br>0.034<br>n=684",null,"24<br>0.033<br>n=666","24<br>0.033<br>n=666",null,"25<br>0.052<br>n=1037","25<br>0.052<br>n=1037",null,"26<br>0.029<br>n=584","26<br>0.029<br>n=584",null,"27<br>0.03<br>n=610","27<br>0.03<br>n=610",null,"28<br>0.034<br>n=689","28<br>0.034<br>n=689",null,"29<br>0.024<br>n=490","29<br>0.024<br>n=490",null,"30<br>0.052<br>n=1035","30<br>0.052<br>n=1035",null,"31<br>0.017<br>n=341","31<br>0.017<br>n=341",null,"32<br>0.027<br>n=542","32<br>0.027<br>n=542",null,"33<br>0.018<br>n=357","33<br>0.018<br>n=357",null,"34<br>0.019<br>n=373","34<br>0.019<br>n=373",null,"35<br>0.04<br>n=792","35<br>0.04<br>n=792",null,"36<br>0.017<br>n=345","36<br>0.017<br>n=345",null,"37<br>0.015<br>n=300","37<br>0.015<br>n=300",null,"38<br>0.021<br>n=416","38<br>0.021<br>n=416",null,"39<br>0.013<br>n=257","39<br>0.013<br>n=257",null,"40<br>0.036<br>n=725","40<br>0.036<br>n=725",null,"41<br>0.01<br>n=202","41<br>0.01<br>n=202",null,"42<br>0.016<br>n=319","42<br>0.016<br>n=319",null,"43<br>0.012<br>n=235","43<br>0.012<br>n=235",null,"44<br>0.01<br>n=194","44<br>0.01<br>n=194",null,"45<br>0.029<br>n=576","45<br>0.029<br>n=576",null,"46<br>0.01<br>n=198","46<br>0.01<br>n=198",null,"47<br>0.011<br>n=227","47<br>0.011<br>n=227",null,"48<br>0.012<br>n=240","48<br>0.012<br>n=240",null,"49<br>0.009<br>n=177","49<br>0.009<br>n=177",null,"50<br>0.022<br>n=433","50<br>0.022<br>n=433",null,"51<br>0.007<br>n=149","51<br>0.007<br>n=149",null,"52<br>0.009<br>n=179","52<br>0.009<br>n=179",null,"53<br>0.008<br>n=157","53<br>0.008<br>n=157",null,"54<br>0.006<br>n=121","54<br>0.006<br>n=121",null,"55<br>0.013<br>n=266","55<br>0.013<br>n=266",null,"56<br>0.006<br>n=124","56<br>0.006<br>n=124",null,"57<br>0.005<br>n=101","57<br>0.005<br>n=101",null,"58<br>0.007<br>n=132","58<br>0.007<br>n=132",null,"59<br>0.004<br>n=88","59<br>0.004<br>n=88",null,"60<br>0.011<br>n=223","60<br>0.011<br>n=223",null,"61<br>0.003<br>n=69","61<br>0.003<br>n=69",null,"62<br>0.004<br>n=77","62<br>0.004<br>n=77",null,"63<br>0.003<br>n=62","63<br>0.003<br>n=62",null,"64<br>0.002<br>n=44","64<br>0.002<br>n=44",null,"65<br>0.008<br>n=164","65<br>0.008<br>n=164",null,"66<br>0.002<br>n=43","66<br>0.002<br>n=43",null,"67<br>0.003<br>n=58","67<br>0.003<br>n=58",null,"68<br>0.003<br>n=63","68<br>0.003<br>n=63",null,"69<br>0.002<br>n=50","69<br>0.002<br>n=50",null,"70<br>0.007<br>n=140","70<br>0.007<br>n=140",null,"71<br>0.002<br>n=36","71<br>0.002<br>n=36",null,"72<br>0.002<br>n=50","72<br>0.002<br>n=50",null,"73<br>0.001<br>n=30","73<br>0.001<br>n=30",null,"74<br>0.001<br>n=26","74<br>0.001<br>n=26",null,"75<br>0.002<br>n=48","75<br>0.002<br>n=48",null,"76<br>0.001<br>n=29","76<br>0.001<br>n=29",null,"77<br>0.001<br>n=30","77<br>0.001<br>n=30",null,"78<br>0.001<br>n=28","78<br>0.001<br>n=28",null,"79<br>0.001<br>n=20","79<br>0.001<br>n=20",null,"80<br>0.002<br>n=35","80<br>0.002<br>n=35",null,"81<br>0.001<br>n=14","81<br>0.001<br>n=14",null,"82<br>0.001<br>n=18","82<br>0.001<br>n=18",null,"83<br>0.001<br>n=14","83<br>0.001<br>n=14",null,"84<br>0<br>n=7","84<br>0<br>n=7",null,"85<br>0.001<br>n=12","85<br>0.001<br>n=12",null,"86<br>0<br>n=7","86<br>0<br>n=7",null,"87<br>0<br>n=5","87<br>0<br>n=5",null,"88<br>0<br>n=6","88<br>0<br>n=6",null,"89<br>0<br>n=4","89<br>0<br>n=4",null,"90<br>0<br>n=2","90<br>0<br>n=2",null,"91<br>0<br>n=2","91<br>0<br>n=2",null,"92<br>0<br>n=1","92<br>0<br>n=1",null,"94<br>0<br>n=1","94<br>0<br>n=1",null,"95<br>0<br>n=2","95<br>0<br>n=2",null,"96<br>0<br>n=2","96<br>0<br>n=2",null,"99<br>0<br>n=1","99<br>0<br>n=1",null,"16<br>0.011<br>n=1","16<br>0.011<br>n=1",null,"18<br>0.034<br>n=3","18<br>0.034<br>n=3",null,"19<br>0.011<br>n=1","19<br>0.011<br>n=1",null,"20<br>0.011<br>n=1","20<br>0.011<br>n=1",null,"21<br>0.034<br>n=3","21<br>0.034<br>n=3",null,"24<br>0.011<br>n=1","24<br>0.011<br>n=1",null,"25<br>0.046<br>n=4","25<br>0.046<br>n=4",null,"26<br>0.023<br>n=2","26<br>0.023<br>n=2",null,"28<br>0.011<br>n=1","28<br>0.011<br>n=1",null,"29<br>0.011<br>n=1","29<br>0.011<br>n=1",null,"30<br>0.057<br>n=5","30<br>0.057<br>n=5",null,"31<br>0.011<br>n=1","31<br>0.011<br>n=1",null,"33<br>0.023<br>n=2","33<br>0.023<br>n=2",null,"34<br>0.023<br>n=2","34<br>0.023<br>n=2",null,"35<br>0.034<br>n=3","35<br>0.034<br>n=3",null,"36<br>0.011<br>n=1","36<br>0.011<br>n=1",null,"37<br>0.023<br>n=2","37<br>0.023<br>n=2",null,"39<br>0.011<br>n=1","39<br>0.011<br>n=1",null,"40<br>0.011<br>n=1","40<br>0.011<br>n=1",null,"42<br>0.034<br>n=3","42<br>0.034<br>n=3",null,"43<br>0.011<br>n=1","43<br>0.011<br>n=1",null,"44<br>0.011<br>n=1","44<br>0.011<br>n=1",null,"45<br>0.023<br>n=2","45<br>0.023<br>n=2",null,"46<br>0.011<br>n=1","46<br>0.011<br>n=1",null,"48<br>0.023<br>n=2","48<br>0.023<br>n=2",null,"49<br>0.011<br>n=1","49<br>0.011<br>n=1",null,"50<br>0.011<br>n=1","50<br>0.011<br>n=1",null,"51<br>0.011<br>n=1","51<br>0.011<br>n=1",null,"53<br>0.046<br>n=4","53<br>0.046<br>n=4",null,"54<br>0.023<br>n=2","54<br>0.023<br>n=2",null,"55<br>0.023<br>n=2","55<br>0.023<br>n=2",null,"57<br>0.023<br>n=2","57<br>0.023<br>n=2",null,"59<br>0.023<br>n=2","59<br>0.023<br>n=2",null,"60<br>0.057<br>n=5","60<br>0.057<br>n=5",null,"61<br>0.023<br>n=2","61<br>0.023<br>n=2",null,"64<br>0.011<br>n=1","64<br>0.011<br>n=1",null,"65<br>0.034<br>n=3","65<br>0.034<br>n=3",null,"66<br>0.011<br>n=1","66<br>0.011<br>n=1",null,"67<br>0.023<br>n=2","67<br>0.023<br>n=2",null,"69<br>0.023<br>n=2","69<br>0.023<br>n=2",null,"70<br>0.069<br>n=6","70<br>0.069<br>n=6",null,"71<br>0.011<br>n=1","71<br>0.011<br>n=1",null,"73<br>0.011<br>n=1","73<br>0.011<br>n=1",null,"77<br>0.011<br>n=1","77<br>0.011<br>n=1",null,"90<br>0.011<br>n=1","90<br>0.011<br>n=1"],"hoverinfo":["text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text",null,"text","text"],"name":"Histogram","legendgroup":"Histogram","showlegend":true,"marker":{"color":"rgba(0,0,0,1)","line":{"color":"rgba(0,0,0,1)"}},"textfont":{"color":"rgba(0,0,0,1)"},"error_y":{"color":"rgba(0,0,0,1)"},"error_x":{"color":"rgba(0,0,0,1)"},"line":{"color":"rgba(0,0,0,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[34.5100553919856,46.2183908045977],"y":[-1.225,-2.225],"type":"scatter","mode":"markers","text":["Mean:34.51<br>n=20039<br>1 missing","Mean:46.218<br>n=87<br>0 missing"],"hoverinfo":["text","text"],"name":"Mean","legendgroup":"Mean","showlegend":true,"marker":{"color":"rgba(0,0,0,1)","size":[5,5],"sizemode":"area","line":{"color":"rgba(0,0,0,1)"}},"textfont":{"color":"rgba(0,0,0,1)","size":5},"error_y":{"color":"rgba(0,0,0,1)","width":5},"error_x":{"color":"rgba(0,0,0,1)","width":5},"line":{"color":"rgba(0,0,0,1)","width":5},"xaxis":"x","yaxis":"y","frame":null},{"x":[30,30,null,46,46],"y":[-1.4,-1.05,null,-2.4,-2.05],"type":"scatter","mode":"lines","text":["Q<sub>0.5<\/sub>:30","Q<sub>0.5<\/sub>:30",null,"Q<sub>0.5<\/sub>:46","Q<sub>0.5<\/sub>:46"],"hoverinfo":["text","text",null,"text","text"],"name":"Median","legendgroup":"Median","showlegend":true,"line":{"color":"rgba(0,0,0,1)","width":3},"marker":{"color":"rgba(0,0,0,1)","line":{"color":"rgba(0,0,0,1)"}},"textfont":{"color":"rgba(0,0,0,1)"},"error_y":{"color":"rgba(0,0,0,1)"},"error_x":{"color":"rgba(0,0,0,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[24,24,null,43,43,null,30,30,null,60,60],"y":[-1.365,-1.085,null,-1.365,-1.085,null,-2.365,-2.085,null,-2.365,-2.085],"type":"scatter","mode":"lines","text":["Q<sub>0.25<\/sub>:24","Q<sub>0.25<\/sub>:24",null,"Q<sub>0.75<\/sub>:43","Q<sub>0.75<\/sub>:43",null,"Q<sub>0.25<\/sub>:30","Q<sub>0.25<\/sub>:30",null,"Q<sub>0.75<\/sub>:60","Q<sub>0.75<\/sub>:60"],"hoverinfo":["text","text",null,"text","text",null,"text","text",null,"text","text"],"name":"Quartiles","legendgroup":"Quartiles","showlegend":true,"line":{"color":"rgba(0,0,255,1)","width":2},"marker":{"color":"rgba(0,0,255,1)","line":{"color":"rgba(0,0,255,1)"}},"textfont":{"color":"rgba(0,0,255,1)"},"error_y":{"color":"rgba(0,0,255,1)"},"error_x":{"color":"rgba(0,0,255,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[18,18,null,63,63,null,19.3,19.3,null,70,70],"y":[-1.337,-1.113,null,-1.337,-1.113,null,-2.337,-2.113,null,-2.337,-2.113],"type":"scatter","mode":"lines","text":["Q<sub>0.05<\/sub>:18","Q<sub>0.05<\/sub>:18",null,"Q<sub>0.95<\/sub>:63","Q<sub>0.95<\/sub>:63",null,"Q<sub>0.05<\/sub>:19.3","Q<sub>0.05<\/sub>:19.3",null,"Q<sub>0.95<\/sub>:70","Q<sub>0.95<\/sub>:70"],"hoverinfo":["text","text",null,"text","text",null,"text","text",null,"text","text"],"name":"0.05, 0.95<br>Quantiles","legendgroup":"0.05, 0.95<br>Quantiles","showlegend":true,"line":{"color":"rgba(255,0,0,1)","width":2},"marker":{"color":"rgba(255,0,0,1)","line":{"color":"rgba(255,0,0,1)"}},"textfont":{"color":"rgba(255,0,0,1)"},"error_y":{"color":"rgba(255,0,0,1)"},"error_x":{"color":"rgba(255,0,0,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[18,24,null,19.3,30],"y":[-1.225,-1.225,null,-2.225,-2.225],"type":"scatter","mode":"lines","hoverinfo":["none","none",null,"none","none"],"showlegend":false,"legendgroup":"0.05, 0.95<br>Quantiles","name":"ignored","marker":{"color":"rgba(255,0,0,0.3)","line":{"color":"rgba(255,0,0,1)"}},"textfont":{"color":"rgba(255,0,0,0.3)"},"error_y":{"color":"rgba(255,0,0,0.3)"},"error_x":{"color":"rgba(255,0,0,0.3)"},"line":{"color":"rgba(255,0,0,0.3)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[24,43,null,30,60],"y":[-1.225,-1.225,null,-2.225,-2.225],"type":"scatter","mode":"lines","hoverinfo":["none","none",null,"none","none"],"showlegend":false,"legendgroup":"Quartiles","name":"ignored","marker":{"color":"rgba(0,0,255,0.3)","line":{"color":"rgba(0,0,255,1)"}},"textfont":{"color":"rgba(0,0,255,0.3)"},"error_y":{"color":"rgba(0,0,255,0.3)"},"error_x":{"color":"rgba(0,0,255,0.3)"},"line":{"color":"rgba(0,0,255,0.3)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[43,63,null,60,70],"y":[-1.225,-1.225,null,-2.225,-2.225],"type":"scatter","mode":"lines","hoverinfo":["none","none",null,"none","none"],"showlegend":false,"legendgroup":"0.05, 0.95<br>Quantiles","name":"ignored","marker":{"color":"rgba(255,0,0,0.3)","line":{"color":"rgba(255,0,0,1)"}},"textfont":{"color":"rgba(255,0,0,0.3)"},"error_y":{"color":"rgba(255,0,0,0.3)"},"error_x":{"color":"rgba(255,0,0,0.3)"},"line":{"color":"rgba(255,0,0,0.3)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[1,16.5072060524995,null,1,21.4987971130714],"y":[-1.19,-1.19,null,-2.19,-2.19],"type":"scatter","mode":"lines","text":["Gini mean difference:15.507","Gini mean difference:15.507",null,"Gini mean difference:20.499","Gini mean difference:20.499"],"hoverinfo":["text","text",null,"text","text"],"name":"Gini <span style=\"text-decoration: overline\">|Δ|<\/span>","legendgroup":"Gini <span style=\"text-decoration: overline\">|Δ|<\/span>","visible":"legendonly","showlegend":true,"marker":{"color":"rgba(211,211,211,1)","line":{"color":"rgba(211,211,211,1)"}},"textfont":{"color":"rgba(211,211,211,1)"},"error_y":{"color":"rgba(211,211,211,1)"},"error_x":{"color":"rgba(211,211,211,1)"},"line":{"color":"rgba(211,211,211,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[1,15.2314395559774,null,1,18.7517934156919],"y":[-1.23,-1.23,null,-2.23,-2.23],"type":"scatter","mode":"lines","text":["SD:14.231","SD:14.231",null,"SD:17.752","SD:17.752"],"hoverinfo":["text","text",null,"text","text"],"name":"SD","legendgroup":"SD","visible":"legendonly","showlegend":true,"marker":{"color":"rgba(173,216,230,1)","line":{"color":"rgba(173,216,230,1)"}},"textfont":{"color":"rgba(173,216,230,1)"},"error_y":{"color":"rgba(173,216,230,1)"},"error_x":{"color":"rgba(173,216,230,1)"},"line":{"color":"rgba(173,216,230,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


---
title: Multivariate Crash2
output: html_document
---


## Age {.tabset}

### Continous 


```r
crash2 %>% dplyr::filter(!is.na(sbp)) %>% tally()
```

```
##       n
## 1 19887
```

```r
crash2 %>% dplyr::filter(is.na(sbp)) %>% tally()
```

```
##     n
## 1 320
```

```r
bigN <- crash2 %>% dplyr::filter(!is.na(sbp) & !is.na(age)) %>% tally()
n_miss <- crash2 %>% dplyr::filter(is.na(sbp) | is.na(age)) %>% tally()

title <-
  paste0("Plot of ", Hmisc::label(crash2$age), " and ", Hmisc::label(crash2$sbp))

caption <-
  paste0(
    "n = ",
    bigN,
    " subjects displayed.\n",
    n_miss,
    " subjects with a missing value in at least one of the variables."
  )


x_axis <- paste0(Hmisc::label(crash2$age), " [", Hmisc::units(crash2$age), "]")
y_axis <- paste0(Hmisc::label(crash2$sbp), " [", Hmisc::units(crash2$sbp), "]")


p1 <- crash2 %>%
  dplyr::filter(!is.na(sbp) & !is.na(age)) %>%
  mutate(sbp = as.numeric(sbp), 
         age = as.numeric(age)) %>%
  ggplot(aes(x = sbp, y = age)) +
  ylab(x_axis) +
  xlab(y_axis) +
  labs(
    title = title,
    caption = caption
  ) +
  geom_point(shape = 16, #size = 0.5,
             alpha = 0.5,
             color = "firebrick2") +
  geom_rug() +
  theme_minimal()

p1
```

<img src="Multivar_crash2_files/figure-html/unnamed-chunk-4-1.png" width="672" />

### Continous2


```r
p1 <- crash2 %>%
  filter(!is.na(sbp) & !is.na(age)) %>%
  mutate(sbp = as.numeric(sbp), 
         age = as.numeric(age)) %>%
  ggplot(aes(x = sbp, y = age)) +
  geom_point(shape = 16, size = 0.5,
             alpha = 0.5,
             color = "firebrick2") +
  geom_rug() +
  theme_minimal()

p2 <- crash2 %>%
  filter(!is.na(sbp) & !is.na(hr)) %>%
  mutate(sbp = as.numeric(sbp), 
         age = as.numeric(hr)) %>%
  ggplot(aes(x = sbp, y = hr)) +
  geom_point(shape = 16, size = 0.5,
             alpha = 0.5,
             color = "firebrick2") +
  geom_rug() +
  theme_minimal()


p3 <- crash2 %>%
  filter(!is.na(sbp) & !is.na(rr)) %>%
  mutate(sbp = as.numeric(sbp), 
         age = as.numeric(rr)) %>%
  ggplot(aes(x = sbp, y = rr)) +
  geom_point(shape = 16, size = 0.5,
             alpha = 0.5,
             color = "firebrick2") +
  geom_rug() +
  theme_minimal()


p4 <- crash2 %>%
  filter(!is.na(hr) & !is.na(age)) %>%
  mutate(sbp = as.numeric(hr), 
         age = as.numeric(age)) %>%
  ggplot(aes(x = hr, y = age)) +
  geom_point(shape = 16, size = 0.5,
             alpha = 0.5,
             color = "firebrick2") +
  geom_rug() +
  theme_minimal()
```


### Continous3 


```r
library(patchwork)
```

```
## Warning: package 'patchwork' was built under R version 3.6.3
```

```r
(p1 + p2 ) / (p3 + p4)
```

```
## Don't know how to automatically pick scale for object of type labelled/integer. Defaulting to continuous.
## Don't know how to automatically pick scale for object of type labelled/integer. Defaulting to continuous.
## Don't know how to automatically pick scale for object of type labelled/integer. Defaulting to continuous.
```

<img src="Multivar_crash2_files/figure-html/unnamed-chunk-6-1.png" width="672" />



## {-}

