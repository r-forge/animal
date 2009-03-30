\name{nunique}
\alias{nunique}
\title{Count unique occurrences of variables}
\description{
Returns the number of unique occurrences of each level in the input object.
}
\usage{
nunique(x)
}
\arguments{
  \item{x}{Numeric, character of factor vector}
}

\value{
Number of unique levels in the input object.
}

\details{
Provides a convenient way to calculate the unique occurrences of certain
events in daily, hourly, weekly and monthly data e.g. calculate the
number of unique animals that have used the feeding throughs each hour
in dataset RIC (see examples). 
}

\author{Matti Pastell <matti.pastell@helsinki.fi>}

\examples{
#Lets count the number of unique cows that have started to eat each hour
#in the dataset RIC.
data(RIC)
data <- clean.RIC(RIC)
hourly(RIC$cowID,RIC$begin,nunique)

}

