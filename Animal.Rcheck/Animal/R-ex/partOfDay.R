### Name: partOfDay
### Title: Code data into different parts of day
### Aliases: partOfDay


### ** Examples

#Look at the daily distribution of feed intake of cows
#in dataset RIC
data(RIC)
data <- clean.RIC(RIC)
#With default split
data$period <- partOfDay(data$begin)
#Plot the results
boxplot(intake~period,data=data,ylab='Feed intake (kg)',
xlab='Time of day',main='Default settings: start =1, nsplit=4')
#A different split with directly plotting the result
boxplot(intake~partOfDay(begin,nsplit=6,start=3),data=data,
ylab='Feed intake (kg)',xlab='Time of day',main='start=3,nsplit=6')



