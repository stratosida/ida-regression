# Data screening and possible actions

**TODO: Check for copy and paste errors in table.**

## Univariate distributions

||What to look at|Possible actions: Interpretation|Possible actions: SAP|Possible actions: Presentation|
|-|-|-|-|-|
| Continuous variables | General skewness | Help in interpreting results | Update SAP | Update intended presentation of results |
| Continuous   variables | General skewness | Wide CI for coefficients | Use variable as log-transformed | Update intended presentation of results |
| Continuous   variables | Outliers | Disproportional impact on results | Winsorize or transform | Model involves winsorization |
| Continuous   variables | Spike at 0 | Narrow CI at 0 | Use appropriate representation of variable in model | Use 2 (or more) coefficients to distinguish 0 from non-0 continuous part |
| Categorical variables | Frequencies | Comparisons to default reference probably irrelevant | Change reference category | Contrasts compare to (new) reference category |
| Categorical   variables | Rare categories | Wide CI for coefficients | Collapse/exclude | Fewer categories to present |
| Categorical   variables | One very frequent category | Comparisons irrelevant? | Exclude variable | Variable omitted |


## Bivariate distributions

||What to look at|Possible actions: Interpretation|Possible actions: SAP|Possible actions: Presentation|
|-|-|-|-|-|
| Continuous by continuous | Outliers (from the cloud) | Disproportional impact on results | Winsorize or transform | Model involves winsorization |
| Continuous by continuous | Correlations | Wide CI for coefficients | Winsorize or transform | Model involves winsorization |
| Continuous by categorical | Outliers (only visible in bivariate plot) | Wide CI for coefficients |||
| Categorical by categorical | Frequent/rare combinations | Comparison to default reference irrelevant | Change reference category | Contrasts compare to (new) reference category |
| Categorical by categorical | Frequent/rare combinations | interactions relevant? | Remove interaction from model | Fewer interactions to present |

## Missing values

||What to look at|Possible actions: Interpretation|Possible actions: SAP|Possible actions: Presentation|
|-|-|-|-|-|
| Per variable | Number and proportion | Wide CI for coefficients | Remove variable if many missing values |  |
| Pattern | Variables missing independently or together |  | Omit variables together | Changes model |
| Pattern | Variables missing dependent on levels of other variables | Systematic missingness? Model still based on representative? | IPW needed? | Weighted analysis |
| Complete cases | Number and proportion | Few cases left for main CCO analysis | Multiple imputation (or other way of dealing with missing values)? | Result from MI analysis? Or applicability restricted to a subpopulation? |


**References**

Huebner M, le Cessie S, Schmidt CO, Vach W . A contemporary conceptual framework for initial data analysis. Observational Studies 2018; 4: 171-192. Link

Harrell

[…]
