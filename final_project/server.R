
library(shiny)
library(tidyr)
library(dplyr)
library(ggplot2)
library(plotly)
library(readxl)
library(maps)


shinyServer(function(input, output, session) {

    output$per_year <- renderPlotly({
#Eruption per year panel
      
      
      #loading data
      eruptions <- read_excel("eruptions_per_year.xlsx")

        # choose data as year and Eruption_total column
      plot <- ggplot(data = eruptions, aes(x = Year, y = Eruptions_total))+
        #bar plot
      geom_line(stat="identity", colour = "orange")+
        #adds changeable range
      xlim(input$range)+
        #adding theme
      theme_minimal()
      
      ggplotly(plot)

    })
    
#Data of volcanoes per country panel
    
    
      #loading data
    vulcanoes <- read_excel("volcano_data.xlsx")
      
    output$coordinates <- renderPlotly({
      
        #choosing data only for the chosen country
      filtered_data <- vulcanoes %>% 
        filter(Country == input$choice)
      
        # draw the plot of coordinates on a world map
      ggplot() +
          #adds world map
        geom_polygon(data = map_data("world"), aes(x=long, y=lat, group=group), colour="darkgrey",fill="grey", alpha=1)+
          #marks volcanoes on the map
        geom_point(data = filtered_data, aes(x=Longitude, y = Latitude, label = Volcano_Name), colour = "purple")+
          #setting axis labels
        ylab("Latitude")+
        xlab("Longitude")+
        theme_classic()
      
    })
    
    output$elevation <- renderPlotly({
      
        #choosing data only for the chosen country
      filtered_data <- vulcanoes %>% 
        filter(Country == input$choice)
      
        #draw the point plot of elevation
        #label allows viewing the volcano name in Plotly
      ggplot(data = filtered_data, aes(x=Country, y = Elevation_in_m, label = Volcano_Name))+
        geom_point( colour = "red", position = position_jitter())+
        theme_minimal()
      
      
    })
    
    observe({
        #updating selectInput from ui based on the Country column from loaded table
      updateSelectInput(session, "choice", choices = vulcanoes$Country)
    })
    
    output$rocks <- renderPlotly({
#Rock types panel
      
      x <- vulcanoes %>% 
        group_by(Tectonic_Setting, Dominant_Rock_Type) %>% 
        summarise(Number = n())
      
      ggplot(data = x, aes(fill =Dominant_Rock_Type, x=Tectonic_Setting, y = Number))+
        geom_bar(stat = "identity", position="stack")+
          #so the names dont overlap
        theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1))
      
    })
    
    
    output$current <- renderPlotly({
#Ongoing eruptions panel
      
        #loads data
      year2024 <- read_excel("eruptions_2024.xlsx")
        
      plot <- year2024 %>% 
          #counts the number of occurences for each country
        group_by(Country) %>% 
        summarise(Number = n()) %>% 
          #sorting data according to the ascending numbers of occurences
        arrange(Number) %>% 
        mutate(Country=factor(Country, levels=Country)) %>%
    
          #plots a column plot
        ggplot(data = ., aes(x=Country, y = Number))+
          geom_col(fill = "green")+
            #so the names dont overlap
          theme(axis.text.x = element_text(angle = 30, vjust = 0.5, hjust = 1))
      
    })

})
