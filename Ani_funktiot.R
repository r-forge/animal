#Function for counting frequencies
freq.count <- function(x){
  #Unique events
  events <- sort(unique(x))
  y <- 0
  for (i in 1:length(events)){
    #count the frequency of each class
    y[i] <- sum(x==events[i])
  }
 y
}

#Function for removing repeated (sequeantial) codes for the same behavior
delete.duplicates <- function(obs){
    
    #Make a copy of original data frame
    obs2<-obs
    for (i in 2:nrow(obs)){
      if(obs$behavior[i]==obs$behavior[i-1]){
        #Mark repeated observations as "repeated" in obs2
        obs2$behavior[i]="repeated"
        }
    }

    #Remove the repeated codings
    obs<-obs2[obs2$behavior!="repeated",]
    
}

#Calculate the state durations
state.durations <- function(obs,state.names=NULL){
  time <- 0
  duration <- 0
  t <- 1
  result <- 0
  states <- sort(unique(obs$behavior))
  rawdata <- 0
  
  #Go trough all states
  for (j in 1:length(states)){
  #Go through all observations
    for (i in 1:(nrow(obs)-1)){
      if (obs$b[i]==states[j]){
        duration[t]<-obs$time[i+1]-obs$time[i]
        time[t]<-obs$time[i]
        t<-t+1
      }      
  }
  #Run after i looop
  result[j] <- sum(duration)
  rawdata[j] <- list(duration/60)
  duration <- 0
  t <- 1
  }
boxplot(rawdata,names=state.names,xlab='Behavior',ylab='Bout duration (min)',main="Bout Duration of Different Behaviours")
#Duration in minutes
round(result/60,2)
#End of function
}

cowAnalyze <- function(file=NULL,states=NULL,events=NULL,
                       state.names=NULL,event.names=NULL){

#Read in datafile
obs<-read.table(file,col.names=c('time','behavior'))
#obs<-read.table('calf1.bh1',col.names=c('time','behavior'))

#Order the observations by time
obs<-obs[order(obs$time),]

state.obs <- obs[is.element(obs$behavior,states),]
event.obs <- obs[is.element(obs$behavior,events),]

#Calculate the frequency of events
freq.events <- freq.count(event.obs$behavior)

cat( 'Event results \t',event.names,'\n')
cat('Frequency \t',freq.events,'times \n')
event <- as.data.frame(freq.events,row.names=event.names)

if (nrow(state.obs)>1){
    #Delete duplicated state observations
    state.obs <- delete.duplicates(state.obs)
    #Count the durations of states and make a boxplot of the results
    durations <- state.durations(state.obs,state.names=state.names)
    
    #Calculate the frequency of states
    freq.states <- freq.count(state.obs$behavior)
    #Count the bout lenght of the states
    bouts<-round(durations/freq.states,2)

    cat( 'State results \t',state.names,'\n')
    cat('Frequency \t',freq.states,'times \n')
    cat('Bout \t\t',bouts,'minutes \n')
    cat('Total \t\t',durations,'minutes \n')
    cat('\n\n')
    state <- as.data.frame(cbind(freq.states,bouts,durations),row.names=state.names)
    list(state=state,event=event)
  }

}


#funktio datan ja aikojen yhdist�miseksi
label.data <- function(data,observation,db=5,de=5,min.length=20){
  obs <- observation
  data.t<-as.numeric(data$time)
  obs.t <- as.numeric(obs$time)
  data$label<-""
  data$freq<-0
  
  for (i in 1:(nrow(obs)-1)){
    begin <- which(data.t>obs.t[i]+db)[1]
    end <- which(data.t>obs.t[i+1]-de)[1]
    erotus<-data.t[end]-data.t[begin]   
    if (erotus>min.length){
      data$label[begin:end]<-obs$behavior[i]
      #Merkit��n, ett� kyseess� on sama p�tk�
      data$freq[begin:end]<-i
    }
  }  
return(data)
}

#Muunnetaan ajat viikoiksi, p�iviksi, tunneiksi
week <- function(x){as.numeric(format(x,'%W'))+1}
month <- function(x){as.numeric(format(x,'%M'))}
day <- function(x){as.numeric(format(x,'%d'))}
day.string  <- function(x){as.character(trunc(x,'days'))}
hour <- function(x){as.numeric(format(x,'%H'))+1}


#funktio datan ja aikojen yhdist�miseksi
label.data <- function(data,observation,db=5,de=5,min.length=20){
  obs <- observation
  data.t<-as.numeric(data$time)
  obs.t <- as.numeric(obs$time)
  data$label<-""
  data$freq<-0
  
  for (i in 1:(nrow(obs)-1)){
    begin <- which(data.t>obs.t[i]+db)[1]
    end <- which(data.t>obs.t[i+1]-de)[1]
    erotus<-data.t[end]-data.t[begin]   
    if (erotus>min.length){
      data$label[begin:end]<-obs$behavior[i]
      #Merkit��n, ett� kyseess� on sama p�tk�
      data$freq[begin:end]<-i
    }
  }  
return(data)
}

#Daily yms. funktiot
source('time.functions.R')


#Funktiot insentec kuppidatan k�sittelyyn ja esimerkkidata
source('insentec.R')
source('bouts.insentec.R')
source('cowlog_functions.R')
RIC <- read.RIC('VR090318.DAT',clean=F)



#Luodaan paketin "luuranko"
system('rm -r Animal*')
package.skeleton(name='Animal')
