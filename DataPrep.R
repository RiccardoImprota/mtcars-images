library(dplyr)
setwd('C:\\Users\\ricca\\Desktop\\DemoFerrari')

# Import and change column names
cars<-mtcars
cars<-cbind(Model = rownames(cars), cars)
rownames(cars) <- 1:nrow(cars)
colnames(cars) <- c('Model','Miles per Gallon','Number of cylinders','Displacement','Gross horsepower','Rear axle ratio','Weight (1000 lbs)','1/4 mile time','EngineType','Transmission','Number of forward gears','Number of carburetors')

# Codify Transmission and EngineType as strings
cars= cars %>%
  mutate(Transmission=replace(Transmission, Transmission==0, 'automatic')) %>%
  mutate(Transmission=replace(Transmission, Transmission==1, 'manual')) %>%
  mutate(EngineType=replace(EngineType, EngineType==0, 'V-engine')) %>%
  mutate(EngineType=replace(EngineType, EngineType==1, 'straight engine'))

# Insert Image URL
ImageUrl=c()
for (model in cars['Model']){
  tempurl=gsub(" ", "", sprintf("https://raw.githubusercontent.com/RiccardoImprota/mtcars-images/main/%s.jpg", model), fixed = TRUE)
  ImageUrl <- c(ImageUrl, tempurl)
}
cars<-cbind(cars,ImageUrl)


#Export as CSV
write.csv(cars,"mtcars.csv", row.names = FALSE)

