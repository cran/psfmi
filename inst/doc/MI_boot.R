## ---- echo = FALSE, fig.cap="Schematic overview of the boot_MI method", out.width='100%', fig.align='center'----
knitr::include_graphics("MI_boot.png")


## -----------------------------------------------------------------------------

library(psfmi)
pool_lr <- psfmi_lr(data=lbpmilr, formula = Chronic ~ Pain + JobDemands + rcs(Tampascale, 3) +
                   factor(Satisfaction) + Smoking, p.crit = 1, direction="FW",
                 nimp=5, impvar="Impnr", method="D1")

set.seed(200)
res <- psfmi_validate(pool_lr, val_method = "MI_boot", nboot = 5, p.crit=1)
res

  

## -----------------------------------------------------------------------------

library(psfmi)
pool_lr <- psfmi_lr(data=lbpmilr, formula = Chronic ~ Pain + JobDemands + rcs(Tampascale, 3) +
                   factor(Satisfaction) + Smoking, p.crit = 1, direction="FW",
                 nimp=5, impvar="Impnr", method="D1")

set.seed(200)
res <- psfmi_validate(pool_lr, val_method = "MI_boot", nboot = 5, p.crit=0.05, direction = "BW")
res


