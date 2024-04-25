


library(shiny)
library(tidyr)
library(dplyr)
library(ggplot2)
library(plotly)


shinyServer(function(input, output, session) {

    output$distPlot <- renderPlotly({
      #loading data
      TPMs <- readr::read_csv("TPMs_table_100genes.csv")
      #changing table to longer with separated columns Condition and Replicate
      TPMs_long <- pivot_longer(data = TPMs,
                                cols = colnames(TPMs)[-1],
                                values_to = "TPMs",
                                names_to = "Sample") %>% 
        separate(Sample, sep="_", into = c("Condition","Replicate"))
      #choosing data only for the chosen gene
      x <- TPMs_long %>% 
        filter(GeneID == input$choice)
      #ploting point chart with separation on Control and Treated groups
      plot <- ggplot(data = x, aes(x=Condition, y = TPMs))+
        geom_point(aes(colour = Condition), position = position_jitter(), size = 6)
      #making plot interactive
      ggplotly(plot)
    })
    
    observe({
      #updating selectInput from ui based on the GeneID column from loaded table
      updateSelectInput(session, "choice", choices = TPMs$GeneID)
    })
})
