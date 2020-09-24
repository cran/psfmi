## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------

  library(psfmi)
  psfmi_res <- psfmi_lr(data=lbpmilr, nimp=5, impvar="Impnr", Outcome="Chronic",
                      predictors=c("Gender", "Smoking", "JobControl", "Age", "Duration",
                         "JobDemands", "SocialSupport"), p.crit =0.157, method="MPR",
                      cat.predictors = "Satisfaction", int.predictors = c("Gender:JobControl"),
                      direction = "BW")

   stab_res <- psfmi_stab(psfmi_res, direction="FW", start_model = TRUE,
      boot_method = "single", nboot=20, p.crit=0.05)
  
   stab_res$bif
   
  stab_res$bif_perc
  
  stab_res$model_stab
  


## -----------------------------------------------------------------------------

  library(psfmi)
  pool_lr <- psfmi_coxr(formula = Surv(Time, Status) ~ Pain + factor(Satisfaction) + rcs(Tampascale,3) +
                        Radiation + Radiation*factor(Satisfaction) + Age + Duration + Previous +
                        Radiation*rcs(Tampascale, 3), data=lbpmicox, p.crit = 0.157, direction="FW",
                        nimp=5, impvar="Impnr", keep.predictors = NULL, method="D1")
  pool_lr$RR_Model
  pool_lr$multiparm

  stab_res <- psfmi_stab(pool_lr, direction="FW", start_model = TRUE,
      boot_method = "single", nboot=20, p.crit=0.05)
  
  stab_res$bif
  
  stab_res$bif_perc
  
  stab_res$model_stab


