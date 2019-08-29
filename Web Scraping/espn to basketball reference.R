library(tidyverse)
setwd('~/Honors Thesis/Raw Data')

library(readr)
#rankings.espn <- read_csv(file = 'rankings.espn.csv')

# rankings.247 <- read_csv(file = 'rankings.247.csv')
# 
# 
# espn.247 <- full_join(rankings.espn, rankings.247, by = "player.id", 
#                       suffix = c(".espn", ".247"))
# 
# 

#ask Dr Mario what to do


espn.247 <- read_csv(file = 'espn.2018.csv')


espn.247$School = gsub('San Jos\xe9 St', 'San Jose State', espn.247$School)


espn.247$School = gsub('W Michichan', "Western Michigan", espn.247$School)

espn.247$School <- gsub("Oklahoma St", "Oklahoma State", espn.247$School)
espn.247$Name = gsub("Ray Robinson", "Raynard Robinson", espn.247$Name)

espn.247$Name = gsub("Jagan Mosley", "Jagan Mosely", espn.247$Name)


espn.247$Name = gsub("Jeremy Carter-Sheppard", "Jeremy Sheppard", espn.247$Name)

espn.247$Name = gsub("Ryan Swan", "Ryan Swan-Ford", espn.247$Name)

espn.247$Name = gsub("Jaekwon Carlisle", "Jaekwon Carliyle", espn.247$Name)





 
espn.247$School <- gsub("North Carolina", "UNC", espn.247$School)

espn.247$School <- gsub("S Carolina", "South Carolina", espn.247$School)


espn.247$School <- gsub("Miss. St", "Mississippi State", espn.247$School)

espn.247$School <- gsub("W Kentucky", "Western Kentucky", espn.247$School)

espn.247$School <- gsub("W Kentucky", "Western Kentucky", espn.247$School)



espn.247$School <- gsub("East Tennessee State", "ETSU", espn.247$School)


espn.247$School = gsub("G. Washington", "George Washington", espn.247$School)

espn.247$School = gsub("St. Francis (BKN)", "St. Francis (NY)", espn.247$School)

espn.247$School = gsub("St Mary's", "Saint Mary's", espn.247$School)



espn.247$School = gsub("Nrthwestrn", "Northwestern", espn.247$School)

espn.247$School =  gsub("LIU Brooklyn", "LIU-Brooklyn", espn.247$School)

espn.247$School = gsub('Cent Connecticut', 'Central Connecticut')

espn.247$School = gsub('UC Santa Barbara', 'UCSB', espn.247$School)


espn.247$bball.ref.link.espn = gsub('https://www.sports-reference.com/cbb/players/trevor-manuel-1.html',
                                    'https://www.sports-reference.com/cbb/players/trevor-manual-1.html',
                                    espn.247$bball.ref.link.espn)
#https://www.sports-reference.com/cbb/players/pierfrancesco-oliva-1.html

#https://www.sports-reference.com/cbb/players/xeryius-williams-1.html

espn.247$Name = gsub('Donte Fitzpatrick', 'Donte Fitzpatrick-Dorsey', espn.247$Name)

espn.247$Name = gsub('St. Francis (PA)', 'Saint Francis (PA)', espn.247$School)

espn.247$School = gsub('N Illinois', "NIU", espn.247$School)


espn.247$School <- ifelse(substr(espn.247$School, 
                                 nchar(espn.247$School)-1, 
                                 nchar(espn.247$School)) == 'St', 
                          gsub(" St", " State", espn.247$School), espn.247$School)

espn.247$School <- ifelse(substr(espn.247$School, 
                                 1, 
                                 2) == 'N ', 
                          gsub("N ", "North ", espn.247$School), espn.247$School)

espn.247$School <- ifelse(substr(espn.247$School, 
                                 1, 
                                 2) == 'E ', 
                          gsub("E ", "East ", espn.247$School), espn.247$School)

espn.247$School <- ifelse(substr(espn.247$School, 
                                 1, 
                                 2) == 'W ', 
                          gsub("W ", "West ", espn.247$School), espn.247$School)

espn.247$School <- ifelse(substr(espn.247$School, 
                                 1, 
                                 2) == 'S ', 
                          gsub("S ", "South ", espn.247$School), espn.247$School)

unique(espn.247$School)


library(tidyverse)


#Loyola (MD) issue
#View(espn.247)

source("~/Honors Thesis/Web Scraping/basketball reference win share scraper.R")

espn.247 <- espn.247 %>% filter(!is.na(Name) & School != 'unknown')

rownames(espn.247) <- NULL
colnames(espn.247)[10] <- paste(colnames(espn.247)[10], 'espn', sep = ".")


basketballdata <- wsscraper(data = espn.247)


write.csv(basketballdata, file = 'espn.success.2018.csv', row.names = F)
