\name{label.data}
\alias{label.data}
\title{Label measurement data}
\description{
This function labels measurement data according to behavioral
observations. The format of behavioral observations follows CowLog
convention (See details).
}
\usage{
label.data(data, observation, db = 5, de = 5, min.length = 20)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{A data.frame holding the measurement data, one of the
    elements needs to be named time and hold the time stamp for each row.}
  \item{observation}{A data.frame with behavioral observations, one of
    the elements needs to be named time and hold the time stamps for the
  behaviors and another named behavior and hold the labels for
  respective behaviors. See details.}
  \item{db}{Specifies the delay in seconds from the observation to the start of
    labeling, this is sometimes useful if the data is used for model
    building and we want to eliminate the temporal inaccury due to
    behavioral observations. Defaults to 5} 
  \item{de}{Similarly to db, specifies the (negative) delay in seconds
    from the end of observation. Defaults to 5}
  \item{min.length}{descibes the minimum length of
    the labeled data vector. Again sometimes we want to have long enough
  data vectors for model building and leave out too short bits. This is
  the length after substracting db and de. Defaults to 20}
}
\details{
The time stamp in behavior and data need to be in the same format i.e. POSIXt or seconds from the start in numeric
format. The POSIXt is naturally more convinient since then the
behavioral observation and the measurement need not to begin from the
same time point.
The data.frame observation need to have at least two elements: time and
behavior (any additional elements are ignored). The time specifies the
start of the corresponding behavior and the start time of the next
behavior is used as the end of the previous one.
The format is adopted from CowLog behavioral coding software
(http://www.mm.helsinki.fi/~mpastell/CowLog).
}

\value{
The original data with two additional elements: \code{label} which contains
the labels for each row in the data and \code{freq} which tells the number of
the label counting from the beginning. 
}



\author{Matti Pastell <matti.pastell@helsinki.fi>}



