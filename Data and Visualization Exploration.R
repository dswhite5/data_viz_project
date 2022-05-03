#Seth White
#data visulaization project
#Data and Visualization Exploration

#library(cowplot)
library(patchwork)

#plot for task 1
p1<-indicators_GDP_change%>%
  mutate(CountryName = fct_reorder(CountryName, desc(`Percent Change in GDP`)))%>% #this is so countries show up order from highest to lowest on chart
  ggplot()+
  geom_col(mapping = aes(x=CountryName, y=`Percent Change in GDP`), #use geom_col rather than geom_bar to specify x and y variable.
           fill = 'blue4')+
  labs(title = 'Countries with Largest Percent Change in GDP from 1960 to 2011', 
       x = 'Name of Country',
       y = 'Percent Change in GDP')+
  geom_col(data=indicators_GDP_change%>%
             head(5)%>%
             mutate(CountryName = fct_reorder(CountryName, desc(`Percent Change in GDP`))), #overlay bar chart with only top 5 countries in lighter shade
           mapping = aes(x=CountryName, y=`Percent Change in GDP`),  
           fill = 'blue')+
  theme(axis.text.x = element_text(angle = 25, hjust = 1, size = 11),
        plot.title = element_text(size = 15),
        axis.title = element_text(size = 12)
        )

p2<-indicators_pop_change%>%
  mutate(CountryName = fct_reorder(CountryName, desc(`Percent Change in Pop`)))%>% #this is so countries show up order from highest to lowest on chart
  ggplot()+
  geom_col(mapping = aes(x=CountryName, y=`Percent Change in Pop`), fill = 'green4')+ # use geom_col rather than geom_bar to specify x and y variable
  labs(title = 'Countries with Largest Percent Change in Population from 1960 to 2011',
       x = 'Name of Country',
       y = 'Percent Change in Population')+
  geom_col(data=indicators_pop_change%>% #overlay another bar chart with top 5 in lighter shade
             head(5)%>%
             mutate(CountryName = fct_reorder(CountryName, 
                                              desc(`Percent Change in Pop`))), 
           mapping = aes(x=CountryName, y=`Percent Change in Pop`), 
           fill = 'green')+
  theme(axis.text.x = element_text(angle = 25, hjust = 1, size = 11), #adjust text size on bar chart
        plot.title = element_text(size = 15),
        axis.title = element_text(size = 12)
        )

#combined bar chart with patchwork
task1<-p1/p2 

# I didnt actually use this graph
# indicators_GDP_change%>%
#   mutate(CountryName = fct_reorder(CountryName, desc(`Percent Change in GDP`)))%>%
#   ggplot()+
#   geom_col(mapping = aes(x=CountryName, y=`Percent Change in GDP`), fill = 'blue4')+
#   labs(title = 'Countries with Largest Percent Change in GDP from 1960 to 2011', 
#        x = 'Country Name',
#        y = 'Percent Change in GDP')+
#   geom_col(data=indicators_GDP_change%>%head(5)%>%mutate(CountryName = fct_reorder(CountryName, desc(`Percent Change in GDP`))), mapping = aes(x=CountryName, y=`Percent Change in GDP`), fill = 'blue')+
#   geom_col(data =indicators_pop_change%>%mutate(CountryName = fct_reorder(CountryName, desc(`Percent Change in Pop`))), mapping = aes(x=CountryName, y=`Percent Change in Pop`), fill = 'green4')+
#   labs(title = 'Countries with Largest Percent Change in Population from 1960 to 2011',
#        x = 'Country Name',
#        y = 'Percent Change in Population')+
#   geom_col(data=indicators_pop_change%>%head(5)%>%mutate(CountryName = fct_reorder(CountryName, desc(`Percent Change in Pop`))), mapping = aes(x=CountryName, y=`Percent Change in Pop`), fill = 'green')


################################################################
################################################################
# this is the line chart for task 2

# I didnt like how scale color brewer pallettes were looking on graph 
#colors() shows list of available named colors
line_colors = c('lightblue', 'pink', 'green', 'black', 'orange', 'purple', 'blue', 'yellow3', 'grey', 'brown' )


task2<-indicators_co2_by_year%>%
  ggplot(mapping = aes(x= Year, 
                       y = `CO2 emissions (metric tons per capita)`, 
                       color = CountryName))+
  geom_line()+ #using line plot and scatter plot to create visualization
  geom_point()+
  labs(title = 'Co2 Emissions per Year for each Country From Task 1',
       color = 'Country Names')+
  scale_colour_manual(values = line_colors)+ # Use specific colors defined at beginning of task
  theme(panel.background = element_rect(fill = "white"), # set look of graph back ground
        panel.grid.major.y = element_line(color = "grey"),
        panel.grid.major.x = element_blank())+
  scale_y_continuous(n.breaks = 8)+# number of ticks from 4 to 8
  scale_x_continuous(n.breaks = 12)






############################################################
###########################################################
# this is the scatter plot for task 3
colors <- c('gdp' = 'blue', 'pop' = 'green')

task3<-co2_GDP%>%
  ggplot()+
  geom_point(mapping = aes(x=`Percent Change GDP by Decade`,  #scatter plot for GDP
                           y = `Percent Change Co2 by Decade`,
                           color = gdp),
             #color = 'blue'
             )+
  geom_point(data = co2_pop, 
             mapping = aes(x=`Percent Change Population by Decade`, #scatterplot of Population
                           y = `Percent Change Co2 by Decade`,
                           color = pop),
             #color = 'green'
             )+
  scale_color_manual(values = c('blue', 'green'))+
  xlim(0,200)+ #limits to remove outliers, should verify outliers mathematically, 
  ylim(-100,300)+ #should I remove outliers or keep in? drastically changes slope of lines
  theme(panel.background = element_rect(fill = "white"), # set look of graph back ground
        panel.grid.major.y = element_line(color = "grey"), #sets x-axis color
        panel.grid.major.x = element_line(color = "grey"), #sets y-axis color
        panel.border = element_rect(color = 'grey', fill = NA), #sets border of plot
        plot.title = element_text(size = 20), #change size of text for various chart items
        axis.title = element_text(size = 15),
        legend.title = element_text(size = 13),
        legend.text = element_text(size = 11)
        )+
  # geom_abline(intercept = gdp_fit$coefficients[1], ## i am using geom smooth for the line, this was to double
  #             slope = gdp_fit$coefficients[2],     ## check that the smooth lines matched my calculated linear 
  #             color = 'blue'                       ## model lines
  #             )+
  # geom_abline(intercept = pop_fit$coefficients[1],
  #             slope = pop_fit$coefficients[2],
  #             color = 'green'
  #             )+
  geom_smooth(data = co2_GDP, # plots line for linear model of co2 vs gdp
              mapping = aes(x=`Percent Change GDP by Decade`,
                            y = `Percent Change Co2 by Decade`),
              method = 'lm',
              se = FALSE,
              color = 'Blue')+
  geom_smooth(data = co2_pop, #plots linear model of co2 vs pop
              mapping = aes(x=`Percent Change Population by Decade`,
                            y = `Percent Change Co2 by Decade`),
              method = 'lm',
              se = FALSE,
              color = 'Green')+
  # I think its better to leave formula off of visualization
  # annotate(geom = 'rect', xmin = 125, xmax = 200, ymin = 200, ymax = 275, fill = 'white')+ 
  # annotate(geom = 'text', #adds formula for co2 vs gdp
  #          x = 171, #location in x and y corrdinates
  #          y = 250, 
  #          label = formula_gdp, # string for formula in data_processing script
  #          color = "blue2")+ 
  # annotate(geom = 'text', #adds formula for co2 vs pop
  #          x = 165, #location in x and y corrdinates
  #          y = 220, 
  #          label = formula_pop, #string for formula in data processing script
  #          color = 'green4'
  #          )+
  labs(title = ' Percent change Co2 by Decade compared to Percent\n Change in GPD and Percent Change in Population',
       x = 'Percent Change in GDP or Population',
       y = ' Percent Change in Co2 Emissions per Capita',
       color = 'Comapred Variables')
  
        


#verfiy that points being removed from graph are outliers
# co2_GDP%>%
#   ggplot()+
#   geom_boxplot(mapping=aes(y = `Percent Change GDP by Decade`))
# 
# co2_GDP%>%
#   ggplot()+
#   geom_boxplot(mapping = aes(y= `Percent Change Co2 by Decade`))
# 
# co2_pop%>%
#   ggplot()+
#   geom_boxplot(mapping=aes(y = `Percent Change Population by Decade`))
# 
# co2_pop%>%
#   ggplot()+
#   geom_boxplot(mapping = aes(y= `Percent Change Co2 by Decade`))

