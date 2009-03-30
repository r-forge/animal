\name{monthly}
\alias{monthly}
\title{Calculate monthly values from time series}
\description{
Calculate monthly values (e.g mean or sum) from time series data. Allows
to specify a subject to calculate monthly values for several subjects.
}
\usage{
monthly(data, time, fun = sum, subject = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{A data vector that you want to calculate the monthly values
  for}
  \item{time}{Time stamps for data in POSIXct format}
  \item{fun}{The function to apply, defaults to sum}
  \item{subject}{You can optionally specify to a subject. e.g. to get
    monthly values for each cow in a herd.}
}

\value{
  A data.frame with following elements
  \item{Day}{Date}
  \item{Subject}{Appears only if you have specified a subject}
  \item{Result}{The result of the function}
  
}

\author{Matti Pastell <matti.pastell@helsinki.fi>}

\seealso{\code{\link{monthly}}, \code{\link{hourly}},
   \code{\link{weekly}}}

\examples{
data(RIC)
RIC2 <- clean.RIC(RIC)
#Monthly feed intake of a whole from data set RIC
herd <- monthly(RIC2$intake,time=RIC2$begin,fun=sum)
#Monthly feed intake of individual cows from data set RIC
herd <- monthly(RIC2$intake,time=RIC2$begin,fun=sum,subject=RIC2$cowID)
}
