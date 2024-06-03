library(readxl)
vulcanoes <- read_excel("E:/Studia/at4br/AT4BR-assignment/final_project/volcano_data.xlsx")

x <- vulcanoes %>% 
  filter(Country == "Italy")

ggplot(data = x, aes(x=Country, y = "Elevation(m)"))+
  geom_point(colour = "Purple", position = position_jitter())



