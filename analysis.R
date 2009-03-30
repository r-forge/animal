#Read the observation file
obs<-read.table('2008-04-16_14_35_39.390_03_04',col.names=c('time','behavior'))

#Name the codes
Names<-factor(levels=c(1,2,3,4,5,6),labels=c("standing","walking","lying","nrem","rem","hidden"))

#Order the observations by time
obs<-obs[order(obs$time),]

#Removing repeated (sequeantial) codes for the same behavior
#------------------------------------------------
#Make a copy of original data frame
obs2<-obs
for (i in 2:nrow(obs)){
  if(obs$b[i]==obs$b[i-1]){
    #Mark repeated observations as "repeated" in obs2
    obs2$b[i]="repeated"
    }
}

#Remove the repeated codings
obs<-obs2[obs2$b!="rep",]
#------------------------------------------------


## Calculate duration for each behavior with a loop
#---------------------------------------------------

#Initialize the variables
b1.duration<-b2.duration<-b3.duration<-b4.duration<-b5.duration<-b6.duration<-0
b1.time<-b2.time<-b3.time<-b4.time<-b5.time<-b6.time<-0
b1t<-b2t<-b3t<-b4t<-b5t<-b6t<-1


for (i in 2:nrow(obs)){

  #Observation class 1
  if (obs$b[i]=="1"){
    b1.duration[b1t]<-obs$time[i]-obs$time[i-1]
    b1.time[b1t]<-obs$time[i]
    b1t<-b1t+1
 }

  #Observation class 2
   if (obs$b[i]=="2"){
    b2.duration[b2t]<-obs$time[i]-obs$time[i-1]
    b2t<-b2t+1
 }

  #Observation class 3
    if (obs$b[i]=="3"){
    b3.duration[b3t]<-obs$time[i]-obs$time[i-1]
    b3t<-b3t+1
 }

  #Observation class 4
    if (obs$b[i]=="4"){
    b4.duration[b4t]<-obs$time[i]-obs$time[i-1]
    b4t<-b4t+1
 }

    #Observation class 5
    if (obs$b[i]=="5"){
    b5.duration[b5t]<-obs$time[i]-obs$time[i-1]
    b5t<-b5t+1
 }

    #Observation class 6
    if (obs$b[i]=="6"){
    b6.duration[b6t]<-obs$time[i]-obs$time[i-1]
    b6t<-b6t+1
 }

}
#----------------------------------------


##Calculate the descriptive statistics
#------------------------------------------
duration<-cnt<-freq<-0

#Total duration
duration[1]<-sum(b1.duration)
duration[2]<-sum(b2.duration)
duration[3]<-sum(b3.duration)
duration[4]<-sum(b4.duration)
duration[5]<-sum(b5.duration)
duration[6]<-sum(b6.duration)

#Count
cnt[1]<-sum(obs$behavior=="1")
cnt[2]<-sum(obs$behavior=="2")
cnt[3]<-sum(obs$behavior=="3")
cnt[4]<-sum(obs$behavior=="4")
cnt[5]<-sum(obs$behavior=="5")
cnt[6]<-sum(obs$behavior=="6")

#Frequency times/hour
#freq<-round(cnt/obs$time[nrow(obs)]*60*60,2)
#Round duration
duration<-round(duration/60,2)
#bouts
bout<-round(duration/cnt,2)
##Print to screen
#----------------------
cat( 'Statistics for',levels(Names),'\n')
cat('Frequency      ',cnt,'number \n')
cat('Bout          ',bout,'minutes \n')
cat('Total          ',duration,'minutes \n')

##Create plots
#--------------------------
quartz()
boxplot(b1.duration/60,b2.duration/60,b3.duration/60,b4.duration/60,b5.duration/60,b6.duration/60,
        names=levels(Names),xlab='Behavior',ylab='Bout duration (min)',main="Bout Duration of Different Behaviours")


##Hourly statistics
b1.hourlymean<-as.numeric(by(b1.duration,floor(b1.time/60/60),mean))
b1.hourlyfreq<-as.numeric(by(b1.duration,floor(b1.time/60/60),length))
b1.hourlybout<-b1.hourlymean/b1.hourlyfreq
quartz()
par(mfrow=c(3,1))
plot(b1.hourlymean,type="b",xlab='Time (hours from beginning)',ylab='Hourly total',main='Total duration per hour')
plot(b1.hourlyfreq,type="b",xlab='Time (hours from beginning)',ylab='Hourly frequency',main='Frequency per hour')
plot(b1.hourlybout,type="b",xlab='Time (hours from beginning)',ylab='Hourly bout duration',main='Bout duration per hour')
