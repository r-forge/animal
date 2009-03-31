#Read cowlog
read.CowLog <- function(file,start.time=NULL,delete.duplicates=TRUE){
  data <- read.table(file)
  names(data) <- c('time','behavior')
  data <- data[order(data$time), ]

  if (delete.duplicates==TRUE){
    data <- delete.duplicates(data)
  }
  
  if (is.null(start.time)==FALSE){
    start <- as.POSIXct(start.time)
    data$time <- start + data$time
  }
  data
}
