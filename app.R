#data Viz project
#shiny app
library(shiny)
library(tidyverse)
indicators <- read_csv('C:/Users/sethh/OneDrive/Documents/CIS 671/Semester Project/data/Indicators.csv')

#user interface
ui <- fluidPage(
  

)


# server logic

server <- function(input, output) {
  
}


#run the shiny app

shinyApp(ui = ui, server = server)
