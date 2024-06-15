


library(shiny)
library(plotly)

shinyUI(fluidPage(
  
  titlePanel(h1("Volcanoes", align = "center")),
  
  titlePanel(h5("by Weronika Oprzędek", align = "center")),
  
  fluidPage(navlistPanel
          (
            tabPanel("Introduction",
                     h2("Introduction", align = "center"),
                     br(),
                     h4("For the project I decided to design a Shiny app. 
                     Its main aim is visualising chosen data in the form of various types of plots.
                         The data I gathered is centred around the topic of volcanos which I personally enjoy. 
                        All the used information comes from Global Volcanism Program [1]. The presented data, 
                        in the form of three tables, is saved in the app's folder as: eruptions_2024, eruptions_per_year, volcano_data. 
                        The app contains of: a line plot, a point plot, three bar plots and a plot where locations are marked on a world map. 
                        For some of the plots there are also options for the user to choose range or a subject.", align = "justify"),
                     br(),
                     h5("I would also like to note that because of a big amount of read data, the plots can sometimes 
                     beheave abnormally when switching the panels quickly, by showing on only half width of the page instead of its 100%
                     as it's intended in the code (it's the used default option). It may be caused by my personal computer but if that
                     happens, making the app window smaller and then again maximalising it helps.", align = "justify")
          ),
          tabPanel("Eruptions per year",
                     fluidPage(
                       fluidRow(
                         h2("Volcano eruptions per year", align = "center"),
                         h4("This total count of eruptions not only shows the eruptions that started in each year, but also
                            the older ones, which still last for any part of the year.", align = "justify"),
                         h4("By looking at the plot, it may seem as if the numbers are
                            increasing, which could cause panic and is entirely untrue. The authors of the data state that it is caused
                            by a reporting bias. For many years volcano activity on low levels couldn't be detected by satelites
                            and other technical equipments, which only changed in the recent years.[1]", align = "justify"),
                         
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
                         h4("Some of the volcanoes may not be found under a specific country, but for various reasons under other 
                            cathegories. For example, there are many volcanoes located on the borders of Chile with its neighbouring 
                            countries and so they can be found under: Chile-Peru, Chile-Bolivia or Chile-Argentina. Another example 
                            would be Antarctica which is a continent and its territorial claims aren't noted here.", align = "justify"),
                         br(),
                         h5("The names of the volcanoes appear after hovering the mouse cursor over points"),
                         #selection of country for both plots on this panel
                         selectInput("choice", "Choose a country (/territory):", choices = "")
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
          tabPanel("Under and above sea level",
                   fluidPage(
                     fluidRow(
                       h2("Numbers of vulcanoes under and above sea level for chosen regions", align = "center"),
                       #selection of regions
                       checkboxGroupInput("regions", "Choose regions for the plot to draw:", choices = "", width = '100%')
                     ),
                     fluidRow(
                       plotlyOutput("water", height = '800px'),
                       
                     ),
                   ) 
          ),
          tabPanel("Rock types and tectonic settings",
                     fluidPage(
                       fluidRow(
                         h2("Numbers of vulcanoes from each type of rock for each type of tectonic setting", align = "center"),
                         plotlyOutput("rocks", height = '900px'),
                         
                       ),
                     ) 
          ),
          tabPanel("Ongoing eruptions",
                     fluidPage(
                       fluidRow(
                         h2("Ongoing (continuing) eruptions in 2024", align = "center"),
                         h4("(as of 19 April 2024)", align = "center"),
                         h4("An eruption is called \"continuing\" when it shows daily activity or occasional eruptions with breaks 
                         lasting no longer than 3 months. Usually, we can say than on one day there is about 40 to 50 continuing 
                         eruptions, from which about half would be active eruptions. 
                            Only 4 of these eruptions started this year - Ruang (Indonesia), Taal (Philippines), Barren Island (India) and 
                            Fernanidna (Ecuador), while the oldest one of Yasur (Vanuatu) started in the year 1270 ± 110 years. [1]", align = "justify"),
                         plotlyOutput("current", height = '600px'),
                         
                       ),
                     ) 
          ),
          tabPanel("Bibliography", 
                   h2("Bibliography", align = "center"),
                   br(),
                   h4("1. Global Volcanism Program, 2024. [Database] Volcanoes of the World (v. 5.1.7; 3 June 2024). Distributed by Smithsonian Institution, compiled by Venzke, E. https://doi.org/10.5479/si.GVP.VOTW5-2023.5.1, https://volcano.si.edu")
          )
    
  ))
  
))

