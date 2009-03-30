\name{clean.RIC}
\alias{clean.RIC}
\title{Clean RIC roughage intake log file}
\description{
  Performs the following clean ups on RIC roughage intake files:
  Removes lines with Cow number 0 and lines with negative feed intake
  and visits with 0 duration. Equal using clean=T with read.RIC.
}
\usage{
clean.RIC(data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{A data.frame read in with read.RIC}
}

\value{
Cleaned data.frame
}
\author{Matti Pastell <matti.pastell@helsinki.fi>}
\seealso{\code{\link{read.RIC}}, \code{\link{bouts.RIC}}}

\examples{
data(RIC)
cleaned.data <- clean.RIC(RIC)
}

