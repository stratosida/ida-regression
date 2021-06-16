pseudo_log <- function(x, sigma=1, base=10)  asinh(x/(2 * sigma))/log(base)
inv_pseudo_log <- function(x, sigma=1, base=10) 2 * sigma * sinh(x * log(base))

# equ.marg: how much better a correlation with normal deviates has to be than the original variable
#           to avoid only slight improvements

ida_trans<-function(x, equ.marg=0.05){
  cornorm<-function(X, qn){
    return(cor(X,qn))
  }
  
  x<-x[complete.cases(x)]
  if(length(x)>5000) x<-sample(x, size=5000, replace=FALSE)
  
  xr <- rank(x)/(length(x)+1)
  qn<-qnorm(xr,0,1)
  
  cn.orig<-cornorm(x, qn)
  
  
  
  if(min(x, na.rm=T)>0) interval=c(0,max(x))
  else interval=c(min(x[x>0]), max(x))
  
  topt<-optimize(f=function(const) 1-cornorm(X=pseudo_log(x, sigma=const), qn=qn), interval=interval, tol=0.05)
  
  if(topt$objective>(1-cn.orig-equ.marg)) {
    #cat("Original distribution better than any log.\n")
    res<-list(const=NA, fun=function(x) x)
  } else {
    res<-list(const=topt$minimum, fun=function(x) log(x))
  } 
  return(res)
}

