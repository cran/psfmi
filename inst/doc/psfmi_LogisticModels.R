## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------

  library(psfmi)
  pool_lr <- psfmi_lr(data=lbpmilr, nimp=5, impvar="Impnr", Outcome="Chronic",
  predictors=c("Gender", "Smoking", "Function", "JobControl",
  "JobDemands", "SocialSupport"), method="D1")
  
  pool_lr$RR_model
 

## -----------------------------------------------------------------------------

  library(psfmi)
  pool_lr <- psfmi_lr(data=lbpmilr, nimp=5, impvar="Impnr", Outcome="Chronic",
  predictors=c("Gender", "Smoking", "Function", "JobControl",
  "JobDemands", "SocialSupport"), keep.predictors = "Smoking",
  p.crit = 0.05, method="D1", direction = "BW")
  
  pool_lr$RR_model_final
  
  pool_lr$predictors_out
  

## -----------------------------------------------------------------------------

  library(psfmi)
  pool_lr <- psfmi_lr(data=lbpmilr, nimp=5, impvar="Impnr", Outcome="Chronic",
  predictors=c("Gender", "Smoking", "Function", "JobControl",
  "JobDemands", "SocialSupport"), keep.predictors = "Smoking",
  p.crit = 0.05, method="MPR", direction = "BW")
  
  pool_lr$RR_model_final
  
  pool_lr$predictors_out
  

## -----------------------------------------------------------------------------

  library(psfmi)
  pool_lr <- psfmi_lr(data=lbpmilr, nimp=5, impvar="Impnr", Outcome="Chronic",
  predictors=c("Gender", "Smoking", "Function", "JobControl"), 
  p.crit = 0.05, cat.predictors = c("Carrying", "Satisfaction"),
  int.predictors = c("Carrying:Smoking", "Gender:Smoking"), method="D2", direction = "BW")
  
  pool_lr$RR_model_final
  
  pool_lr$predictors_out
  

## -----------------------------------------------------------------------------

  library(psfmi)
  pool_lr <- psfmi_lr(data=lbpmilr, nimp=5, impvar="Impnr", Outcome="Chronic",
  predictors=c("Gender", "Smoking", "Function", "JobControl"), 
  p.crit = 0.157, cat.predictors = c("Carrying", "Satisfaction"),
  int.predictors = c("Carrying*Smoking", "Gender*Smoking"),
  keep.predictors = c("Smoking*Carrying", "JobControl"), method="D1", direction = "FW")
  
  pool_lr$RR_model_final
  
  pool_lr$predictors_in
  

## -----------------------------------------------------------------------------

  library(psfmi)
  pool_lr <- psfmi_lr(data=lbpmilr, nimp=5, impvar="Impnr", Outcome="Chronic",
  predictors=c("Gender", "Smoking", "JobControl"), 
  p.crit = 0.157, cat.predictors = c("Carrying", "Satisfaction"),
  spline.predictors=c("Function"), int.predictors = c("Carrying:Smoking"), 
  nknots=3, method="D1", direction = "BW")
  
  pool_lr$RR_model_final
  
  pool_lr$predictors_out


