\name{week}
\alias{week}
\title{Convert dates to week numbers}
\description{
This function extracts the week number from date objects}
\arguments{
  \item{x}{A POSIXt object}
}

\value{
  \item{week}{Week number of the input object}
}

\author{Matti Pastell <matti.pastell@helsinki.fi>}


\seealso{\code{\link{day}}, \code{\link{day.string}},
   \code{\link{hour}}, \code{\link{month}}}
\examples{
date <- Sys.time()
week.number <- week(date)
print(week.number)
}

