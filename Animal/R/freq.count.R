`freq.count` <-
function (x) 
{
    events <- sort(unique(x))
    y <- 0
    for (i in 1:length(events)) {
        y[i] <- sum(x == events[i])
    }
    y
}
