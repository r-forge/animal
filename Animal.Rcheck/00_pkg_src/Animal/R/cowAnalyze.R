`cowAnalyze` <-
function (file = NULL, states = NULL, events = NULL, state.names = NULL, 
    event.names = NULL) 
{
    obs <- read.table(file, col.names = c("time", "behavior"))
    obs <- obs[order(obs$time), ]
    state.obs <- obs[is.element(obs$behavior, states), ]
    event.obs <- obs[is.element(obs$behavior, events), ]
    freq.events <- freq.count(event.obs$behavior)
    cat("Event results \t", event.names, "\n")
    cat("Frequency \t", freq.events, "times \n")
    event <- as.data.frame(freq.events, row.names = event.names)
    if (nrow(state.obs) > 1) {
        state.obs <- delete.duplicates(state.obs)
        durations <- state.durations(state.obs, state.names = state.names)
        freq.states <- freq.count(state.obs$behavior)
        bouts <- round(durations/freq.states, 2)
        cat("State results \t", state.names, "\n")
        cat("Frequency \t", freq.states, "times \n")
        cat("Bout \t\t", bouts, "minutes \n")
        cat("Total \t\t", durations, "minutes \n")
        cat("\n\n")
        state <- as.data.frame(cbind(freq.states, bouts, durations), 
            row.names = state.names)
        list(state = state, event = event)
    }
}
