library(Hmisc)
set.seed(1)
describe(runif(200),dig=2)    #single variable, continuous
#get quantiles .05,.10,\dots

dfr <- data.frame(x=rnorm(400),y=sample(c('male','female'),400,TRUE))
describe(dfr)

# }
# NOT RUN {
options(grType='plotly')
d <- describe(dfr)
p <- plot(d)   # create plots for both types of variables
p[[1]]; p[[2]] # or p$Categorical; p$Continuous
plotly::subplot(p[[1]], p[[2]], nrows=2)  # plot both in one
plot(d, which='categorical')    # categorical ones


options(grType='ggplot')
plot(d)



library(Hmisc)
library(tidyverse)
getHdata(support2)
with(support2, histboxp(x=meanbp, group=dzgroup, sd=TRUE, bins=200))
support2 %>% glimpse()
with(support2, histboxp(x=age, group=death   , sd=TRUE, bins=200))

with(crash3, histboxp(x=sbp , sd=TRUE, bins=200))
