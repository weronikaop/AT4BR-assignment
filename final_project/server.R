
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
      geom_bar(stat="identity", fill = "orange")+
      #adds changeable range
      xlim(input$range)
      
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
        geom_polygon(data = map_data("world"), aes(x=long, y=lat, group=group), colour="darkgrey",fill="grey", alpha=1)+
        geom_point(data = filtered_data, aes(x=Longitude, y = Latitude, label = Volcano_Name), colour = "purple")
      
    })
    
    output$elevation <- renderPlotly({
      
      #choosing data only for the chosen country
      filtered_data <- vulcanoes %>% 
        filter(Country == input$choice)
      
      # draw the plot of elevation
      ggplot(data = filtered_data, aes(x=Country, y = Elevation_in_m, label = Volcano_Name))+
        geom_point( colour = "red", position = position_jitter())
      
      
    })
    
    observe({
      #updating selectInput from ui based on the Country column from loaded table
      updateSelectInput(session, "choice", choices = vulcanoes$Country)
    })
    
    output$rocks <- renderPlotly({
      
      #choosing data only for the chosen country
      filtered_data <- vulcanoes %>% 
        filter(Country == input$choice)
      
      # draw the plot of elevation
      ggplot(data = filtered_data, aes(x=Country, y = Elevation_in_m, label = Volcano_Name))+
        geom_point( colour = "red", position = position_jitter())
      
      
    })
   

})
