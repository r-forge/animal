\name{partOfDay}
\alias{partOfDay}
\title{Code data into different parts of day}
\description{This function returns the part of day
  from time stamps. The day can be split into parts of different length
  with a chosen start time for the splits.}
\usage{
partOfDay(time, nsplit = 4, start = 1)
}

\arguments{
  \item{time}{Timestamp vector in POSIXct format}
  \item{nsplit}{Number of splits.}
  \item{start}{Start time of the split in hours (1-24)}
}
\details{
It is often useful to observe the amount of behaviors during different
  part of day e.g. if we want to find out how different behaviours are
  distributed over the entire day. This function returns the part of day
  from time stamps. The function returns only even hours, if nsplit
  provides intervals with decimal hours they will be rounded to
  nearest integer.
}
\value{
A factor with the part of day for input timestamps with hour intervals
  as labels-
}

\author{Matti Pastell <matti.pastell@helsinki.fi>}

\seealso{\code{\link{hour}}, \code{\link{hourly}}}

\examples{
#Look at the daily distribution of feed intake of cows
#in dataset RIC
data(RIC)
data <- clean.RIC(RIC)
#With default split
data$period <- partOfDay(data$begin)
#Plot the results
boxplot(intake~period,data=data,ylab='Feed intake (kg)',
xlab='Time of day',main='Default settings: start =1, nsplit=4')
#A different split with directly plotting the result
boxplot(intake~partOfDay(begin,nsplit=6,start=3),data=data,
ylab='Feed intake (kg)',xlab='Time of day',main='start=3,nsplit=6')
}


