### Name: daily
### Title: Calculate daily values from time series
### Aliases: daily


### ** Examples

data(RIC)
RIC2 <- clean.RIC(RIC)
#Daily feed intake of a whole from data set RIC
herd <- daily(RIC2$intake,time=RIC2$begin,fun=sum)
#Daily feed intake of individual cows from data set RIC
herd <- daily(RIC2$intake,time=RIC2$begin,fun=sum,subject=RIC2$cowID)



