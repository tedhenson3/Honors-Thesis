
setwd('~/Honors Thesis/Clean Data')

options(readr.num_columns = 0)

set.seed(200)
#load in readr to easily load in csvs

#read in tidyverse package for easy data manipulation

library(readr)
library(tidyverse)



data <- read_csv("recruit.college.15-18(updated).csv")

colnames(data)[colnames(data) == 'Rating'] <- 'espn.rating'






data = data %>% dplyr::arrange(player.id, Season)

library(dplyr)

feet = as.numeric(substr(data$Height, 1, 1))

inches = as.numeric(gsub("'", "", substr(data$Height, 3, 4)))

data$fixed.height = (feet*12) + inches



data$player.id = word(data$player.id, start = 1, end = -2, sep = '-')


data = data %>% 
  group_by(Name) %>% 
  filter(row_number()==1)
data = data %>% dplyr::arrange(desc(ws))


#verify only last college season
zion = data %>% dplyr::filter(Name == 'Zion Williamson')


prep = read_csv('Prep.Total.Final.Year.csv')



# misses = data[which(!(data$player.id %in% prep$player.id)), c('player.id',
#                                                               'espn.rating',
#                                                               'Season')]
# 
# 
# 
# misses = aau[which(!(aau$player.id %in% data$player.id)), c('player.id',
#                                                               'aau.sum.pts',
#                                                               'Season')]

#select only bball ref variables of interest


data = data %>% select(Name, player.id, Season,
                       ws, ows, dws, g,
                       espn.rating, fixed.height, Weight,
                       Position
                       )


#select only bball ref variables of interest

prep = prep %>% select(-Name, -TEAM.prep)



data = left_join(data, prep, by = c('player.id', 'Season'))

aau = read_csv('aau.season.summaries.csv')



#aau = aau %>% select(-Player)

data = left_join(x = data, y = aau, by = c('player.id', 'Season'))


#2 wrong players scraped#
data = data %>% dplyr::filter(Season != 1993 &
                                Season != 2014)

write.csv(data, 'espn.bball-ref.aau.prep(updated).csv', row.names = F)



## take out 2016 as all have NA values



