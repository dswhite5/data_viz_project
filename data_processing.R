#CIS 671 01
#Seth White
#Semester Project
# Project Final
#Data processing and wrangling

library(tidyverse)

#######################################################
######################################################
#data processing relevant to all tasks


#read in data
indicators <- read_csv('C:/Users/sethh/OneDrive/Documents/CIS 671/Semester Project/data/Indicators.csv')

#edit indicators data set
indicators_project <- indicators%>%
  filter(IndicatorName == 'CO2 emissions (metric tons per capita)' | #filter rows that are not chosen IndicatorName levels
           IndicatorName == 'Population, total' | 
           IndicatorName == 'GDP per capita (constant 2005 US$)')%>%
  select(!c(IndicatorCode, CountryCode))%>% #Remove columns that are not being used
  pivot_wider(names_from = IndicatorName, values_from = Value)%>% #change IndicatorName levels that remain to variable names, with values from Value
  filter(!is.na(`GDP per capita (constant 2005 US$)`),  #Filter out rows missing one of the data values. 
         !is.na(`Population, total`),
         !is.na(`CO2 emissions (metric tons per capita)`)
         )%>%
  slice(-(1:19)) # remove rows that are regions instead of countries, i.e. North America, Asia, World etc.
  
#Countries that have data for both 1960 and 2011
countries_1960_2011<-indicators_project%>%
  filter(Year == 1960 | Year == 2011)%>%
  count(CountryName)%>%
  filter(n == 2)%>%
  arrange(CountryName)%>%
  pull(CountryName)


############################################################
############################################################
## data processing for task 1

#top ten countries by percent change in GDP for graph
indicators_GDP_change <- indicators_project%>%
  filter(Year == 1960 | Year == 2011)%>% #filters out years except 1960 and 2011
  filter(CountryName %in% countries_1960_2011)%>% #filters out countries that dont have data for 1960 and 2011
  select(!c(`CO2 emissions (metric tons per capita)`,`Population, total`))%>% #remove Co2 emissions and population variables
  pivot_wider(names_from = Year, values_from = `GDP per capita (constant 2005 US$)`)%>% #new columns for population for years 1960 and 2011
  mutate(`Percent Change in GDP` = ((`2011` - `1960`)/`1960`)*100 )%>% # new column calculating percent change in GDP
  arrange(desc(`Percent Change in GDP`))%>% #arrange from high to low
  head(10) #select top 10 values

write_csv(indicators_GDP_change, "indicators_GDP_change.csv")

#top ten countries by percent change in population for graph
indicators_pop_change <- indicators_project%>%
  filter(Year == 1960 | Year == 2011)%>% #filters out years except 1960 and 2011
  filter(CountryName %in% countries_1960_2011)%>%  #filters out countries that dont have data for 1960 and 2011
  select(!c(`CO2 emissions (metric tons per capita)`,`GDP per capita (constant 2005 US$)`))%>% #remove Co2 emissions and GDP variables
  pivot_wider(names_from = Year, values_from = `Population, total`)%>% #new columns for population for years 1960 and 2011 
  mutate(`Percent Change in Pop` = ((`2011` - `1960`)/`1960`)*100)%>% # new column calculating percent change in population
  arrange(desc(`Percent Change in Pop`))%>% #arrange from high to low
  head(10)#select top 10 values

write_csv(indicators_pop_change, "indicators_pop_change.csv")


##############################################################
##############################################################
## Data processing for task 2

#top 5 countries by percent change in GDP(actual countries selected)
top_5_GDP <- indicators_project%>%
  filter(Year == 1960 | Year == 2011)%>% #filters out years except 1960 and 2011
  filter(CountryName %in% countries_1960_2011)%>% #filters out countries that dont have data for 1960 and 2011
  select(!c(`CO2 emissions (metric tons per capita)`,`Population, total`))%>% #remove Co2 emissions and population variables
  pivot_wider(names_from = Year, values_from = `GDP per capita (constant 2005 US$)`)%>% #new columns for population for years 1960 and 2011
  mutate(`Percent Change in GDP` = ((`2011` - `1960`)/`1960`)*100 )%>% # new column calculating percent change in GDP
  arrange(desc(`Percent Change in GDP`))%>% #arrange from high to low
  head(5) #select top 5 values
  

#top 5 countries by percent change in population( for graph (actual countries selected)
top_5_pop <- indicators_project%>%
  filter(Year == 1960 | Year == 2011)%>% #filters out years except 1960 and 2011
  filter(CountryName %in% countries_1960_2011)%>%  #filters out countries that dont have data for 1960 and 2011
  select(!c(`CO2 emissions (metric tons per capita)`,`GDP per capita (constant 2005 US$)`))%>% #remove Co2 emissions and GDP variables
  pivot_wider(names_from = Year, values_from = `Population, total`)%>% #new columns for population for years 1960 and 2011 
  mutate(`Percent Change in Pop` = ((`2011` - `1960`)/`1960`)*100)%>% #new column calculating percent change in population
  arrange(desc(`Percent Change in Pop`))%>% #arrange from high to low
  head(5)

countries_used <- bind_rows(top_5_GDP, top_5_pop)%>% #combine the top 5 countries from each category
  arrange(CountryName)%>% #arrange alphabetically
  pull(CountryName) #create vector of country names


#data for Co2 by year time series
indicators_co2_by_year<- indicators_project%>%
  select(c(CountryName,`CO2 emissions (metric tons per capita)`,`Year`))%>% #select only Co2 emissions and year columns
  filter(CountryName %in% countries_used)%>%
  arrange(CountryName)

write_csv(indicators_co2_by_year, "indicators_co2_by_year.csv")


###########################################################
###########################################################
## data processing for task 3

#top 5 countries by percent change in GDP(actaul countries selected)
top_5_GDP_vec <- indicators_project%>%
  filter(Year == 1960 | Year == 2011)%>% #filters out years except 1960 and 2011
  filter(CountryName %in% countries_1960_2011)%>% #filters out countries that dont have data for 1960 and 2011
  select(!c(`CO2 emissions (metric tons per capita)`,`Population, total`))%>% #remove Co2 emissions and population variables
  pivot_wider(names_from = Year, values_from = `GDP per capita (constant 2005 US$)`)%>% #new columns for population for years 1960 and 2011
  mutate(`Percent Change in GDP` = ((`2011` - `1960`)/`1960`)*100 )%>% # new column calculating percent change in GDP
  arrange(desc(`Percent Change in GDP`))%>% #arrange from high to low
  head(5)%>% #select top 5 values
  pull(CountryName)


#top 5 countries by percent change in population( for graph (actual countries selected)
top_5_pop_vec <- indicators_project%>%
  filter(Year == 1960 | Year == 2011)%>% #filters out years except 1960 and 2011
  filter(CountryName %in% countries_1960_2011)%>%  #filters out countries that dont have data for 1960 and 2011
  select(!c(`CO2 emissions (metric tons per capita)`,`GDP per capita (constant 2005 US$)`))%>% #remove Co2 emissions and GDP variables
  pivot_wider(names_from = Year, values_from = `Population, total`)%>% #new columns for population for years 1960 and 2011 
  mutate(`Percent Change in Pop` = ((`2011` - `1960`)/`1960`)*100)%>% #new column calculating percent change in population
  arrange(desc(`Percent Change in Pop`))%>% #arrange from high to low
  head(5)%>%
  pull(CountryName)

percent_change_Co2<-indicators_project%>%
  filter(Year %in% c(1960, 1970, 1980, 1990, 2000, 2011), CountryName %in% countries_used)%>% #select the start of each decade
  select(!c(`GDP per capita (constant 2005 US$)`, `Population, total`))%>% #remove unnecessary columns
  arrange(CountryName)%>% #arrange in alphabetical order
  pivot_wider(names_from = Year, values_from = `CO2 emissions (metric tons per capita)`)%>% #pivot to perform calc over several columns
  mutate(`60-70` = round(((`1970` - `1960`)/`1960`)*100,3), #percent change for each decade
         `70-80` = round(((`1980` - `1970`)/`1970`)*100,3),
         `80-90` = round(((`1990` - `1980`)/`1980`)*100,3),
         `90-00` = round(((`2000` - `1990`)/`1990`)*100,3),
         `00-11` = round(((`2011` - `2000`)/`2000`)*100,3)
         )%>%
  select(!c(`1960`, `1970`,`1980`,`1990`,`2000`,`2011`))%>%
  pivot_longer(c(`60-70`, 
                 `70-80`,
                 `80-90`, 
                 `90-00`, 
                 `00-11`), 
               names_to = 'Decade', 
               values_to = 'Percent Change Co2 by Decade')

percent_change_GDP<-indicators_project%>%
  filter(Year %in% c(1960, 1970,1980,1990,2000,2011), CountryName %in% top_5_GDP_vec)%>% #select the start of each decade
  select(!c(`CO2 emissions (metric tons per capita)`, `Population, total`))%>% #remove unnecessary columns
  arrange(CountryName)%>% #arrange in alphabetical order
  pivot_wider(names_from = Year, values_from = `GDP per capita (constant 2005 US$)`)%>% #pivot to perform calc over several columns
  mutate(`60-70` = round(((`1970` - `1960`)/`1960`)*100,3), #percent change for each decade
         `70-80` = round(((`1980` - `1970`)/`1970`)*100,3),
         `80-90` = round(((`1990` - `1980`)/`1980`)*100,3),
         `90-00` = round(((`2000` - `1990`)/`1990`)*100,3),
         `00-11` = round(((`2011` - `2000`)/`2000`)*100,3)
         )%>%
  select(!c(`1960`, `1970`,`1980`,`1990`,`2000`,`2011`))%>% #remove column that have values for a particular year
  pivot_longer(c(`60-70`, 
                 `70-80`,
                 `80-90`, 
                 `90-00`, 
                 `00-11`), 
               names_to = 'Decade', 
               values_to = 'Percent Change GDP by Decade') # values for each decade in their own column

percent_change_pop<-indicators_project%>%
  filter(Year %in% c(1960, 1970,1980,1990,2000,2011), CountryName %in% top_5_pop_vec)%>% #select the start of each decade
  select(!c(`CO2 emissions (metric tons per capita)`, `GDP per capita (constant 2005 US$)`))%>% #remove unnecessary columns
  arrange(CountryName)%>% #arrange in alphabetical order
  pivot_wider(names_from = Year, values_from = `Population, total`)%>% #pivot to perform calc over several columns
  mutate(`60-70` = round(((`1970` - `1960`)/`1960`)*100,3), #percent change for each decade
         `70-80` = round(((`1980` - `1970`)/`1970`)*100,3),
         `80-90` = round(((`1990` - `1980`)/`1980`)*100,3),
         `90-00` = round(((`2000` - `1990`)/`1990`)*100,3),
         `00-11` = round(((`2011` - `2000`)/`2000`)*100,3)
         )%>%
  select(!c(`1960`, `1970`,`1980`,`1990`,`2000`,`2011`))%>% #remove rows that have values for a particualr year
  pivot_longer(c(`60-70`, 
                 `70-80`,
                 `80-90`, 
                 `90-00`, 
                 `00-11`), 
               names_to = 'Decade', 
               values_to = 'Percent Change Population by Decade') #value for a particular decade into their own column

#data with GDP and Co2 and population and Co2

#data set with percent change in Co2 and Percent change in GDP
co2_GDP<-percent_change_Co2%>%
  inner_join(percent_change_GDP,
             by = c('CountryName','Decade'))%>% #inner join with GDP data
  filter(`Percent Change Co2 by Decade`<300, 
         `Percent Change GDP by Decade` <200)%>%#this removes outliers as identified in chart, drastically changes slope
  mutate(gdp = 'GDP Per Capita')
  
# data set with percent change in C02 and Percent Change in Population
co2_pop<-percent_change_Co2%>%
  inner_join(percent_change_pop, 
             by = c('CountryName','Decade'))%>% #innner join with population data
  filter(`Percent Change Co2 by Decade`<300, 
         `Percent Change Population by Decade` <200)%>% #this removes outliers as identified in chart, drastically changes slope
  mutate(pop = 'Total Population')
  
write_csv(co2_GDP, "co2_GDP.csv")
write_csv(co2_pop, "co2_pop.csv")

  
#fit linear models to pop and GDP comparisons to Co2 

gdp_fit<-lm(`Percent Change Co2 by Decade`~`Percent Change GDP by Decade`, data = co2_GDP)

pop_fit<-lm(`Percent Change Co2 by Decade`~`Percent Change Population by Decade`, data = co2_pop)

#didnt end up using formula on chart, wanted only visualization, not text, to accomplish task.
#create string of formulas to print on chart
#started with actual formula(this is commented out), moved to just listing slope of line
# formula_gdp = paste('Co2 = ',
#                     as.character(round(gdp_fit$coefficients[2],3)),
#                     'x%GDP + ',as.character(round(gdp_fit$coefficients[1],3)),
#                     sep = '')
# 
# formula_pop = paste('Co2 = ',
#                     as.character(round(pop_fit$coefficients[2],3)),
#                     'x%Pop - ',as.character(round(abs(pop_fit$coefficients[1]),3)),
#                     sep = '')

#slope of line for each variable
formula_gdp = paste('Slope of GDP line  = ',
                    as.character(round(gdp_fit$coefficients[2],3)),
                    sep = '')

formula_pop = paste('Slope of Population line = ',
                    as.character(round(pop_fit$coefficients[2],3)),
                    sep = '')

