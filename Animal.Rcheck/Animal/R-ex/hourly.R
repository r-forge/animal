### Name: hourly
### Title: Calculate hourly values from time series
### Aliases: hourly


### ** Examples

data(RIC)
RIC2 <- clean.RIC(RIC)
#Hourly feed intake of a whole from data set RIC
herd <- hourly(RIC2$intake,time=RIC2$begin,fun=sum)
#Hourly feed intake of individual cows from data set RIC
herd <- hourly(RIC2$intake,time=RIC2$begin,fun=sum,subject=RIC2$cowID)



