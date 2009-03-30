nunique <- function(x)(length(unique(x)))

hourly <- function(data,time,fun=sum,subject=NULL){
  if (is.null(subject)){
    result <- aggregate(data,list(hour(time)),fun)
    names(result) <- c('Hour','Result')}
    else{
      result <- aggregate(data,list(hour(time),subject),fun)
      names(result) <- c('Hour','Subject','Result')
    }
 result
}


daily <- function(data,time,fun=sum,subject=NULL){
  if (is.null(subject)){
    result <- aggregate(data,list(day.string(time)),fun)
    names(result) <- c('Date','Result')}
    else{
      result <- aggregate(data,list(day.string(time),subject),fun)
      names(result) <- c('Date','Subject','Result')
    }
 result
}


weekly <- function(data,time,fun=sum,subject=NULL){
  if (is.null(subject)){
    result <- aggregate(data,list(week(time)),fun)
    names(result) <- c('Week','Result')}
    else{
      result <- aggregate(data,list(week(time),subject),fun)
      names(result) <- c('Week','Subject','Result')
    }
 result
}


monthly <- function(data,time,fun=sum,subject=NULL){
  if (is.null(subject)){
    result <- aggregate(data,list(month(time)),fun)
    names(result) <- c('Month','Result')}
    else{
      result <- aggregate(data,list(month(time),subject),fun)
      names(result) <- c('Month','Subject','Result')
    }
 result
}

partOfDay <- function(time,nsplit=4,start=1){
    part  <- round(c(seq(from=start,to=(23+start),by=24/nsplit),start))-1
    period <- 1:length(time)
    hours <- hour(time)
    labels <- 'a'
 for (i in 1:nsplit){
   period[hours>=part[i] & hours<(part[i+1])] <- i
   labels[i]=paste(part[i],'-',part[i+1],sep='')
   if (i==nsplit){
     period[hours>=part[i] | hours<part[i+1]] <- i}
  }
    if (start==1) labels[nsplit] <- paste(part[nsplit],'-24',sep='')
    period <- factor(period,levels=1:nsplit,label=labels)
}

