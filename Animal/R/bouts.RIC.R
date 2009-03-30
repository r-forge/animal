`bouts.RIC` <-
function (data, bout.diff = 5) 
{
    data <- data[-c(1, 7:9, 11:16)]
    kerrat <- table(data$cowID)
    lehmat <- names(kerrat[kerrat > 2])
    l <- length(lehmat)
    n <- 0
    alut <- as.POSIXct(NA)
    korj.alku <- NA
    summa <- kesto.summa <- 0
    uudet <- vector("list", l)
    for (i in 1:l) {
        lehma <- data[data$cowID == lehmat[i], ]
        summat <- kestot <- boutit <- vector("numeric", length = nrow(lehma))
        attach(lehma)
        for (j in 2:nrow(lehma)) {
            ero <- difftime(begin[j], end[j - 1], units = "mins")
            if (j == 2 & ero < bout.diff) {
                summa <- intake[j - 1]
                kesto.summa <- duration[j - 1]
            }
            if (ero < bout.diff) {
                summa <- summa + intake[j]
                kesto.summa <- kesto.summa + duration[j]
                if (n == 0) {
                  korj.alku <- begin[j - 1]
                }
                n <- n + 1
            }
            if (ero >= bout.diff) {
                korj.alku <- begin[j]
                boutit[j - 1] <- 1
                n <- 0
                summa <- intake[j]
                kesto.summa <- duration[j]
            }
            alut[j] <- as.POSIXct(korj.alku)
            summat[j] <- summa
            kestot[j] <- kesto.summa
        }
        boutit[nrow(lehma)] <- 1
        alut[1] <- begin[1]
        kestot[1] <- duration[1]
        detach(lehma)
        korjattu <- data.frame(lehma, boutit)
        korjattu$begin <- alut
        korjattu$bout.duration <- difftime(korjattu$end, korjattu$begin, 
            units = "mins")
        korjattu$intake <- summat
        korjattu$intake.duration <- kestot/60
        korjattu <- korjattu[korjattu$boutit == 1, ]
        korjattu <- korjattu[, -c(5, 7)]
        uudet[[i]] <- korjattu
        n <- 0
        erot <- NA
        alut <- as.POSIXct(NA)
        korj.alku <- NA
        summa <- summat <- kesto.summa <- kestot <- 0
        boutit <- 0
    }
    uudet <- do.call("rbind", uudet)
    rownames(uudet) <- 1:nrow(uudet)
    uudet
}
