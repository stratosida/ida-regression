library(here)
library(tidyverse)
library(Hmisc)
library(naniar) ## for missing data 
load(here::here("data", "a_crash2.rda"))

n_miss(airquality)
#> [1] 44
n_complete(airquality)
#> [1] 874
prop_miss(airquality)
#> [1] 0.04793028
prop_complete(airquality)
#> [1] 0.9520697
pct_miss(airquality)
#> [1] 4.793028
pct_complete(airquality)


n_miss(a_crash2$sex)
n_complete(a_crash2$sex)
nrow(a_crash2)





```{r, message =FALSE, warning =FALSE , echo=FALSE}
a_crash2 %>%
  select(-time2death, -ddeath) %>%
  gg_miss_upset()
```


```{r, message =FALSE, warning =FALSE , echo=FALSE}
a_crash2 %>%
  select(sex, age, sbp, hr, cc, gcs) %>%
  gg_miss_upset()
```

```{r, message =FALSE, warning =FALSE , echo=FALSE}
a_crash2 %>%
  select(sex, age, sbp, hr, gcs) %>%
  gg_miss_var(show_pct = TRUE)

```


```{r, message =FALSE, warning =FALSE , echo=FALSE}
a_crash2 %>%
  select(sex, age, sbp, hr, gcs) %>%
  gg_miss_var(show_pct = TRUE, facet = sex)

```

```{r, message =FALSE, warning =FALSE , echo=FALSE}
a_crash2 %>%
  select(sex, age, sbp, hr, gcs) %>%
  gg_miss_case()
```

```{r, message =FALSE, warning =FALSE , echo=FALSE}
a_crash2 %>%
  select(sex, age, sbp, hr, gcs) %>%
  gg_miss_case(order_cases = TRUE)

```

```{r, message =FALSE, warning =FALSE , echo=FALSE}

a_crash2 %>%
  select(sex, age, sbp, hr, gcs) %>%
  gg_miss_fct(fct = sex)

```


a_crash2 %>%
  select(cc, sbp, rr) %>%
  miss_var_summary() %>%
  kableExtra::kable()

a_crash2 %>%
  select(cc, sbp, rr) %>%
  miss_case_summary()

a_crash2 %>%
  select(cc, sbp, rr) %>%
  miss_var_table()

a_crash2 %>%
  select(cc, sbp, rr) %>%
  miss_summary()



### 
library(rpart)
library(rpart.plot)

a_crash2 %>%
  select(-time2death,-ddeath, -entryid, -trandomised, -earlydeath) %>%
  add_prop_miss() %>%
  rpart(prop_miss_all ~ ., data = .) %>%
  prp(type = 4, extra = 101, prefix = "Prop. Miss = ")


```{r}
library(GGally)
ggplot <- function(...)
  ggplot2::ggplot(...) + scale_color_brewer(palette = "Purples") + scale_fill_brewer(palette =
                                                                                       "Purples")
unlockBinding("ggplot", parent.env(asNamespace("GGally")))
assign("ggplot", ggplot, parent.env(asNamespace("GGally")))

a_crash2 %>%
  select(age, hr, rr, sbp, cc, gcs, injurytime, injurytype, sex)

graph_corr <- ggpairs(a_crash2, mapping = aes(color = sex))
graph_corr <- graph_corr + theme_minimal()
graph_corr
```
