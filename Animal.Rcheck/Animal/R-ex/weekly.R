### Name: weekly
### Title: Calculate weekly values from time series
### Aliases: weekly


### ** Examples

data(RIC)
RIC2 <- clean.RIC(RIC)
#Weekly feed intake of a whole from data set RIC
herd <- weekly(RIC2$intake,time=RIC2$begin,fun=sum)
#Weekly feed intake of individual cows from data set RIC
herd <- weekly(RIC2$intake,time=RIC2$begin,fun=sum,subject=RIC2$cowID)



