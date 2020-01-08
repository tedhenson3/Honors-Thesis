
#### Run the Prepping Data Script to generate the different datasets ####

source('~/Honors Thesis/Data Cleaning/Prepping Data for Modeling.R')

#### End ####


#### load packages ####

library(psych)

#### End ####

#### response variable histograms, scatters, correlation values ####

hist(espn.win.shares)
hist(espn$ws.per.game)

#scatter of win shares and games
plot(y = espn.win.shares,
     x = espn.games)

plot(y = espn$ws.per.game,
     x = espn.games)
cor(espn.win.shares, espn.games)
cor(espn$ws.per.game, espn.games)

#### End ####


#### Histograms of predictor variables ####

multi.hist(espn.scat.data)
multi.hist(prep.scat.data)
multi.hist(aau.scat.data)

#### End ####


#### Scatters for each dataset ####


espn.scat.plot = pairs(ws.per.game ~ .,
                       espn.scat.data)
espn.scat.plot

prep.scat.plot = pairs(ws.per.game ~ .,
                      prep.scat.data)
prep.scat.plot

aau.scat.plot = pairs(ws.per.game ~ .,
                  aau.scat.data)
aau.scat.plot

#### End ####