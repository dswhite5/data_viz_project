#data Viz project
#shiny app
library(shiny)
library(tidyverse)

source("Data and Visualization Exploration.R")

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
                                                country. To investigate this the variable total population is used for population growth, GDP per capita is used to model ecomnomic growth, and Co2 emissions
                                                are used to model green house gas. First we have to identify which countries to use in the study, then overall trend for those countries are looked at, lastly
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
                          fluidPage(titlePanel(h1("Visualization for Each Task")),
                                    mainPanel(h3("Design Decsions and Visual Encodings for Each Task"),
                                              h3("Task 1"),
                                              p("The goal of Task 1 is to identify 10 different levels of the variable CountryName to use in the project. The variable levels will be chosen based on the value of
                                                the two quantitative variables 'percent Change in Population' and 'Percent Change in GDP'. Task 1 will be accomplished using two bar charts with the visual encodings
                                                of color and length to express differences in quantitative variables for different levels of a categorical variable. Length is the second most accurate visual
                                                encoding according to Clevland's Rules and the length of each bar identifies the percent change in the quantitative variable for each graph. The bars are grouped 
                                                from tallest to shortest in an application of the Gestalt Law of similarity where similar items are considered to be in a group. Position is the most accurate visual
                                                encoding for interpreting categorical data and the different levels of the categorical variable will be shown with different horizontal positions. According to 
                                                Cleveland's Rules color is the second most accurate for interpreting categorical variables. So color will be used to differentiate the quantitative variables, as 
                                                this is similar to two levels of a categorical variable. Color will also be used to highlight which 5 levels of the categorical variable have the highest values of
                                                each quantitative variable. Colors for the bar chart will be blue for one of the quantitative variables and green for the other. Different shades of blue and green
                                                will be used to differentiate between the categorical levels with high and low values. The Gestalt law of isomorphic correspondence says that people interpret things
                                                based on past experiences or established conventions. Blue and green do not have other connotations associated with them, such as red being associated with danger,
                                                that might fit the Law of Isomorphic Correspondence. The Gestalt Law of Focal point says that items that are different create a focal point. While blue and green 
                                                are distinguishable from one another, they are also close enough that one variable wont be so distinct as to be viewed as the focal point. The Different shades of
                                                green and blue used to highlight the categorical levels follow this same idea. The 5 highest for percent change in GDP are China, The Republic of Korea, Singapore, 
                                                Thailand, and Indonesia. The top 5 for Percent Change in Population are Cote d\"Ivoire, Kenya, Niger, Sudan and the Democratic Republic of Congo."),
                                              plotOutput("task1"),
                                              h3("Task 2"),
                                              p('The Goal of Task 2 is to show trends in Co2 Emissions per capita for the years 1960 to 2011 for the 10 levels of CountryName identified in Task 1. This will be
                                                accomplished with a line chart with visual encodings of position, lines, and shape to identify differences in the quantitative variable Co2 Emissions, position will
                                                identify differences in the quantitative variable year, and color will be used to express differences in the categorical variable CountryName. Position is listed, 
                                                according to Cleveland\'s rules, as the most accurately interpreted visual encoding. Vertical position will be used to express different values for Co2 Emissions 
                                                and horizontal position will be used to express different values for Year. Color is listed as the second most accurate visual encoding for interpreting categorical
                                                values according to Cleveland\'s rules and will be used to to interpret differences in the levels of the categorical variable CountryName. A categorical Color scale
                                                will be used as it is more accurate for interpreting categorical variables than a continuous color scale. Red will not be used as one of the colors to avoid
                                                assumptions implied by the Gestalt law of focal point and the Gestalt law of isomorphic correspondence.  Red will also be omitted due to the use of the color 
                                                green as one of the colors. Red/Green color blindness is the most common form of color blindness. Trends present in the graph are a clear increase over time for The 
                                                Republic of Korea, China, Thailand, and Indonesia. Singapore\'s Increases dramatically till around the year 2000 and then decreases steadily. The countries of
                                                Cote d"Ivoire, Kenya, Sudan, Niger, and the Democratic Republic of Congo appear to have steady levels of Co2 emissions, at least compared to those of the other
                                                countries listed.'),
                                              plotOutput("task2"),
                                              h3("Task 3"),
                                              p("The goal of task 3 is to identify whether GDP per Capita or Population has a greater effect on Co2 emissions per capita. This will be accomplished with a scatter plot
                                                 comparing the percent changes in Co2 Emissions for each decade for the 10 countries identified in task 1 with the percent changes in GPD and population for each 
                                                 decade from 1960 to 2011 for the 5 countries in each category. Position will be used to interpret changes in the three quantitative variables, Percent change in 
                                                 Co2 emissions per capita, Percent Changes in GPD Per Capita and Percent changes in Population. Color will identify whether a point is Percent change in GDP or
                                                 Population and Color will used for fitted linear models based on the scatter plot of each quantitative variable. Angle will be used to determine relative 
                                                 differences in the slopes of the lines for each linear model to determine which variable has a greater effect on Co2 Emissions. Position is the easiest to 
                                                 interpret encoding for quantitative variables according to Cleveland's rules and so it will be used for Percent Change in Co2 Emission and Percent change in GDP or
                                                Population. Angle is the third easiest to interpret visual encoding for quantitative data and will be used to determine the relative differences in the slopes for the
                                                linear models for Percent Change in Co2 vs Percent Change in GDP and Percent Change in Co2 vs Percent Change in Population. Color will be used to differentiate whether
                                                a point is comparing Percent Change in Co2 Emissions with Percent Change in GDP or Percent Change in Co2 Emissions with Percent Change inPopulation. Percent changes
                                                in GDP will be blue and Percent changes in Population will be green as applications of the gestalt law of focal point and gestalt law of similarity as explained in
                                                task 1. The trend lines will be the same color as the variable associated with the linear model as an application of the gestalt lawof similarity. The Variable Percent
                                                Change in Population appears to have a greater impact on Percent Change in Co2 Emissions per Capita. The line for population hasa steeper angle for its upward slope
                                                implying that is has greater effect on Co2 emissions. A steeper upward slope means that for a one percent increase in Population there is a greater increase in Co2
                                                Emissions than for a one percent increase in GDP"),
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
