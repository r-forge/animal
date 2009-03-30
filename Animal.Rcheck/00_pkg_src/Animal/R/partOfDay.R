`partOfDay` <-
function (time, nsplit = 4, start = 1) 
{
    part <- round(c(seq(from = start, to = (23 + start), by = 24/nsplit), 
        start)) - 1
    period <- 1:length(time)
    hours <- hour(time)
    labels <- "a"
    for (i in 1:nsplit) {
        period[hours >= part[i] & hours < (part[i + 1])] <- i
        labels[i] = paste(part[i], "-", part[i + 1], sep = "")
        if (i == nsplit) {
            period[hours >= part[i] | hours < part[i + 1]] <- i
        }
    }
    if (start == 1) 
        labels[nsplit] <- paste(part[nsplit], "-24", sep = "")
    period <- factor(period, levels = 1:nsplit, label = labels)
}
