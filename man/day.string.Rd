\name{day.string}
\alias{day.string}
\title{Convert dates to string}
\description{
This function converts POSIXt dates to a string reprentation of the
date. The string format is convenient when calculating daily summaries etc.
}
\usage{
day.string(x)
}

\arguments{
  \item{x}{A POSIXt object}
}
\details{
}
\value{
Day in string format.
}


\author{Matti Pastell <matti.pastell@helsinki.fi>}


\seealso{\code{\link{day}}, \code{\link{hour}},
   \code{\link{week}}, \code{\link{month}}}
\examples{
date <- Sys.time()
day.str <- day.string(date)
print(day.str)
}
