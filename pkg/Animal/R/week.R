`week` <-
function (x) 
{
    as.numeric(format(x, "%W")) + 1
}
