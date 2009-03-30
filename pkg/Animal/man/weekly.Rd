\name{weekly}
\alias{weekly}
\title{Calculate weekly values from time series}
\description{
Calculate weekly values (e.g mean or sum) from time series data. Allows
to specify a subject to calculate weekly values for several subjects.
}

\usage{
weekly(data, time, fun = sum, subject = NULL)
}

\arguments{
  \item{data}{A data vector that you want to calculate the weekly values
  for}
  \item{time}{Time stamps for data in POSIXct format}
  \item{fun}{The function to apply, defaults to sum}
  \item{subject}{You can optionally specify to a subject. e.g. to get
    weekly values for each cow in a herd.}
}

\value{
  A data.frame with following elements
  \item{Week}{Week number}
  \item{Subject}{Appears only if you have specified a subject}
  \item{Result}{The result of the function}
  
}

\author{Matti Pastell <matti.pastell@helsinki.fi>}

\seealso{\code{\link{daily}}, \code{\link{hourly}},
   \code{\link{monthly}}}

\examples{
data(RIC)
RIC2 <- clean.RIC(RIC)
#Weekly feed intake of a whole from data set RIC
herd <- weekly(RIC2$intake,time=RIC2$begin,fun=sum)
#Weekly feed intake of individual cows from data set RIC
herd <- weekly(RIC2$intake,time=RIC2$begin,fun=sum,subject=RIC2$cowID)
}
