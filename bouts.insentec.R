#Funktio Insentec ruokakuppien sy�ntidatojen siivoamiseen
bouts.RIC <- function(data,bout.diff=5){

data <- data[-c(1,7:9,11:16)]
  
kerrat<- table(data$cowID)
lehmat <- names(kerrat[kerrat>2])
l <- length(lehmat)
n <- 0
#erot <- NA
alut <- as.POSIXct(NA)
korj.alku <- NA
summa <- kesto.summa <- 0
#uudet <- data[0,]

uudet <- vector('list',l)

#K�sitell��n kaikki lehm�t
for (i in 1:l){
  lehma <- data[data$cowID==lehmat[i],]
  summat <- kestot <- boutit <- vector('numeric',length=nrow(lehma))

  #attach(lehma)
  #K�sitell��n lehm�n kaikki sy�nnit
  for (j in 2:nrow(lehma)){
    ero <- difftime(lehma$begin[j],lehma$end[j-1],units='mins')
    #Eka rivi on erikoistapaus
    if (j==2 & ero<bout.diff){
      summa <- lehma$intake[j-1]; kesto.summa <- lehma$duration[j-1]}

    #erot[j] <- ero
    # Yhdistet��n ne sy�nnit joiden v�liaika alle 5 min
    if (ero<bout.diff){
          summa <- summa + lehma$intake[j] #Lasketaan syonti yhteen edellisen kanssa
          kesto.summa <- kesto.summa +lehma$duration[j] #Kestoaikojen summa
      if (n==0){
        #Edellisen sy�nnin alkuaika on uusi alkuaika
        korj.alku <- lehma$begin[j-1]
                        }
       n <- n+1
    }
    if (ero>=bout.diff) {
      korj.alku <- lehma$begin[j]
      #Edellinen sy�nti oli Boutin loppu
      boutit[j-1] <- 1
      n <- 0
      summa <- lehma$intake[j]
      kesto.summa <- lehma$duration[j]
    }
     
    alut[j] <- as.POSIXct(korj.alku)
    summat[j] <- summa
    kestot[j] <- kesto.summa
  }

  #Jokaisen lehm�n j�lkeen teht�v�t
  boutit[nrow(lehma)] <- 1
  alut[1] <- lehma$begin[1]
  kestot[1] <- lehma$duration[1]
  #detach(lehma)
  
  #Yhdistet��n vanhat ja uudet tiedot, poistetaan virheelliset vanhat
  #korjattu <- data.frame(lehma,alut,boutit,summat,kestot)
  korjattu <- data.frame(lehma,boutit)
  korjattu$begin <- alut
  korjattu$bout.duration <- difftime(korjattu$end,korjattu$begin,units='mins')
  korjattu$intake <- summat
  korjattu$intake.duration <- kestot/60
  korjattu <- korjattu[korjattu$boutit==1,]
  korjattu <- korjattu[,-c(5,7)]
 
  #Yhdistet��n kaikki lehm�t samaan DF:n tulokseksi

  #uudet <- rbind(uudet,korjattu)
  uudet[[i]] <- korjattu
  
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
uudet <- do.call('rbind',uudet)
rownames(uudet) <- 1:nrow(uudet)
uudet
}
