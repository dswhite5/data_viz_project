#data Viz project
#shiny app
#library(shiny)
#library(tidyverse)

#source("Data and Visualization Exploration.R")

#user interface
ui <- navbarPage("Data Visualization Strategies",
                 #tab panel for the first page
                 tabPanel("Introduction",
                          fluidPage(titlePanel(h1("Data Visualization Strategies")),
                                    mainPanel(h1('Project overview'),
                                              h3("This will disucss the page layout and what the data visualization stategies are"),
                                              h1('Task Oriented Design'),
                                              h3('Paragraph on task oriented design'),
                                              h1('World Indicators Data'),
                                              h3('This paragraph will discuss the data and talk about the famous example using this data'),
                                              img(src = 'indicators_data_set.PNG', height = 400, width = 800),
                                              h1('note on statistical methods'),
                                              h3('These are not rigorous statistical methods. That may be added at a later date')
                                              )
                                    )
                          ),
                 #tab panel for visual encoding page
                 tabPanel("Visual Encodings",
                          fluidPage(titlePanel(h1("Visual encodings and Visualization Strategies")),
                                    mainPanel(h1("Overview"),
                                              h3("What are visual encodings, gestalt principles and clevelands rules"),
                                              h1('Visual Encodings'),
                                              h3('what are visual encodings'),
                                              h1("Cleveland's Rules"),
                                              h3('What are clevelands Rules'),
                                              h1('Gestalts Principles'),
                                              h3('What are Gestalts Rpinciples'),
                                              br(),
                                              h3('Maybe show some examples?')
                                              
                                              )
                                    )
                          ),
                 #panel for tasks page
                 tabPanel("Tasks",
                          fluidPage(titlePanel(h1("Tasks to Accomplish")),
                                    mainPanel(h1("Task 1"),
                                              h3("Task 1 goes here"),
                                              h1('Task 2'),
                                              h3('Task 2 goes here'),
                                              h1('Task 3'),
                                              h3('Task 3 goes here')
                                    )
                          )
                 ),
                 #panel for graphs page
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
