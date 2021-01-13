## ---- echo = FALSE, fig.cap="Schematic overview of the boot_MI method", out.width='100%', fig.align='center'----
knitr::include_graphics("boot_MI.png")


## -----------------------------------------------------------------------------

library(psfmi)
pool_lr <- psfmi_lr(data=lbpmilr, formula = Chronic ~ Pain + JobDemands + rcs(Tampascale, 3) +
                   factor(Satisfaction) + Smoking, p.crit = 1, direction="FW",
                 nimp=5, impvar="Impnr", method="D1")

set.seed(100)
res_MI_boot <- psfmi_perform(pool_lr, val_method = "boot_MI", data_orig = lbp_orig, nboot = 5,
                     p.crit=1, nimp_mice = 3, direction = "BW", miceImp = miceImp,
                     printFlag = FALSE)

res_MI_boot
  

## -----------------------------------------------------------------------------

library(psfmi)
pool_lr <- psfmi_lr(data=lbpmilr, Outcome="Chronic", predictors = c("Pain", "JobDemands", "Smoking"), 
                   cat.predictors = "Satisfaction", spline.predictors = "Tampascale", nknots=3,
                   p.crit = 1, direction="FW", nimp=5, impvar="Impnr", method="D1")

set.seed(100)
res_MI_boot <- psfmi_perform(pool_lr, val_method = "boot_MI", data_orig = lbp_orig, nboot = 5,
                     p.crit=0.05, nimp_mice = 3, direction = "BW", miceImp = miceImp,
                     printFlag = FALSE)

res_MI_boot


