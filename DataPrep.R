library(dplyr)
setwd('C:\\Users\\ricca\\Desktop\\DemoFerrari')

# Import and change column names
cars<-mtcars
cars<-cbind(Model = rownames(cars), cars)
rownames(cars) <- 1:nrow(cars)
colnames(cars) <- c('Modello','Miglia per gallone','Numero di cilindri','Cilindrata','Cavalli vapore americani','Rapporto al ponte','Peso (1000 lbs)','Accelerazione (1/4 mile time)','Tipo di motore','Cambio','Numero di marce in avanti','Numero di carburatori')

# Codify Transmission and EngineType as strings
cars= cars %>%
  mutate(Cambio=replace(Cambio, Cambio==0, 'automatic')) %>%
  mutate(Cambio=replace(Cambio, Cambio==1, 'manual')) %>%
  mutate(`Tipo di motore`=replace(`Tipo di motore`, `Tipo di motore`==0, 'V-engine')) %>%
  mutate(`Tipo di motore`=replace(`Tipo di motore`, `Tipo di motore`==1, 'straight engine'))

# Insert Image URL
ImageUrl=c()
for (Modello in cars['Modello']){
  tempurl=gsub(" ", "", sprintf("https://raw.githubusercontent.com/RiccardoImprota/mtcars-images/main/%s.jpg", Modello), fixed = TRUE)
  ImageUrl <- c(ImageUrl, tempurl)
}
cars<-cbind(cars,ImageUrl)


#Export as CSV
write.csv2(cars,"mtcars.csv", row.names = FALSE)

