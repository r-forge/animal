\name{RIC}
\alias{RIC}
\docType{data}
\title{RIC roughage intake log}
\description{
  A roughage intake log of a one day from Insentec RIC feed measurement
  system from the University of Helsinki Viikki researc barn in Finland.
  The data has been imported to R with function read.RIC option clean=F}

\usage{data(RIC)}
\format{
  A data frame with 3242 observations on the following 16 variables.
  \describe{
    \item{\code{transponder}}{Transponder number}
    \item{\code{cowID}}{Cow number}
    \item{\code{trough}}{The number of feed trough}
    \item{\code{begin}}{Start time of the visit}
    \item{\code{end}}{End time of the visit}
    \item{\code{duration}}{Visit duration in seconds}
    \item{\code{begin.kg}}{Roughage before visit}
    \item{\code{end.kg}}{Roughage after visit}
    \item{\code{feed.type}}{Type of feed}
    \item{\code{intake}}{Feed intake (kg)}
    \item{\code{DM}}{Dry matter (kg)}
    \item{\code{energy}}{Energy (VEM)}
    \item{\code{protein}}{Protein (kg)}
    \item{\code{crude.fibre}}{Crude fibre (kg)}
    \item{\code{fat}}{ Fat (kg)}
    \item{\code{ash}}{ Ash (kg)}
  }
}

\references{B.V. Marknesse. Instructions for use. RIC - MANAGEMENT WINDOWS version RW:1.7. English. Insentec
}

\keyword{datasets}
