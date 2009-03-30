`weekly` <-
function (data, time, fun = sum, subject = NULL) 
{
    if (is.null(subject)) {
        result <- aggregate(data, list(week(time)), fun)
        names(result) <- c("Week", "Result")
    }
    else {
        result <- aggregate(data, list(week(time), subject), 
            fun)
        names(result) <- c("Week", "Subject", "Result")
    }
    result
}
