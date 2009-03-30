### Name: monthly
### Title: Calculate monthly values from time series
### Aliases: monthly


### ** Examples

data(RIC)
RIC2 <- clean.RIC(RIC)
#Monthly feed intake of a whole from data set RIC
herd <- monthly(RIC2$intake,time=RIC2$begin,fun=sum)
#Monthly feed intake of individual cows from data set RIC
herd <- monthly(RIC2$intake,time=RIC2$begin,fun=sum,subject=RIC2$cowID)



