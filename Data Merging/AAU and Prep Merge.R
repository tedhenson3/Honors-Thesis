
setwd('~/Honors Thesis/Clean Data')

options(readr.num_columns = 0)

set.seed(200)
#load in readr to easily load in csvs
library(readr)

#read in tidyverse package for easy data manipulation
library(tidyverse)

#read in caret package for different model and resampling methods
library(caret)

#read in ggplot2 package for data visualization of model performance
library(ggplot2)


prep = read_csv('Prep.Total.Final.Year.csv')


#select only bball ref variables of interest




aau = read_csv('aau.season.summaries.csv')



aau = aau %>% select(-Player)

data = inner_join(x = prep, y = aau, by = c('player.id', 'Season'))


write.csv(data, 'aau.prep.csv', row.names = F)







