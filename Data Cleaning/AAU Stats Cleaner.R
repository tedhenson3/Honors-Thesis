setwd('~/Honors Thesis/Raw Data')

stats.names = c('Player', 
                'Stat.Team',
                'Home.Team',
                'Away.Team',
                'Season',
                'Circuit',
                'MP', 'FG', '3P', 'FT', 'REB', 'AST', 'STL', 'BLK', 'TO', 'PF', 'PTS')
                          

library(readr)
adidas.17 <- read_csv("aau.stats.adidas.17.csv")
adidas.18 = read_csv("aau.stats.adidas.18.csv")
adidas.19 = read_csv("aau.stats.adidas.19.csv")

adidas = rbind(adidas.17, adidas.18, adidas.19)
adidas$Circuit = 'Adidas'

ua.17 <- read_csv("aau.stats.under.armour.17.csv")
ua.18 = read_csv("aau.stats.under.armour.18.csv")
ua.19 = read_csv("aau.stats.under.armour.19.csv")

ua = rbind(ua.17, ua.18, ua.19)
ua$Circuit = 'Under Armour'

nike.16 = read_csv('aau.stats.nike.16.csv')
nike.17 = read_csv('aau.stats.nike.17.csv')
nike.18 = read_csv('aau.stats.nike.18.csv')
nike.19 = read_csv('aau.stats.nike.19.csv')
nike = rbind(nike.16, nike.17, nike.18, nike.19)
nike$Circuit = 'Nike'

aau  = rbind(ua, nike, adidas)


Player = aau[seq(from = 1, by = 12, to = nrow(aau)),'Stats']

MP = aau[seq(from = 2, by = 12, to = nrow(aau)),'Stats']

FG = aau[seq(from = 3, by = 12, to = nrow(aau)),'Stats']

threeP = aau[seq(from = 4, by = 12, to = nrow(aau)),'Stats']

FT = aau[seq(from = 5, by = 12, to = nrow(aau)),'Stats']

REB = aau[seq(from = 6, by = 12, to = nrow(aau)),'Stats']
AST = aau[seq(from = 7, by = 12, to = nrow(aau)),'Stats']

STL = aau[seq(from = 8, by = 12, to = nrow(aau)),'Stats']

BLK = aau[seq(from = 9, by = 12, to = nrow(aau)),'Stats']

TO = aau[seq(from = 10, by = 12, to = nrow(aau)),'Stats']

PF = aau[seq(from = 11, by = 12, to = nrow(aau)),'Stats']
PTS = aau[seq(from = 11, by = 12, to = nrow(aau)),'Stats']

Stat.Team = aau[seq(from = 1, by = 12, to = nrow(aau)),'Stat.Team']

Home.Team = aau[seq(from = 1, by = 12, to = nrow(aau)),'Home.Team']
Away.Team = aau[seq(from = 1, by = 12, to = nrow(aau)),'Away.Team']
Season = aau[seq(from = 1, by = 12, to = nrow(aau)), 'Season']
Circuit = aau[seq(from = 1, by = 12, to = nrow(aau)), 'Circuit']



aau.data.clean = cbind(Player,
                       Stat.Team,
                       Home.Team,
                       Away.Team,
                       Season,
                       Circuit,
                       MP, FG, threeP, FT, REB, AST, STL, BLK, TO, PF, PTS)
names(aau.data.clean) = stats.names


setwd('~/Honors Thesis/Clean Data')

write.csv(aau.data.clean, file = 'aau.data.clean.csv', row.names = F)




