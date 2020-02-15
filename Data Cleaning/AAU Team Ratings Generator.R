

setwd('~/Honors Thesis/Clean Data')

library(readr)
library(tidyverse)

aau.data.clean = read_csv(file = 'aau.data.clean.csv')

aau.data.clean$player.id = gsub('-jr', 'jr', aau.data.clean$player.id)
aau.data.clean$player.id = gsub('-ii', 'ii', aau.data.clean$player.id)
aau.data.clean$player.id = gsub('-iii', 'iii', aau.data.clean$player.id)
aau.data.clean$player.id = gsub('-iv', 'iv', aau.data.clean$player.id)

# for data manipulation
library(tidyverse)

# for easy dummy variable creation
library(fastDummies)

#### End ####


#### Create a dataset of dummy variables with the team names as indicators ####
aau.data.clean$Away.Team = gsub('(L)', '', aau.data.clean$Away.Team, fixed = T)
aau.data.clean$Home.Team = gsub('(L)', '', aau.data.clean$Home.Team, fixed = T)

aau.data.clean$Away.Team = gsub('(W)', '', aau.data.clean$Away.Team, fixed = T)
aau.data.clean$Home.Team = gsub('(W)', '', aau.data.clean$Home.Team, fixed = T)


aau.data.clean$Away.Team = tolower(aau.data.clean$Away.Team)
aau.data.clean$Home.Team = tolower(aau.data.clean$Home.Team)

aau.data.clean$Away.Team = word(aau.data.clean$Away.Team, start = 1,
                                end = 1, sep = fixed("("))

aau.data.clean$Home.Team = word(aau.data.clean$Home.Team, start = 1,
                                end = 1, sep = fixed("("))

aau.data.clean$Away.Team = gsub(' ', '', aau.data.clean$Away.Team, fixed = T)
aau.data.clean$Home.Team = gsub(' ', '', aau.data.clean$Home.Team, fixed = T)

team.names = dummy_cols(aau.data.clean, select_columns = c('Away.Team', 'Home.Team'))
away.cols = team.names[,which(grepl('Away.Team_',colnames(team.names)))]

#### End ####


#### For each team, if they were playing in the game as away team, change from 1 to -1 ####

for(j in 1:ncol(away.cols)){
  away.cols[,j] = ifelse(away.cols[,j] == 1, -1, 0)
}

#### End ####


#### Create a new aau.data.cleanset: team.cols, which has 1 col per team (rather than 2) ####

home.cols = team.names[,which(grepl('Home.Team_',colnames(team.names)))]
colnames(home.cols) = gsub('Home.Team_', '', colnames(home.cols))
colnames(away.cols) = gsub('Away.Team_', '', colnames(away.cols))
away.cols = away.cols[,order(colnames(away.cols))]
home.cols = home.cols[,order(colnames(home.cols))]
away.cols = as.data.frame(away.cols)
home.cols = as.data.frame(home.cols)
