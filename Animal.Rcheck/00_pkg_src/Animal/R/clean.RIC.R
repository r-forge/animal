`clean.RIC` <-
function (data) 
{
    data <- data[data$cowID != 0, ]
    data <- data[data$intake >= 0, ]
    data <- data[data$duration != 0, ]
    rownames(data) <- 1:nrow(data)
    data
}
