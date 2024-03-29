% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cv_MI.R
\name{cv_MI}
\alias{cv_MI}
\title{Cross-validation in Multiply Imputed datasets}
\usage{
cv_MI(pobj, data_orig, folds, nimp_cv, BW, p.crit, miceImp, ...)
}
\arguments{
\item{pobj}{An object of class \code{pmods} (pooled models), produced by a previous
call to \code{psfmi_lr}.}

\item{data_orig}{dataframe of original dataset that contains missing data.}

\item{folds}{The number of folds, default is 3.}

\item{nimp_cv}{Numerical scalar. Number of (multiple) imputation runs.}

\item{BW}{If TRUE backward selection is conducted within cross-validation. Default is FALSE.}

\item{p.crit}{A numerical scalar. P-value selection criterium used for backward during
cross-validation. When set at 1, pooling and internal validation is done without
backward selection.}

\item{miceImp}{Wrapper function around the \code{mice} function.}

\item{...}{Arguments as predictorMatrix, seed, maxit, etc that can be adjusted for
the \code{mice} function.}
}
\description{
\code{cv_MI} Cross-validation by applying multiple single imputation runs in train
 and test folds. Called by function \code{psfmi_perform}.
}
\seealso{
\code{\link{psfmi_perform}}
}
\author{
Martijn Heymans, 2020
}
\keyword{internal}
