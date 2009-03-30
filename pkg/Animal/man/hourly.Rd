\name{hourly}
\alias{hourly}
\title{Calculate hourly values from time series}
\description{
Calculate hourly values (e.g mean or sum) from time series data. Allows
to specify a subject to calculate hourly values for several subjects.
}
\usage{
hourly(data, time, fun = sum, subject = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{A data vector that you want to calculate the hourly values
  for}
  \item{time}{Time stamps for data in POSIXct format}
  \item{fun}{The function to apply, defaults to sum}
  \item{subject}{You can optionally specify to a subject. e.g. to get
    hourly values for each cow in a herd.}
}

\value{
  A data.frame with following elements
  \item{Hour}{Hour 1-24}
  \item{Subject}{Appears only if you have specified a subject}
  \item{Result}{The result of the function}
  
}

\author{Matti Pastell <matti.pastell@helsinki.fi>}

\seealso{\code{\link{daily}}, \code{\link{weekly}},
   \code{\link{monthly}}}

\examples{
data(RIC)
RIC2 <- clean.RIC(RIC)
#Hourly feed intake of a whole from data set RIC
herd <- hourly(RIC2$intake,time=RIC2$begin,fun=sum)
#Hourly feed intake of individual cows from data set RIC
herd <- hourly(RIC2$intake,time=RIC2$begin,fun=sum,subject=RIC2$cowID)
}
