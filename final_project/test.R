library(readxl)
vulcanoes <- read_excel("E:/Studia/at4br/AT4BR-assignment/final_project/volcano_data.xlsx")
library(ggplot2)
library(tidyr)
library(dplyr)

x <- vulcanoes %>% 
  group_by(Tectonic_Setting, Dominant_Rock_Type) %>% 
  summarise(count = n())
  

