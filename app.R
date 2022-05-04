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
                                              p("This site is a walk through of a data visualization project to practice and understand
                                                 different visualization concepts and strategies. This site will include brief overviews of
                                                 task oriented design for viuslaizations, color, Clevland's Rules,and Gestalt Principles and 
                                                 how they apply to creating visualizations. This is based on a project I completed 
                                                 for CIS 671 at Grand Valley State University. "),
                                              h1('Task Oriented Design'),
                                              p('Task Oriented design is a design strategy based around the idea that visualizations are 
                                                 created to help users(those interacting with the visualization) to accomplish a specific task. 
                                                 Thus the first step of the design process is to define those specific tasks and make decisions
                                                 about the contents of the visualization based on whether the contents help a user to accomplish
                                                 the task.'),
                                              h1('World Indicators Data'),
                                              p('The data for this project is called World Development Indicators and is published by the World Bank. 
                                                 The Data is accessed from', a('kaggle.com', href = '{https://www.kaggle.com/kaggle/world-development-indicators?select=Indicators.csv'),  
                                                 'and consists of 6 csv files. I will be looking at the main 
                                                 csv file Indicators.csv. Indicators.csv contains the variables CountryName, CountryCode, IndicatorName, 
                                                 IndicatorCode,  Year, and Value. I will be using CountryName, IndicatorName, Year, and Value in this project.
                                                 The variable CountryName is the the name of the country that the indicator variable is describing, 
                                                 IndicatorName is the name of the particular indicator Variable(such as Birth Rate), Year is the year 
                                                 associated with the value of the indicator, and Value is the value of the indicator variable. The Data is
                                                 currently formatted where each indicator variable value for a given year for a given country is an instance.See below for photo.'),
                                              br(),
                                              img(src = 'indicators_data_set.PNG', height = 400, width = 800),
                                              br(),
                                              br(),
                                              p('I will be reformatting the data to where a given country for a given year is an instance and the different
                                                 levels of the IndicatorName that are relevant to the project will be variables. The levels of IndicatorName 
                                                 that I am using are Co2 Emissions (metric ton per capita), GDP (per capita), and total Population. Co2 Emissions 
                                                 is in terms of metric tons of Co2 produced by the country per capita, total Population is the total population
                                                 for the country indicated in the year indicated, and GDP is the GDP prodcued by the country per capita in 
                                                 terms of 2005 US dollars. The Co2 emissions data stops at the year 2011, most of the data goes to the year
                                                 2015, so the project will only look at data between the years 2006 and 2011. The data was also filtered to
                                                 only include countries that had data for from 1960 to 2011 for all three varible of interest GDP (per capita),
                                                 Co2 Emissions(metric ton per captia), and Total Population. See below for photo of reformatted data' ),
                                              br(),
                                              img(src = 'manipulated_indicators.PNG', height = 400, width = 400),
                                              br(),
                                              h1('Note on statistical methods'),
                                              p('One of the task on this project compares the slopes of lines generated by linear models of the associated  data. 
                                                The statistical analysis in this project were performed for the sake of demonstration and to help walk through 
                                                visualization design. As such the method are not rigorous and should not taken to be statistically signifcant. 
                                                More rigorous statisical methods may be added at a later time.')
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
