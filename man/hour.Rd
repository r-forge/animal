\name{hour}
\alias{hour}
\title{Convert times to hours}
\description{
This function extracts the hour from date objects}
\arguments{
  \item{x}{A POSIXt object}
}

\value{
  \item{hour}{Hour (1-24) of the input object}
}

\author{Matti Pastell <matti.pastell@helsinki.fi>}


\seealso{\code{\link{day}}, \code{\link{day.string}},
   \code{\link{week}}, \code{\link{month}}}
\examples{
date <- Sys.time()
hour.number <- hour(date)
print(hour.number)
}

