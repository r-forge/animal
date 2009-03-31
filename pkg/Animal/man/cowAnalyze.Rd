\name{cowAnalyze}
\alias{cowAnalyze}
\title{Analyze time coded behavior data}
\description{
This function provides descriptive statistics from time coded behavior
datafiles recorded with CowLog.
}
\usage{
cowAnalyze(file = NULL, states = NULL, events = NULL,
 state.names = NULL, event.names = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{CowLog data file, or a file in same format}
  \item{states}{A vector with the codes in the file that belong to states}
  \item{events}{A vector with codes in the file that belong to events}
  \item{state.names}{A character vector with the names for the states }
  \item{event.names}{A character vector with the names for the events}
}

\value{
  \item{state}{Results for states}
  \item{event}{Results for events}
}

\references{  Hanninen, L. & Pastell, M. CowLog: Open source software for coding
  behaviors from digital video. Behavior Research Methods. 41(2),
  472-476.
  
\url{http://www.mm.helsinki.fi/~mpastell/CowLog}
}

\author{Matti Pastell <matti.pastell@helsinki.fi>}



\examples{
##Analyze CowLog datafile named calf1.bh1,
## codes 1-3 are states and codes 4-5 are states.
## The names for the states are lying, standing, walking.
\dontrun{analyzed <-cowAnalyze(file='calf1.bh1',states=c(1,2,3),
events=c(4,5),state.names=c('lying','standing','walking'))}
 
}
