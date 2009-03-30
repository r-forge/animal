\name{month}
\alias{month}
\title{Convert dates to month numbers}
\description{
This function extracts the day of month from date objects}
\arguments{
  \item{x}{A POSIXt object}
}

\value{
  \item{month}{Month number of the input object}
}

\author{Matti Pastell <matti.pastell@helsinki.fi>}


\seealso{\code{\link{day}}, \code{\link{day.string}},
   \code{\link{hour}},\code{\link{week}}}
\examples{
date <- Sys.time()
month.number <- month(date)
print(month)
}

