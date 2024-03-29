% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pool_intadj.R
\name{pool_intadj}
\alias{pool_intadj}
\title{Provides pooled adjusted intercept after shrinkage of pooled coefficients 
 in multiply imputed datasets}
\usage{
pool_intadj(pobj, shrinkage_factor)
}
\arguments{
\item{pobj}{An object of class \code{smodsmi} (selected models in multiply imputed datasets), 
produced by a previous call to \code{psfmi_lr}.}

\item{shrinkage_factor}{A numerical scalar. Shrinkage factor value as a result of internal validation
with the \code{psfmi_perform} function.}
}
\value{
A \code{pool_intadj} object from which the following objects can be extracted: \code{int_adj}, 
  the adjusted intercept value, \code{coef_shrink_pooled}, the pooled regression coefficients 
  after shrinkage, \code{coef_orig_pooled}, the (original) pooled regression coefficients before
  shrinkage and \code{nimp}, the number of imputed datasets.
}
\description{
\code{pool_intadj} Provides pooled adjusted intercept after shrinkage of the pooled coefficients 
 in multiply imputed datasets for models selected with the \code{psfmi_lr} function and 
 internally validated with the \code{psfmi_perform} function.
}
\details{
The function provides the pooled adjusted intercept after shrinkage of pooled
  regression coefficients in multiply imputed datasets. The function is only available 
  for logistic regression models without random effects.
}
\examples{
 res_psfmi <- psfmi_lr(data=lbpmilr, nimp=5, impvar="Impnr", Outcome="Chronic",
           predictors=c("Gender", "Pain","Tampascale","Smoking","Function", 
           "Radiation", "Age"), p.crit = 1, method="D1", direction="BW")
 res_psfmi$RR_Model

\dontrun{
 set.seed(100)
 res_val <- psfmi_perform(res_psfmi, method = "MI_boot", nboot=10, 
   int_val = TRUE, p.crit=1, cal.plot=FALSE, plot.indiv=FALSE)
 res_val$intval

 res <- pool_intadj(res_psfmi, shrinkage_factor = 0.9774058)
 res$int_adj
 res$coef_shrink_pooled
 } 
  
}
\references{
F. Harrell. Regression Modeling Strategies. With Applications to
  Linear Models, Logistic and Ordinal Regression, and Survival Analysis (2nd edition). Springer,
  New York, NY, 2015.

EW. Steyerberg (2019). Clinical Prediction MOdels. A Practical Approach 
 to Development, Validation, and Updating (2nd edition). Springer Nature Switzerland AG.

http://missingdatasolutions.rbind.io/
}
