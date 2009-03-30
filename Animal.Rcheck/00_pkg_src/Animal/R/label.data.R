`label.data` <-
function (data, observation, db = 5, de = 5, min.length = 20) 
{
    obs <- observation
    data.t <- as.numeric(data$time)
    obs.t <- as.numeric(obs$time)
    data$label <- ""
    data$freq <- 0
    for (i in 1:(nrow(obs) - 1)) {
        begin <- which(data.t > obs.t[i] + db)[1]
        end <- which(data.t > obs.t[i + 1] - de)[1]
        erotus <- data.t[end] - data.t[begin]
        if (erotus > min.length) {
            data$label[begin:end] <- obs$behavior[i]
            data$freq[begin:end] <- i
        }
    }
    return(data)
}
