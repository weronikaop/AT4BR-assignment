


library(shiny)
library(plotly)

shinyUI(fluidPage(

    titlePanel("expression of genes in TPMs"),

    sidebarLayout(
        sidebarPanel(
          #choice of a gene to plot its expression in TPMs
            selectInput("choice", "Gene:", "")
        ),

        mainPanel(
            plotlyOutput("distPlot")
        )
    )
))
