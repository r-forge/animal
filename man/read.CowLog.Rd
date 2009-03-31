\name{read.CowLog}
\alias{read.CowLog}
\title{Read CowLog datafiles}
\description{
Read in CowLog datafiles. The user can specify the start time of the
observation in order to convert observation time to a date format (POSIXct)
}
\usage{
read.CowLog(file, start.time = NULL, delete.duplicates = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{A CowLog data file}
  \item{start.time}{The start time of the observation in "\%Y-\%m-\%d
    \%H:\%M:\%S" format. (see strptime).}
  \item{delete.duplicates}{Delete duplicate (double state errors) observations, T or F}
}


\value{
A data frame with the elements:
  \item{time}{Time stamp for the code}
  \item{behavior}{Behavior for the corresponding time}

}


\references{  Hanninen, L. & Pastell, M. CowLog: Open source software for coding
  behaviors from digital video. Behavior Research Methods. 41(2),
  472-476.
  
  \url{http://www.mm.helsinki.fi/~mpastell/CowLog}
}

\author{Matti Pastell <matti.pastell@helsinki.fi>}

\seealso{\code{\link{cowAnalyze}}, \code{\link{label.data}}}

