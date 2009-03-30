obs<-read.table('2008-04-16_14_35_39.390_03_04',col.names=c('time','behavior'))
obs$word<-factor(obs$behavior,levels=c(1,2,3,4,5,6),labels=c("standing","walking","lying","nrem","rem","hidden"))
obs<-obs[order(obs$time),]

freq.1<-sum(obs$behavior=="1")
freq.2<-sum(obs$behavior=="2")
freq.3<-sum(obs$behavior=="3")
freq.4<-sum(obs$behavior=="4")
freq.5<-sum(obs$behavior=="5")
freq.6<-s
data$lab<-""
for (i in 2:nrow(luokat)){
  erotus<-as.numeric(luokat$time[i]-luokat$time[i-1])*60
  if (erotus>60){
  data$lab[data$t>as.numeric(luokat$time[i])+10 & data$t<as.numeric(luokat$time[i+1])-10]<-luokat$behavior[i]
 }
}
