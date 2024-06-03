
library(shiny)
library(tidyr)
library(dplyr)
library(ggplot2)
library(plotly)
library(readxl)


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
      
      # draw the plot of elevation
      ggplot(data = filtered_data, aes(x=Latitude, y = Longitude))+
        geom_point(colour = "purple")
      
      
    })
    
    output$elevation <- renderPlotly({
      
      #choosing data only for the chosen country
      filtered_data <- vulcanoes %>% 
        filter(Country == input$choice)
      
      # draw the plot of elevation
      ggplot(data = filtered_data, aes(x=Country, y = Elevation_in_m))+
        geom_point( colour = "red", position = position_jitter())
      
      
    })
    
    observe({
      #updating selectInput from ui based on the Country column from loaded table
      updateSelectInput(session, "choice", choices = vulcanoes$Country)
    })
   

})
