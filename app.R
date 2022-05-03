#data Viz project
#shiny app
#library(shiny)
#library(tidyverse)

source("Data and Visualization Exploration.R")

#user interface
ui <- navbarPage("Title of the page",
                 tabPanel("Introduction",
                          fluidPage(titlePanel(h1("This is a title")))
                          ),
                 tabPanel("Tasks",
                          fluidPage(titlePanel(h1("This is the second page")),
                                    mainPanel(h3("Pargraph goes here")
                                              )
                                    )
                          ),
                 tabPanel("Visual Encodings",
                          fluidPage(titlePanel(h1("This is the third page")),
                                    mainPanel(h3("Pargraph goes here")
                                              )
                                    )
                          ),
                 tabPanel("Graphs",
                          fluidPage(titlePanel(h1("This Page shows graphs")),
                                    mainPanel(h3("Pargraph goes here"),
                                              h3("Task 1"),
                                              plotOutput("task1"),
                                              h3("Task 2"),
                                              plotOutput("task2"),
                                              h3("Task 3"),
                                              plotOutput("task3")
                                    )
                          )
                 ),
                         
                 
                 )


# server logic

server <- function(input, output) {
  
  output$task1<-renderPlot(task1)
  
  output$task2<-renderPlot(task2)
  
  output$task3<-renderPlot(task3)
  
}


#run the shiny app

shinyApp(ui = ui, server = server)
