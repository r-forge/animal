`hourly` <-
function (data, time, fun = sum, subject = NULL) 
{
    if (is.null(subject)) {
        result <- aggregate(data, list(hour(time)), fun)
        names(result) <- c("Hour", "Result")
    }
    else {
        result <- aggregate(data, list(hour(time), subject), 
            fun)
        names(result) <- c("Hour", "Subject", "Result")
    }
    result
}
