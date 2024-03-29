#Funktio Insentec ruokakuppien sy�ntidatojen siivoamiseen
bouts.RIC <- function(data,bout.diff=5){

kerrat<- table(data$cowID)
lehmat <- names(kerrat[kerrat>2])
l <- length(lehmat)
n <- 0
erot <- NA
alut <- as.POSIXct(NA)
korj.alku <- NA
summa <-summat <- kesto.summa <- kestot <- 0
boutit <- kestot <- 0
uudet <- data[0,]

#K�sitell��n kaikki lehm�t
for (i in 1:l){
  lehma <- data[data$cowID==lehmat[i],]
  attach(lehma)
  #K�sitell��n lehm�n kaikki sy�nnit
  for (j in 2:nrow(lehma)){
    ero <- difftime(begin[j],end[j-1],units='mins')
    erot[j] <- ero
    # Yhdistet��n ne sy�nnit joiden v�liaika alle 5 min
    if (ero<bout.diff){
          summa <- summa + intake[j] #Lasketaan syonti yhteen edellisen kanssa
          kesto.summa <- kesto.summa +duration[j] #Kestoaikojen summa
      if (n==0){
        #Edellisen sy�nnin alkuaika on uusi alkuaika
        korj.alku <- begin[j-1]
                        }
       n <- n+1
    }
    if (ero>=bout.diff) {
      korj.alku <- begin[j]
      #Edellinen sy�nti oli Boutin loppu
      boutit[j-1] <- 1
      n <- 0
      summa <- intake[j]
      kesto.summa <- duration[j]
    }
     
    alut[j] <- as.POSIXct(korj.alku)
    summat[j] <- summa
    kestot[j] <- kesto.summa
  }

  #Jokaisen lehm�n j�lkeen teht�v�t
  boutit[nrow(lehma)] <- 1
  alut[1] <- begin[1]
  kestot[1] <- duration[1]
  detach(lehma)
  
  #Yhdistet��n vanhat ja uudet tiedot, poistetaan virheelliset vanhat
  #korjattu <- data.frame(lehma,alut,boutit,summat,kestot)
  korjattu <- data.frame(lehma,boutit)
  korjattu$begin <- alut
  korjattu$bout.duration <- difftime(korjattu$end,korjattu$begin,units='mins')
  korjattu$intake <- summat
  korjattu$intake.duration <- kestot/60
  korjattu <- korjattu[is.na(korjattu$boutit)==FALSE,]
  korjattu <- korjattu[,-c(6,17)]
  
  #Yhdistet��n kaikki lehm�t samaan DF:n tulokseksi

  uudet <- rbind(uudet,korjattu)
  
 #Alustetaan muuttujat seuraavaa lehm�� varten
 n <- 0
 erot <- NA
 alut <- as.POSIXct(NA)
 korj.alku <- NA
 summa <-summat <- kesto.summa <- kestot <- 0
 boutit <- 0
  
#Loopin loppu
}

#Funktion loppu
rownames(uudet) <- 1:nrow(uudet)
uudet
}
