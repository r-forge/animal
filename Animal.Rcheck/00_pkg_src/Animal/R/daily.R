`daily` <-
function (data, time, fun = sum, subject = NULL) 
{
    if (is.null(subject)) {
        result <- aggregate(data, list(day.string(time)), fun)
        names(result) <- c("Date", "Result")
    }
    else {
        result <- aggregate(data, list(day.string(time), subject), 
            fun)
        names(result) <- c("Date", "Subject", "Result")
    }
    result
}
