## ---- include = FALSE, message = FALSE----------------------------------------
library(knitr)
opts_chunk$set(tidy = FALSE, cache = FALSE)
library(mice)
library(psfmi)

## -----------------------------------------------------------------------------

  imp <- mice(lbp_orig, m=5, maxit=10, seed = 750) 
  

## -----------------------------------------------------------------------------
  data_comp <- complete(imp, action = "long", include = FALSE)

## -----------------------------------------------------------------------------

  pool_lr <- psfmi_lr(data=data_comp, nimp=5, impvar=".imp", Outcome="Chronic",
  predictors=c("Gender", "Age", "JobControl", "Tampascale", "Pain", "Radiation",
  "JobDemands", "SocialSupport", "Smoking"), cat.predictors = c("Satisfaction", "Carrying"), 
  spline.predictors = "Function", nknots = 3,  
  keep.predictors = "Radiation", p.crit = 0.157, method="D1", direction = "BW")
  
  pool_lr$RR_model_final
  
  pool_lr$multiparm_final


## -----------------------------------------------------------------------------

  pool_lr <- psfmi_lr(data=data_comp, nimp=5, impvar=".imp", 
  formula = Chronic ~ Gender + Age + JobControl + Tampascale + Pain + Radiation +
    JobDemands + SocialSupport + Smoking + factor(Satisfaction) + factor(Carrying) + 
  rcs(Function, 3), keep.predictors = "Radiation", 
  p.crit = 0.157, method="D1", direction = "BW")
  
  pool_lr$RR_model_final
  
  pool_lr$multiparm_final


## ----plot, fig.height = 3, fig.width = 5--------------------------------------

  pool_select <- psfmi_lr(data=data_comp, nimp=5, impvar=".imp", 
  formula = Chronic ~ Pain + Radiation + factor(Satisfaction) + factor(Carrying),  
  p.crit = 1, method="D1")
  
  perf <- pool_performance(data=data_comp, nimp=5, impvar=".imp", 
  Outcome = "Chronic", predictors = c("Pain", "Radiation", "factor(Satisfaction)",
             "factor(Carrying)"), cal.plot=TRUE, plot.indiv=FALSE, groups_cal = 10)
  perf


## -----------------------------------------------------------------------------

  pool_val <- psfmi_lr(data=data_comp, formula = Chronic ~ Gender + Age + JobControl + Tampascale + 
                      Pain + Radiation + JobDemands + SocialSupport + Smoking + factor(Satisfaction) + 
                      factor(Carrying) + rcs(Function, 3), p.crit = 1, direction="BW",
                      nimp=5, impvar=".imp", method="D1")

  set.seed(200)
  res_cv <- psfmi_perform(pool_val, val_method = "cv_MI_RR", data_orig = lbp_orig, folds = 5,
                     p.crit=0.05, BW=TRUE, nimp_mice = 10, miceImp = miceImp, printFlag = FALSE)

  res_cv


## -----------------------------------------------------------------------------

  pool_select <- psfmi_lr(data=data_comp, nimp=5, impvar=".imp", 
  formula = Chronic ~ Pain + Radiation + factor(Satisfaction) + factor(Carrying),  
  p.crit = 1, method="D1")

  res <- pool_intadj(pool_select, shrinkage_factor = 0.8449148)

  res$int_adj
  res$coef_shrink_pooled


## ----plot2, fig.height = 3, fig.width = 5-------------------------------------

  res_extval <- mivalext_lr(data.val = lbpmi_extval, nimp = 5, impvar = "Impnr",
  Outcome = "Chronic", predictors = pool_lr$predictors_final,
  lp.orig = c(res$int_adj, res$coef_shrink_pooled),
  cal.plot = TRUE)
 
  res_extval$ROC
 
  res_extval$R2_fixed
 
  res_extval$HLtest
 
  res_extval$LP_pooled_ext
 

