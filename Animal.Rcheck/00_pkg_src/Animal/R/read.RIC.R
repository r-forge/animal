`read.RIC` <-
function (file, clean = TRUE) 
{
    data <- read.csv(file, header = FALSE)
    names(data) <- c("transponder", "cowID", "trough", "begin", 
        "end", "duration", "begin.kg", "end.kg", "feed.type", 
        "intake", "DM", "energy", "protein", "crude.fibre", "fat", 
        "ash")
    data$begin <- as.character(data$begin)
    data$end <- as.character(data$end)
    data$begin <- gsub(pattern = " ", "0", data$begin)
    data$end <- gsub(pattern = " ", "0", data$end)
    f.name <- file
    file.date <- paste("20", substr(f.name, 3, 4), "-", substr(f.name, 
        5, 6), "-", substr(f.name, 7, 8), sep = "")
    data$begin <- as.POSIXct(paste(file.date, data$begin))
    data$end <- as.POSIXct(paste(file.date, data$end))
    if (clean == TRUE) 
        data <- clean.RIC(data)
    data
}
