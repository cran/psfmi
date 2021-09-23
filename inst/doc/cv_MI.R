## ---- echo = FALSE, fig.cap="Schematic overview of the cv_MI method", out.width='100%', fig.align='center'----
knitr::include_graphics("cv_MI.png")

## -----------------------------------------------------------------------------

library(psfmi)
pool_lr <- psfmi_lr(data=lbpmilr, formula = Chronic ~ rcs(Pain, 3) + JobDemands + Tampascale +
             factor(Satisfaction) + Smoking + factor(Satisfaction)*rcs(Pain, 3) ,
             p.crit = 0.05, direction="BW", nimp=5, impvar="Impnr",
             method="D1")

set.seed(200)
res_cv <- psfmi_validate(pool_lr, val_method = "cv_MI", data_orig = lbp_orig, folds = 5,
                     p.crit=1, BW=FALSE,  nimp_cv = 3, miceImp = miceImp, printFlag = FALSE)

res_cv


## -----------------------------------------------------------------------------

library(psfmi)
pool_lr <- psfmi_lr(data=lbpmilr, formula = Chronic ~ rcs(Pain, 3) + JobDemands + Tampascale +
             factor(Satisfaction) + Smoking + factor(Satisfaction)*rcs(Pain, 3) ,
             p.crit = 0.05, direction="BW", nimp=5, impvar="Impnr",
             method="D1")

set.seed(200)
res_cv <- psfmi_validate(pool_lr, val_method = "cv_MI", data_orig = lbp_orig, folds = 5,
                     p.crit=0.05, BW=TRUE,  nimp_cv = 3, miceImp = miceImp, printFlag = FALSE)

res_cv


