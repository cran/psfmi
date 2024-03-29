#' Nagelkerke's R-square calculation for logistic regression / glm models
#'
#' @param fitobj a logistic regression model object of "glm"   
#' 
#' @return The value for the explained variance.
#' @seealso \code{\link{psfmi_perform}}, \code{\link{pool_performance}}
#' @author Martijn Heymans, 2020
#'   
#' @export   
rsq_nagel <- function(fitobj){
  f.full <-
    -2 * logLik(fitobj)
  f.base <-
    -2 * logLik(glm(fitobj$y ~ 1, family = binomial))
  n <-
    fitobj$df.null
  rsq.nagel <-
    c((1 - exp((f.full - f.base)/n))/
        (1 - exp(-f.base/n)))[1]
  return(rsq.nagel)
}

