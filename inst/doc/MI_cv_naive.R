## ---- echo = FALSE, fig.cap="Schematic overview of the MI_cv_naive method", out.width='100%', fig.align='center'----
knitr::include_graphics("MI_cv_naive.png")


## -----------------------------------------------------------------------------

library(psfmi)
pool_lr <- psfmi_lr(data=lbpmilr, formula = Chronic ~ Pain + JobDemands + rcs(Tampascale, 3) +
                   factor(Satisfaction) + Smoking, p.crit = 1, direction="BW",
                   nimp=5, impvar="Impnr", method="D1")

set.seed(100)
res_cv <- psfmi_validate(pool_lr, val_method = "MI_cv_naive", folds = 5,
                     p.crit=1, BW=FALSE)
res_cv


## -----------------------------------------------------------------------------

library(psfmi)
pool_lr <- psfmi_lr(data=lbpmilr, formula = Chronic ~ Pain + JobDemands + rcs(Tampascale, 3) +
                   factor(Satisfaction) + Smoking, p.crit = 1, direction="BW",
                   nimp=5, impvar="Impnr", method="D1")

set.seed(100)
res_cv <- psfmi_validate(pool_lr, val_method = "MI_cv_naive", folds = 5,
                     p.crit=0.05, BW=TRUE)
res_cv

  

