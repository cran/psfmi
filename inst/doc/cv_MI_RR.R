## ---- echo = FALSE, fig.cap="Schematic overview of the cv_MI_RR method", out.width='100%', fig.align='center'----
knitr::include_graphics("cv_mi_RR.png")

## -----------------------------------------------------------------------------

library(psfmi)
pool_lr <- psfmi_lr(data=lbpmilr, formula = Chronic ~ Pain + JobDemands + rcs(Tampascale, 3) +
                   factor(Satisfaction) + Smoking, p.crit = 1, direction="BW",
                   nimp=5, impvar="Impnr", method="D1")

set.seed(200)
res_cv <- psfmi_perform(pool_lr, val_method = "cv_MI_RR", data_orig = lbp_orig, folds = 3,
                     p.crit=1, BW=FALSE,  nimp_mice = 5, miceImp = miceImp, printFlag = FALSE)

res_cv

  

## -----------------------------------------------------------------------------

library(psfmi)
pool_lr <- psfmi_lr(data=lbpmilr, formula = Chronic ~ Pain + JobDemands + rcs(Tampascale, 3) +
                   factor(Satisfaction) + Smoking, p.crit = 1, direction="BW",
                   nimp=5, impvar="Impnr", method="D1")

set.seed(200)
res_cv <- psfmi_perform(pool_lr, val_method = "cv_MI_RR", data_orig = lbp_orig, folds = 3,
                     p.crit=0.05, BW=TRUE, nimp_mice = 5, miceImp = miceImp, printFlag = FALSE)

res_cv

  

