\name{read.RIC}
\alias{read.RIC}
\title{Read RIC feed measurement system log files}
\description{
Reads in roughage intake log files produced by the Insentec
RIC-Management Windows software. (VRyymmdd.DAT) The function converts
the start and end times to POSIXct  objects and adds the date to each
time stamp from the file name.
}
\usage{
read.RIC(file, clean = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{The roughage intake log file, (VRyymmdd.DAT)}
  \item{clean}{If true the function removes lines with Cow number 0 and
    lines with negative feed intake and visits with 0 duration.
    Values TRUE of FALSE, Defaults to TRUE}
}

\value{
A data.frame with the formatted insentec data.
}
\references{B.V. Marknesse. Instructions for use. RIC - MANAGEMENT WINDOWS version
  RW:1.7. English. Insentec}

\author{Matti Pastell <matti.pastell@helsinki.fi>}
\seealso{\code{\link{clean.RIC}}, \code{\link{bouts.RIC}}}
\examples{
\dontrun{data <- read.RIC('VR080811.DAT')}
}


