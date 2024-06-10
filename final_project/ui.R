


library(shiny)
library(plotly)

shinyUI(fluidPage(
  
  titlePanel(h1("Volcanos", align = "center")),
  
  titlePanel(h5("by Weronika Oprzędek", align = "center")),
  
  fluidPage(navlistPanel
          (
          tabPanel("Eruptions per year",
                     fluidPage(
                       fluidRow(
                         h2("Volcano eruptions per year", align = "center"),
                         #slider to choose the range of the plot
                         sliderInput("range", "Set a range of years:", min = 1960, max = 2024, value = c(1960, 2024), width = '90%')
                       ),
                       
                       fluidRow(
                         plotlyOutput("per_year", height = '600px'),
                         
                       )
                     ) 
          ),
          tabPanel("Volcano data per country",
                     fluidPage(
                       fluidRow(
                         h2("Volcanoes all around the world", align = "center"),
                         #selection of country for both plots on this panel
                         selectInput("choice", "Choose a country:", choices = "")
                       ),
                       
                       fluidRow(
                         h3("Coordinates marked on a world map", align = "center"),
                         h5("*it can take few seconds to load*", align = "center"),
                         h5("*there are two plots on this panel*", align = "center"),
                         plotlyOutput("coordinates", height = '600px'),
                         
                       ),
                       
                       fluidRow(
                         h3("Elevation", align = "center"),
                         plotlyOutput("elevation", height = '600px'),
                         
                       )
                     ) 
          ),
          tabPanel("Rock types",
                     fluidPage(
                       fluidRow(
                         h2("Numbers of vulcanoes build from each type of rock for each type of tectonic setting", align = "center"),
                         plotlyOutput("rocks", height = '800px'),
                         
                       ),
                     ) 
          ),
          tabPanel("Ongoing eruptions",
                     fluidPage(
                       fluidRow(
                         h2("Still ongoing eruptions in 2024", align = "center"),
                         h4("(as of 19 April 2024)", align = "center"),
                         h5("only 4 of them started this year while the oldest one of Yasur in Vanuatu started in 1270 ± 110 years", align = "center"),
                         plotlyOutput("current", height = '600px'),
                         
                       ),
                     ) 
          ),
          tabPanel("Bibliography", 
                   h3("Bibliography", align = "center"),
                   br(),
                   h4("Global Volcanism Program, 2024. [Database] Volcanoes of the World (v. 5.1.7; 3 June 2024). Distributed by Smithsonian Institution, compiled by Venzke, E. https://doi.org/10.5479/si.GVP.VOTW5-2023.5.1")
                   )
    
  ))
  
))

