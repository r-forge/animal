`state.durations` <-
function (obs, state.names = NULL) 
{
    time <- 0
    duration <- 0
    t <- 1
    result <- 0
    states <- sort(unique(obs$behavior))
    rawdata <- 0
    for (j in 1:length(states)) {
        for (i in 1:(nrow(obs) - 1)) {
            if (obs$b[i] == states[j]) {
                duration[t] <- obs$time[i + 1] - obs$time[i]
                time[t] <- obs$time[i]
                t <- t + 1
            }
        }
        result[j] <- sum(duration)
        rawdata[j] <- list(duration/60)
        duration <- 0
        t <- 1
    }
    boxplot(rawdata, names = state.names, xlab = "Behavior", 
        ylab = "Bout duration (min)", main = "Bout Duration of Different Behaviours")
    round(result/60, 2)
}
