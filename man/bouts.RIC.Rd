\name{bouts.RIC}
\alias{bouts.RIC}
\title{Merge bouts from RIC roughage intake files}
\description{
Merges single visits from roughage intake log file if the time
difference between successive visits is less than specified time
difference i.e merges multiple rows in the log file that are considered
to be a single feeding bout to a single row. 
}
\usage{
bouts.RIC(data, bout.diff = 5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{A data.frame read in with read.RIC, with clean=T option}
  \item{bout.diff}{The maximum time difference (in minutes) between visits in a
    single bout}
}
\value{
  A data.frame with the values merged for individual bouts. All other
  objects are self.explanatory, but there are two that need further
  clarification  
  \item{bout.duration}{This is the duration in minutes of the merged bout
    i.e. begin-end for the bout.}
  \item{intake.duration}{This is the time in minutes that the cow has kept her head
  in the feeding trough during the bout. You may want to use this for
  calculating feeding speed (kg/min)}
}
\author{Matti Pastell <matti.pastell@helsinki.fi>}

\note{The function is currently only implemented for merging feeding
  time and intake, thus protein, ash etc. are dropped from the resulting
  datafrane. The variables in the code are finnish and thus maybe difficult to
  follow. An english translation will (possibly) appear in the future.}

\seealso{\code{\link{read.RIC}}, \code{\link{clean.RIC}}}

\examples{
data(RIC)
cleaned.data <- clean.RIC(RIC)
bouts <- bouts.RIC(cleaned.data)
#With 8 minutes bout difference
bouts <- bouts.RIC(cleaned.data,bout.diff=8)
}

