### Name: nunique
### Title: Count unique occurrences of variables
### Aliases: nunique


### ** Examples

#Lets count the number of unique cows that have started to eat each hour
#in the dataset RIC.
data(RIC)
data <- clean.RIC(RIC)
hourly(RIC$cowID,RIC$begin,nunique)




