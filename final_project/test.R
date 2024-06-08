library(readxl)
vulcanoes <- read_excel("E:/Studia/at4br/AT4BR-assignment/final_project/volcano_data.xlsx")

k <- vulcanoes %>% 
  filter(Country == "Chile")
library(maps)
library(ggplot2)
  
  # draw the plot of coordinates
  
ggplot() +
  geom_polygon(data = map_data("world"), aes(x=long, y=lat, group=group), colour="darkgrey",fill="grey", alpha=1)+
  geom_point(data = k, aes(x=Longitude, y = Latitude), colour = "purple")
