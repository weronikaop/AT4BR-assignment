


library(shiny)
library(plotly)

shinyUI(fluidPage(
  
  titlePanel(h1("Volcanos", align = "center")),
  
  fluidPage(navlistPanel
          (
          tabPanel("Eruptions per year",
                     fluidPage(
                       fluidRow(
                         #slider to choose the range of the plot
                         sliderInput("range", "Range of years:", min = 1960, max = 2024, value = c(1960, 2024))
                       ),
                       
                       fluidRow(
                         plotlyOutput("per_year"),
                         
                       )
                     ) 
          ),
            tabPanel("Data of volcanoes per country",
                     fluidPage(
                       fluidRow(
                         
                         selectInput("choice", "Country:", choices = "")
                       ),
                       
                       fluidRow(
                         plotlyOutput("coordinates"),
                         
                       ),
                       
                       fluidRow(
                         plotlyOutput("elevation"),
                         
                       )
                     ) 
            ),
          tabPanel("Bibliography", 
                   print("Bibliography:"),
                   br(),
                   print("Global Volcanism Program, 2024. [Database] Volcanoes of the World (v. 5.1.7; 3 June 2024). Distributed by Smithsonian Institution, compiled by Venzke, E. https://doi.org/10.5479/si.GVP.VOTW5-2023.5.1")
                   )
    
  ))
  
))

