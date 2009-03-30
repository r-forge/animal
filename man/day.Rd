\name{day}
\alias{day}
\title{Convert dates to day numbers}
\description{
This function extracts the day of month from date objects}
\arguments{
  \item{x}{A POSIXt object}
}

\value{
  \item{day}{Day of month for the input object}
}

\author{Matti Pastell <matti.pastell@helsinki.fi>}


\seealso{\code{\link{week}}, \code{\link{day.string}},
   \code{\link{hour}}, \code{\link{month}}}
\examples{
date <- Sys.time()
day.number <- day(date)
print(day.number)
}

