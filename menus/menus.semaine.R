# LOGICIEL MENUS
require(gridExtra)
setwd("~/Documents/scripts/menus/")
getwd()



.env$menus <- function() {
  setwd("~/GitHub/scripts/menus/")
  require(gridExtra)
  require(gdata)
  require(timeDate)
  # NOMBRE DE REPAS
  fullmenus <- read.xls("menus.xlsx", header = TRUE)
#    diet <- readline(prompt = "Nombre de repas diet : ")
#      diet <- as.integer(diet)
#    gras <- readline(prompt = "Nombre de repas gras : ")
#      gras <- as.integer(gras)
#    indif <- readline(prompt = "Nombre de repas normaux : ")
#      indif <- as.integer(indif)
  
  # TRI EN FONCTION DE LA SAISON    
  year <- getRmetricsOptions("currentYear")
  time <- Sys.time()
  may <- strptime("01/06/2015","%d/%m/%Y")
  sept <- strptime("01/09/2015","%d/%m/%Y")
    if (time > may & time < sept){
      menu <- fullmenus[!fullmenus$saison =="hiver",]
    } else {
        menus <- fullmenus[!fullmenus$saison =="ete",]
    }    
  
  menus.sem <- menus[menus$jours=="semaine",]
  menus.diet <- menus.sem[menus.sem$regime=="diet",]
    a <- data.frame(menus.diet[sample(nrow(menus.diet),3),c(1,3)],regime=rep("diet",3))
  menus.indif <- menus.sem[menus.sem$regime=="normal",]
    c  <- data.frame(menus.indif[sample(nrow(menus.indif),2),c(1,3)],regime=rep("normal",2))
  panier <- data.frame(plat="panier de legumes",cuisson="moyen",regime="diet")
  d <-  rbind.data.frame(a,c,panier)
  
  rownames(d) <- seq (1, nrow(d))
  rownames(d)[nrow(d)] <- "bonus"
  
  print(d)
  pdf("Menus.pdf",height = 4,width = 4)
  grid.table(d)
  dev.off()
  o("Menus.pdf")
  }

attach(.env)
setwd("~/Google Drive/publications/")