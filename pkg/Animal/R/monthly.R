`monthly` <-
function (data, time, fun = sum, subject = NULL) 
{
    if (is.null(subject)) {
        result <- aggregate(data, list(month(time)), fun)
        names(result) <- c("Month", "Result")
    }
    else {
        result <- aggregate(data, list(month(time), subject), 
            fun)
        names(result) <- c("Month", "Subject", "Result")
    }
    result
}
