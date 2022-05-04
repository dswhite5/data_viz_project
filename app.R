#data Viz project
#shiny app
#library(shiny)
#library(tidyverse)

#source("Data and Visualization Exploration.R")

#user interface
ui <- navbarPage("Data Visualization Strategies",
#################tab panel for the first page#######################################################################
                 tabPanel("Introduction",
                          fluidPage(titlePanel(h1("Data Visualization Strategies")),
                                    mainPanel(h1('Project overview'),
                                              p("This site is a walk through of a data visualization project to practice and understand 
                                                different visualization concepts and strategies. This site will include brief overviews 
                                                of task oriented design for viuslaizations, color, Clevland's Rules,and Gestalt Principles
                                                and how they apply to creating visualizations. To walk through these design concepts the 
                                                world indicators data from the World Bank will be explored to investigate whether populaion
                                                growth or economic growth have a greater efect on Co2 emissions for a particular country.
                                                This is based on a project completed for CIS 671 at Grand Valley State University."),
                                              h1('Task Oriented Design'),
                                              p('Task Oriented design is a design strategy based around the idea that visualizations are 
                                                 created to help users(those interacting with the visualization) to accomplish a specific task. 
                                                 Thus the first step of the design process is to define those specific tasks and make decisions
                                                 about the contents of the visualization based on whether the contents help a user to accomplish
                                                 the task.'),
                                              h1('World Indicators Data'),
                                              p('The data for this project is called World Development Indicators and is published by the World Bank. 
                                                 The Data is accessed from', a('kaggle.com', href = 'https://www.kaggle.com/kaggle/world-development-indicators?select=Indicators.csv'),  
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
                                                More rigorous statisical methods may be added at a later time.'),
                                              br(),
                                              br(),
                                              br(),
                                              p('Code for this project can be found on', a('github.com', href = 'https://github.com/dswhite5/data_viz_project'), align = 'center'
                                                ),
                                              p('Information based off of lecture by Prof. Dowling in CIS 671', align = 'center'
                                                )
                                              )
                                    )
                          ),
##################tab panel for visual encoding page#########################################################################################################
                 tabPanel("Visual Encodings",
                          fluidPage(titlePanel(h1("Visual encodings and Visualization Strategies")),
                                    mainPanel(h1("Overview"),
                                              p("Visual encodings are the different aspects of a visualization that are available to use or manipulate in order help a user
                                                accomplish the desired task. Examples would be position, length, or color. Cleveland's rules were developed by William Cleveland 
                                                and describe the interperatability of different visual encodings based on whether they are representing quantitative or qualitative data.
                                                Finally Gestalt principles are descriptions of the underlying assumptions people make when first looking at visualizations. Using Gestalt
                                                Principles can help a designer understand the how a user is going to initially see and understand a particular visualization when fisrt
                                                interactin with it."),
                                              h1("Visual Encodings and Cleveland's Rules"),
                                              p("Different visual encodings are essetnially anything that can be used or maninpulated on a visualization. The most common ones, and the
                                                ones described in by cleveland's rules are position, length, color, area, and angle. Cleveland defined judging differences in these visual
                                                encodings as basic perceptual tasks and then ranked them according to difficulty. According to Cleveland for quantitative data the visual 
                                                encodings are ranked position, length, angle(slope), area(or volume), and color as easiest to hardest to interpret differences. For 
                                                Categorical data the ranking is position, color, length, angle(slope), and area(or Volume)"),
                                              h1('Gestalt Principles'),
                                              p("As mentioned gestalt principles help to define a human's natural assumptions when looking at something. understanding how these principles 
                                                 work can help to avoid confusion about what is taking place on a particular visualization."),
                                              h3('Gesltalt law of grouping'),
                                              p('This law ranks how we determine which items we percieve as being in a group. Are items closer together in a group or items that are the same
                                                color? What if there are differrent colors but the items are in a line? This law explains how humans perceive which items belong together'),
                                              br(),
                                              strong('Gestalt Law of grouping:'),
                                              p('proximity - things close together are percieved as being in a group'),
                                              p('similarity - Things that look the same are considered to be in a groupd'),
                                              p('Enclosure - Things physically enclosed(inside a boundary) are considered to be in a group'),
                                              p('Closure - items that seem to be in a structure are considered to be in a group'),
                                              p('Continuity - Items that are aligned are considered to be in a group'),
                                              p('Connection - Connected points form group, stronger than proximity and similamrity but weaker than closure'),
                                              p('To apply these rankings, say for instance there were dots that are red and blue, and the red and blus dots are mixed into two clumps, a person will
                                                assume that the clumps are the groups rather than the red dots and blue dots, becasue proximity(things in a clump) trumps similarity(red or blue dots).'),
                                              h3('Other Gestalt Laws'),
                                              p('The following gestalt laws dont have to do with grouping items.'),
                                              h3('Gestalt Law of Focal Point'),
                                              p('Distinctive items will be considered a focal point of the visualization.'),
                                              h3('Gestatl Law of Isomorphic Correspondence'),
                                              p('People interpret visualizations based on past experiences. So a designer should stick to well established conventions.'),
                                              h3('Gestalt Law of Figure and Ground'),
                                              p('Object are perceived either as figures (distinct elements of focus) or as the ground(background which figures rest in). 
                                                Figures are seen as more important and seen first. The greater the contrast the easier it is to distinguish between the two.'),
                                              h3('Gestalt Law of continuity'),
                                              p('There is a tendency to perceive lines as continuing in an established direction.'),
                                              h3('Gestatl Law of Common Fate'),
                                              p('Lines or shapes that move in the same direction are perceived to be related to each other.'),
                                              br(),
                                              h3('Maybe show some examples?')
                                              
                                              )
                                    )
                          ),
##################panel for tasks page###############################################################################################################
                 tabPanel("Tasks",
                          fluidPage(titlePanel(h1("Tasks to Accomplish")),
                                    mainPanel(h1('Overview of project goal'),
                                              p('The goal for this project is to investigate whether population growth or economic growth has a greater effect on green house gas emissions for a particular 
                                                country. To investigate this the variables total population is used for population growth, GDP per capita is used to model ecomnomic growth, and Co2 emissions
                                                are used to model green house gas. First we have to identify which countries to use in the study, then overall trend forthose countries are looked at, lastly
                                                the relationships that population and GDP for each country chosen have with Co2 emissions are compared to see which has the greater effect'),
                                              h2("Task 1"),
                                              p("Identify the 5 countries with greatest percent change in GDP per Capita from 1960 to 2011 and identify the 5 countries with greatest percent
                                                 change in total population from 1960 to 2011."
                                                 ),
                                              h2('Task 2'),
                                              p("Show trends in Co2 emissions per capita for the countries identified in task 1 with Co2 emissions per year for years 1960 to 2015."),
                                              h2('Task 3'),
                                              p('Identify if GDP per Capita or total Population has greater effect on Co2 emissions (per Capita) for the countries identified in first 
                                                 task by comparing percent change of Co2 emissions (per Capita) every 10 years and percent change of GDP per capita every 10 years while 
                                                 also comparing percent change Co2 emissions every 10 years and percent change in total population for every 10 years for years 1960 to 2015.'
                                                 )
                                    )
                          )
                 ),
##################panel for graphs page################################################################################################################
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
