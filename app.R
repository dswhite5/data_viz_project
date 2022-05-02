#data Viz project
#shiny app
library(shiny)
library(tidyverse)
indicators <- read_csv('C:/Users/sethh/OneDrive/Documents/CIS 671/Semester Project/data/Indicators.csv')

#user interface
ui <- navbarPage("Title of the page",
                 tabPanel("Panel Title",
                          fluidPage(titlePanel(h1("This is a title")))
                          )
                 
                 )


# server logic

server <- function(input, output) {
  
}


#run the shiny app

shinyApp(ui = ui, server = server)
