### Name: bouts.RIC
### Title: Merge bouts from RIC roughage intake files
### Aliases: bouts.RIC


### ** Examples

data(RIC)
cleaned.data <- clean.RIC(RIC)
bouts <- bouts.RIC(cleaned.data)
#With 8 minutes bout difference
bouts <- bouts.RIC(cleaned.data,bout.diff=8)



