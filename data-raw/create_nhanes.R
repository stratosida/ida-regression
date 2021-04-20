pckgs <- c("knitr","kableExtra",              ## packages used for creating Tables
           "devtools",                        ## package used to download R packages stored on GitHub
           "ggplot2", "gridExtra",            ## packages for plotting 
           "corrplot",                        ## for correlation plot
           "reshape2",                        ## for transforming data long -> wide and wide -> long 
           "dplyr",                           ## packages for merging/transforming data
           "survey",                          ## package used for analyzing complex survey data in R
           "mgcv", "refund"                   ## packages used for smoothing/fpca
)
sapply(pckgs, function(x) if(!require(x,character.only=TRUE,quietly=TRUE)) {
  install.packages(x)
  require(x, character.only=TRUE)
})
rm(list=c("pckgs"))

#rnhanes data package from github
if(!require("rnhanesdata")){
  install_github("andrew-leroux/rnhanesdata")
  require("rnhanesdata")
}

RNGkind(sample.kind="Rounding")


# Download and process NHANES lab measurements from the 2 cohorts: 
# systolic blood pressure readings, total cholesterol, and HDL cholesterol. 
# These data are saved in the temporary directory, which is then removed once the covariates information is processed. 
# Blood pressure is recorded up to 4 times here for each participant. 
# The data collection procedure and description of cholesterol and blood pressure variables 
# is available at https://wwwn.cdc.gov/nchs/nhanes/search/datapage.aspx?Component=Examination&CycleBeginYear=2003 for the wave 2003-2004 and 
# at https://wwwn.cdc.gov/nchs/nhanes/search/datapage.aspx?Component=Examination&CycleBeginYear=2005 for the wave 2005-2006.


# Create a (local) temporary directory 
# where lab measurement (cholesterol, blood presure) data will be downloaded from the CDC website 
# and then loaded into R. These files need to be downloaded separately as 
# the raw files associated with these lab measurements are not included in the rnhanesdata package.

dir_tmp = tempfile()
dir.create(dir_tmp)

if (!dir.exists(dir_tmp)){
  dir.create(dir_tmp, showWarnings = FALSE)
}
dl_file = function(url) {
  bn = basename(url) 
  destfile = file.path(dir_tmp, bn)
  if (!file.exists(destfile)) {
    out = download.file(url, destfile = destfile, mode="wb")
  }
  stopifnot(file.exists(destfile))
}
## download the lab measurement data for the cohort 2003-2004
# Cholesterol - Total & HDL: LBXTC and LBXHDD
dl_file("https://wwwn.cdc.gov/Nchs/Nhanes/2003-2004/L13_C.XPT")
# Blood Pressure: BPXSY1 , BPXSY2, BPXSY3 and BPXSY4
dl_file("https://wwwn.cdc.gov/Nchs/Nhanes/2003-2004/BPX_C.XPT")

## download the lab measurement data for the cohort 2005-2006
# Total Cholesterol: LBXTC
dl_file("https://wwwn.cdc.gov/Nchs/Nhanes/2005-2006/TCHOL_D.XPT")
# HDL Cholesterol: LBDHDD
dl_file("https://wwwn.cdc.gov/Nchs/Nhanes/2005-2006/HDL_D.XPT")
# Blood Pressure, up to 4 measurements per person: BPXSY1 , BPXSY2, BPXSY3 and BPXSY4
dl_file("https://wwwn.cdc.gov/Nchs/Nhanes/2005-2006/BPX_D.XPT")


varnames <- c("LBXTC","LBXHDD","LBDHDD",           ## 1. cholesterol. Note LBXHDD and LBDHDD are the same variable, 
              ##    but different names for 2003-2004 and 2005-2006 cohorts
              "BPXSY1","BPXSY2","BPXSY3", "BPXSY4" ## 2. blood pressure measurements
)

## load and merge the lab data
lab_data <- process_covar(varnames=varnames,localpath=dir_tmp)

## change column name for cholesterol variable that changed names
colnames(lab_data$Covariate_C)[colnames(lab_data$Covariate_C) == "LBXHDD"] <- "LBDHDD"

## combine waves
CVMarkers <- bind_rows(lab_data$Covariate_C, lab_data$Covariate_D)

rm(list=c("lab_data","dir_tmp","varnames"))



# Load minute-level activity data and combine it with lab measurements, survey sampling data, and mortality data which are included in the rnhanesdata package.


## load the data
data("PAXINTEN_C");data("PAXINTEN_D") #processed physical activity data 2003-2004 and 2005-2006, respectively
data("Flags_C");data("Flags_D")
data("Mortality_2015_C");data("Mortality_2015_D")
data("Covariate_C");data("Covariate_D")

## re-code activity counts which are considered "non-wear" to be 0
## this doesn't impact many data points, most estimated non-wear times correspond to 0 counts
PAXINTEN_C[,paste0("MIN",1:1440)] <- PAXINTEN_C[,paste0("MIN",1:1440)]*Flags_C[,paste0("MIN",1:1440)]
PAXINTEN_D[,paste0("MIN",1:1440)] <- PAXINTEN_D[,paste0("MIN",1:1440)]*Flags_D[,paste0("MIN",1:1440)]

## Merge covariate, mortality, and accelerometry data
## note that both PAXINTEN_* and Covariate_* have a column
## called "SDDSRVYR" indicating which NHANES wave the data is associated with.
## To avoid duplicating this column in the merged data, we add this variable to the "by"
## argument in left_join()
AllAct_C <- left_join(PAXINTEN_C, Mortality_2015_C, by = "SEQN") %>%
  left_join(Covariate_C, by=c("SEQN", "SDDSRVYR"))
AllAct_D <- left_join(PAXINTEN_D, Mortality_2015_D, by = "SEQN") %>%
  left_join(Covariate_D, by=c("SEQN", "SDDSRVYR"))

AllFlags_C <- left_join(Flags_C, Mortality_2015_C, by = "SEQN") %>%
  left_join(Covariate_C, by=c("SEQN", "SDDSRVYR"))
AllFlags_D <- left_join(Flags_D, Mortality_2015_D, by = "SEQN") %>%
  left_join(Covariate_D, by=c("SEQN", "SDDSRVYR"))

## clean up the workspace for memory purposes
rm(list=c(paste0(c("PAXINTEN_", "Covariate_","Mortality_2015_","Flags_"),rep(LETTERS[3:4],each=4))))

## combine data for the two waves
AllAct   <- bind_rows(AllAct_C,AllAct_D)
AllFlags <- bind_rows(AllFlags_C,AllFlags_D)

#merge with cardiovascular markers 
AllAct <- left_join(AllAct, CVMarkers, by = "SEQN")
AllFlags <- left_join(AllFlags, CVMarkers, by = "SEQN")

## clean up the workspace again
rm(list=c("AllAct_C","AllAct_D","AllFlags_C","AllFlags_D","CVMarkers"))


# Variable descriptions can be found by calling accelerometry data help files
?PAXINTEN_C
?PAXINTEN_D

# Create new factor covariates from NHANES questionnaire, which will be used in the prediction model. 
# calculate average systolic blood pressure using the 4 measurements per participant.


## Code year 5 mortality, NAs for individuals with follow up less than 5 years and alive
AllAct$yr5_mort <- AllFlags$yr5_mort <- 
  as.integer(ifelse(AllAct$permth_exm/12 <= 5 & AllAct$mortstat5 == 1, 1,
                    ifelse(AllAct$permth_exm/12 < 5 & AllAct$mortstat5 == 0, NA, 0))
  )

AllAct$yr1_mort <- AllFlags$yr51_mort <- 
  as.integer(ifelse(AllAct$permth_exm/12 <= 1 & AllAct$mortstat == 1, 1,
                    ifelse(AllAct$permth_exm/12 < 1 & AllAct$mortstat == 0, NA, 0))
  )

## Create Age in years using the age at examination (i.e. when participants wore the device)
AllAct$Age <- AllFlags$Age <- AllAct$RIDAGEEX/12

## Re-level comorbidities to assign refused/don't know as not having the condition
## Note that in practice this does not affect many individuals, but it is an assumption we're making.
levels(AllAct$CHD)<- levels(AllFlags$CHD)<- list("No" = c("No","Refused","Don't know"), "Yes" = c("Yes"))
levels(AllAct$CHF)<- levels(AllFlags$CHF)<- list("No" = c("No","Refused","Don't know"), "Yes" = c("Yes"))
levels(AllAct$Stroke)<- levels(AllFlags$Stroke)<- list("No" = c("No","Refused","Don't know"), "Yes" = c("Yes"))
levels(AllAct$Cancer) <- levels(AllFlags$Cancer) <- list("No" = c("No","Refused","Don't know"), "Yes" = c("Yes"))
levels(AllAct$Diabetes) <- levels(AllFlags$Diabetes) <- list("No" = c("No","Borderline", "Refused","Don't know"), "Yes" = c("Yes"))


## Re-level education to have 3 levels and categorize don't know/refused to be missing
levels(AllAct$EducationAdult) <- levels(AllFlags$EducationAdult) <- list(
  "Less than high school" = c("Less than 9th grade", "9-11th grade"),
  "High school" = c("High school grad/GED or equivalent"),
  "More than high school" = c("Some College or AA degree", "College graduate or above"))

## Re-level alcohol consumption to include a level for "missing"
levels(AllAct$DrinkStatus) <- levels(AllFlags$DrinkStatus) <- c(levels(AllAct$DrinkStatus), 
                                                                "Missing alcohol")
AllAct$DrinkStatus[is.na(AllAct$DrinkStatus)] <- 
  AllFlags$DrinkStatus[is.na(AllAct$DrinkStatus)] <- "Missing alcohol"


# systolic blood pressure calculation 
AllAct$SYS <- AllFlags$SYS <-  round(apply(AllAct[,c("BPXSY1","BPXSY2","BPXSY3", "BPXSY4")],
                                           1,mean, na.rm= T))

## Re-order columns so that activity and wear/non-wear flags are the last 1440 columns of our two
## data matrices. This is a personal preference and is not necessary.
act_cols <- which(colnames(AllAct) %in% paste0("MIN",1:1440))
oth_cols <- which(!colnames(AllAct) %in% paste0("MIN",1:1440))
AllAct   <- AllAct[,c(oth_cols,act_cols)]
AllFlags <- AllFlags[,c(oth_cols,act_cols)]
rm(list=c("act_cols","oth_cols"))


# Calculate daily activity summary measures:
# Description of these activity related measures is available at: https://www.biorxiv.org/content/10.1101/182337v1

## Assign just the activity and wear/non-wear flag data to matrices.
## This makes computing the features faster but is technically required.
act_mat  <- as.matrix(AllAct[,paste0("MIN",1:1440)])
flag_mat <- as.matrix(AllFlags[,paste0("MIN",1:1440)])

## replace NAs with 0s
act_mat[is.na(act_mat)]   <- 0
flag_mat[is.na(flag_mat)] <- 0

#total activity count (TAC)
AllAct$TAC   <- AllFlags$TAC   <- rowSums(act_mat)
#total log activity count (TLAC)
AllAct$TLAC  <- AllFlags$TLAC  <- rowSums(log(1+act_mat))
#total accelerometer wear time (WT)
AllAct$WT    <- AllFlags$WT    <- rowSums(flag_mat)
#total sedentary  time (ST)
AllAct$ST    <- AllFlags$ST    <- rowSums(act_mat < 100)
#total   time spent in moderate to vigorous physical activity (MVPA)
AllAct$MVPA  <- AllFlags$MVPA  <- rowSums(act_mat >= 2020)

## calculate fragmentation measures
bout_mat <- apply(act_mat >= 100, 1, function(x){
  mat <- rle(x)
  sed <- mat$lengths[which(mat$values == FALSE)]  # sed stands for sedentary
  act <- mat$length[mat$values == TRUE]          # act stands for active
  
  sed <- ifelse(length(sed) == 0, NA, mean(sed))
  act <- ifelse(length(act) == 0, NA, mean(act))
  c(sed,act)
})

AllAct$SBout <- AllFlags$SBout <- bout_mat[1,]
AllAct$ABout <- AllFlags$ABout <- bout_mat[2,]
AllAct$SATP  <- AllFlags$SATP  <- 1/AllAct$SBout
AllAct$ASTP  <- AllFlags$ASTP  <- 1/AllAct$ABout



# compute total log activity count in each 2-hr window, 
# 2 hour (120 minutes) binning window 
tlen <- 120
nt   <- floor(1440/tlen)
# create a list of indices for binning into 2-hour windows
inx_col_ls <- split(1:1440, rep(1:nt,each=tlen))
Act_2hr    <- sapply(inx_col_ls, function(x) rowSums(log(1+act_mat[,x,drop=FALSE])))
colnames(Act_2hr) <- paste0("TLAC_",c(1:12))


AllAct   <- cbind(AllAct, Act_2hr)
AllFlags <- cbind(AllFlags, Act_2hr)

rm(list=c("tlen","nt","inx_col_ls","Act_2hr","act_mat","flag_mat","bout_mat"))


## make dataframe with one row per individual 
## Remove columns associated with activity to avoid any confusion.
table_dat <- AllAct[!duplicated(AllAct$SEQN),-which(colnames(AllAct) %in% c(paste0("MIN",1:1440),
                                                                            "TAC","TLAC","WT","ST","MVPA",
                                                                            "SBout","ABout","SATP","ASTP", paste0("TLAC_",1:12)))]
nparticipants <- dim(table_dat)[1]



## subset based on our age inclusion/exclusion criteria
## note that individuals age 85 and over are coded as NA
# number of individuals excluded due to subset selection
table_dat <- subset(table_dat, !(Age < 30 | is.na(Age)))
nage_excl <- nparticipants - dim(table_dat)[1]

## get the SEQN (id variable) associated with individuals with fewer than 3 days accelerometer wear time
## with at least 10 hours OR had their data quality/device calibration flagged by NHANES
keep_inx       <- exclude_accel(AllAct, AllFlags)
Act_Analysis   <- AllAct[keep_inx,]
Flags_Analysis <- AllFlags[keep_inx,]
nms_rm         <- unique(c(Act_Analysis$SEQN[-which(Act_Analysis$SEQN %in% names(table(Act_Analysis$SEQN))[table(Act_Analysis$SEQN)>=3])],
                           setdiff(AllAct$SEQN, Act_Analysis$SEQN))
)
rm(list=c("keep_inx"))


## Additional inclusion/exclusion criteria by Leroux
## Aside from mortality or accelerometer weartime, the only missingness is in
## BMI (35), Education (6), SYS (165), total cholesterol, LBXTC (152) and HDL cholesterol, LBDHDD (152).
#criteria_vec <- c("(is.na(table_dat$BMI_cat))",         # missing BMI
#                  "(is.na(table_dat$EducationAdult))",  # missing education
#                  "(table_dat$SEQN %in% nms_rm)",       # too few "good" days of accelerometery data
#                  "((!table_dat$eligstat %in% 1) | is.na(table_dat$mortstat) | is.na(table_dat$permth_exm) | table_dat$ucod_leading %in% \"004\")", # missing mortality data, or accidental death
#                  "(table_dat$mortstat == 0 & table_dat$permth_exm/12 < 5)", # less than 5 years of follow up with no mortality
#                  "(is.na(table_dat$SYS) | (is.na(table_dat$LBXTC)) | (is.na(table_dat$LBDHDD)) )" #missing lab measures
#)

criteria_vec <- c("(table_dat$SEQN %in% nms_rm)",       # too few "good" days of accelerometery data
                  "((!table_dat$eligstat %in% 1) | is.na(table_dat$mortstat) | is.na(table_dat$permth_exm) | table_dat$ucod_leading %in% \"004\")", # missing mortality data, or accidental death
                  "(table_dat$mortstat == 0 & table_dat$permth_exm/12 < 1)" # less than 1 year of follow up with no mortality
)

#(i) younger than 30 years old, or 85 and older at the time they wore the accelerometer (`r nage_excl` participants); 

#(iii) had fewer than 3 days of data with at least 10 hours of estimated wear time (`r tab_miss[3,3]` participants); 

#(iv) missing mortality information (`r tab_miss[4,4]` participants); 

#(v) alive with follow up less than 1 year 

## create matrix of pairwise missing data based on our exclusion criteria
tab_miss <- matrix(NA, ncol=length(criteria_vec), nrow=length(criteria_vec))
for(i in seq_along(criteria_vec)){
  for(j in seq_along(criteria_vec)){
    eval(parse(text=paste0("miss_cur <- which(", criteria_vec[i], "&", criteria_vec[j],")")))
    tab_miss[i,j] <- length(miss_cur)
    rm(list=c("miss_cur"))
  }
}
# names_spaced <- c("BMI","Education","Bad Accel Data","Mortality","Follow-up", "Lab")
names_spaced <- c("Bad Accel Data","Mortality","Follow-up")
rownames(tab_miss) <- colnames(tab_miss) <- names_spaced

## Create our dataset for analysis with one row per subject
## containing only those subjects who meet inclusion criteria.
data_analysis  <- subset(table_dat, Exclude == 0)
data_analysis  <- table_dat
## get adjusted survey weights using the reweight_accel function
data_analysis  <- reweight_accel(data_analysis)

## Get activity/flag data for only those included participants AND days.
## Since we've already removed the "bad" days from Act_Analysis and Act_Flags,
## we need only subset based on subject ID now
Act_Analysis   <- subset(Act_Analysis, SEQN %in% data_analysis$SEQN)
Flags_Analysis <- subset(Flags_Analysis, SEQN %in% data_analysis$SEQN)

# Calculate subject specific averages of the accelerometry features using only the "good" days of data.

## calculate subject specific averages of the accelerometry features
## using only the "good" days of data
act_var_nms <- c("TAC","TLAC","WT","ST","MVPA","ABout","SBout","SATP","ASTP", paste0("TLAC_",1:12))
for(i in act_var_nms){
  data_analysis[[i]] <- vapply(data_analysis$SEQN, function(x) mean(Act_Analysis[[i]][Act_Analysis$SEQN==x]), numeric(1))
}
## clean up the workspace
rm(list=c("AllAct","AllFlags","i","criteria_vec","nms_rm","tab_miss","act_var_nms"))



## save data for IDA project
names(data_analysis) <- make.names(casefold(names(data_analysis)), allow_=FALSE)

novars<-c("permth_int", "ucod_leading" ,"diabetes_mcod" , "hyperten_mcod" ,  "wtint2yr_unadj",
          "wtmec2yr_unadj" , "wtint2yr_unadj_norm", "wtmec2yr_unadj_norm", "wtint4yr_unadj", 
          "wtint4yr_unadj_norm", "wtmec4yr.adj", "wtmec4yr.adj.norm",
          "wtmec4yr_unadj" , "wtmec4yr_unadj_norm", "wtint2yr_adj" ,"wtint2yr_adj_norm",
          "wtmec2yr_adj" ,  "wtmec2yr_adj_norm",   "wtint4yr_adj" , "wtint4yr_adj_norm"  )
vars<-c(
  "seqn" , "paxcal" , "paxstat" ,"weekday", "sddsrvyr" , "eligstat", "mortstat",  "permth.exm",         
 "sdmvpsu" , "sdmvstra" , "wtint2yr", "wtmec2yr",  "ridagemn", "ridageex", "ridageyr",           
 "bmi", "bmi.cat" ,"race" ,"gender", "diabetes", "chf" ,"chd" , "cancer" , "stroke",             
 "educationadult" ,"mobilityproblem" , "drinkstatus", "drinksperweek",      
 "smokecigs" , "bpxsy1" , "bpxsy2" , "bpxsy3" , "bpxsy4" ,"lbxtc" , "lbdhdd",          
  "age" , "sys",  "tac" , "tlac", "wt", "st" , "mvpa", "about", "sbout" , "tlac.1" ,            
   "tlac.2" ,"tlac.3" ,"tlac.4" , "tlac.5",  "tlac.6" ,"tlac.7" ,"tlac.8" ,"tlac.9",             
  "tlac.10" ,"tlac.11" ,"tlac.12")

nhanesdat<-data_analysis[,vars]

indx<-which(nhanesdat$drinkstatus=='Missing alcohol')
nhanesdat$drinkstatus[indx]<-NA

nhanesdat <- nhanesdat %>% 
  mutate(mortstat = factor(mortstat, levels = 0:1, labels = c("alive", "dead")) )

indx<-which(is.na(nhanesdat$mvpa))
nhanesdat<-nhanesdat[-indx,]




## remove missing
a_nhanes <- nhanesdat %>% drop_na(tlac.1)

a_nhanes<-a_nhanes %>% 
  mutate(alcohol = ifelse(drinkstatus=="Missing alcohol", NA, drinkstatus))

cat(Hmisc::html(Hmisc::contents(nhanesdat)), file= "nhanesdat.html" )


setwd("~/Documents/TG3/IDA_Regression/github_nhanes")
save(a_nhanes, file="a_nhanes.rda")


setwd("~/Documents/TG3/IDA_Regression/Data")
save(nhanesdat, file="nhanesdat.rdata")

