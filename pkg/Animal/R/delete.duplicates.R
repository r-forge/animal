`delete.duplicates` <-
function (obs) 
{
    obs2 <- obs
    for (i in 2:nrow(obs)) {
        if (obs$behavior[i] == obs$behavior[i - 1]) {
            obs2$behavior[i] = "repeated"
        }
    }
    obs <- obs2[obs2$behavior != "repeated", ]
}
