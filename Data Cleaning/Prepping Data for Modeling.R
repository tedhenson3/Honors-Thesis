library(readr)
library(tidyverse)
library(caret)
library(caretEnsemble)





data = read_csv('~/Honors Thesis/Clean Data/espn.bball-ref.aau.prep.csv')


#2 wrong players scraped#
data = data %>% dplyr::filter(Season != 1993 & Season != 2014)


# this prior hypothesis is no longer believed to be true:
# # adding in recreated per game prep stats 
# as given per game statistics are inaccurate

# data = data %>% mutate(
#   ppg.actual.prep = c(PTS.prep / gp.max.prep),
#   mpg.actual.prep = c(MIN.prep / gp.max.prep),
#   blkg.actual.prep = c(BLK.prep / gp.max.prep),
#   stlg.actual.prep = c(STL.prep / gp.max.prep),
#   astg.actual.prep = c(AST.prep / gp.max.prep),
#   tov.actual.prep = c(TO.prep / gp.max.prep),
#   rebg.actual.prep = c(REB.prep / gp.max.prep),
#   `3pmg.actual.prep` = c(`3PM.prep` / gp.max.prep),
#   fgmg.actual.prep = c(FGM.prep / gp.max.prep),
#   ftmg.actual.prep = c(FTM.prep / gp.max.prep),
#   `3pm.actual.prep` = c(`3PM.prep` * `3P%.prep`),
#   fgm.actual.prep = c(FGM.prep * fg.prep),
#   ftm.actual.prep = c(FTM.prep * `FT%.prep`)
# )



data$group <- ifelse(is.na(data$ppg.prep) & !is.na(data$pts.aau),
                     'Only AAU', NA)


data$group <- ifelse(!is.na(data$ppg.prep) & is.na(data$pts.aau),
                     'Only Prep',
                     data$group)


data$group <- ifelse(!is.na(data$ppg.prep) & !is.na(data$pts.aau),
                     'Prep and AAU',
                     data$group)


data$group <- ifelse(is.na(data$group),
                     'Neither',
                     data$group)


data = data %>% group_by(Season, group) %>% mutate(group.num = n())

data.for.graph = data




#### Getting rid of variables for all models ####

#saving these for later in case needed later
ows = data$ows
dws = data$dws
name = data$Name
player.id = data$player.id
weight = data$Weight

#creating for top ws table
data.ws = data


#getting rid of some bio stuff
data = data %>% ungroup() %>% dplyr::select(-ows,
                                            -Season,
                              -dws,
                              -Name,
                              -Weight,
                              -player.id,
                              -group,
                              -group.num)


#getting rid of total prep stats
data = data %>% dplyr::select(-gp.reb.prep,
                              -gp.ppg.prep,
                              -gp.misc.prep,
                              -gp.min.prep,
                              -gp.average.prep,
                              -REB.prep,
                              -MIN.prep,
                              -PTS.prep,
                              -AST.prep,
                              -FTA.prep,
                              -FTM.prep,
                              -`3PM.prep`,
                              -`3PA.prep`,
                              -`FGA.prep`,
                              -`FGM.prep`,
                              -`STL.prep`,
                              -`BLK.prep`,
                              -`TO.prep`)


#getting rid of total aau stats other than games
games.played.aau = data$total.games.aau


data = data[,-c(which(grepl('total.', colnames(data))))]


#getting rid of some more aau stats not in prep
data = data %>% dplyr::select(-given.pts.aau,
                              -pf.aau,
                              -threep.made.aau,
                              -ft.made.aau,
                              -fg.made.aau)

#getting rid of some prep stats not in current aau summary

data = data %>% dplyr::select(-`FT%.prep`,
                              -`3P%.prep`,
                              -fg.prep,
                              -apg.prep)

#getting rid of max pts variable
data = data %>% dplyr::select(-HIGH.prep,
                              -max.pts.aau)

                              
         
#renaming some columns                     
colnames(data)[which(colnames(data) == 'gp.max.prep')] = 'GamesPlayed.prep'

data$GamesPlayed.aau = games.played.aau

colnames(data)[colnames(data)=="fixed.height"] <- "Height"




data$ws.per.game = data$ws / data$g




#### High School Stat manipulations (commented for now) ####
# 
# #AAU PTS PER MIN
# data$pts.per.min.aau = data$total.pts.aau / data$total.mp.aau
# 
# 
# #need to justify later
# data$pts.per.min.aau = ifelse(is.infinite(data$pts.per.min.aau),
#                               NA,
#                               data$pts.per.min.aau)
# 
# #HIGH SCHOOL POINTS
# 
# data$total.pts.high.school = data$PTS.prep + data$total.pts.aau
# 
# data$ppg.high.school = (data$total.pts.high.school) /
#   (data$gp.ppg.prep + data$total.games.aau)
# 
# data$mean.pts.high.school = (data$ppg.prep + data$pts.aau) / 2
# 
# 
# #HIGH SCHOOL REBOUNDS
# 
# data$total.rebs.high.school = data$REB.prep + data$total.reb.aau
# 
# data$rebs.high.school = data$total.rebs.high.school /
#   (data$total.games.aau + data$gp.reb.prep)
# 
# 
# #HIGH SCHOOL BLOCKS
# 
# data$total.blks.high.school = data$blk.aau + data$BLK.prep
# 
# data$blks.high.school = data$total.blks.high.school /
#   (data$total.games.aau + data$gp.misc.prep)
# 
# 
# 
# 
# #HIGH SCHOOL STEALS
# 
# data$total.stls.high.school = data$STL.prep + data$total.stl.aau
# 
# data$stls.high.school = data$total.stls.high.school /
#   (data$total.games.aau + data$gp.misc.prep)
# 
# 
# 
# #HIGH SCHOOL FTs
# 
# data$total.fts.high.school = data$FTM.prep + data$total.ft.made.aau
# 
# data$fts.high.school = data$total.fts.high.school /
#   (data$total.games.aau + data$gp.ppg.prep)
# 
# 
# 
# 
# 
# 
# #HIGH SCHOOL MAX
# 
# # my.max = function(x) {
# #   return(max(x, na.rm = T))
# # }
# # 
# # data$max.pts.high.school = apply(X = data[, c('HIGH.prep', 'max.pts.aau')],
# #                                  FUN = my.max,
# #                                  MARGIN = c(1))
# # 
# # 
# # data$max.pts.high.school = ifelse(is.infinite(data$max.pts.high.school),
# #                                   NA,
# #                                   data$max.pts.high.school)
# 
# 
# 
# #HIGH SCHOOL tos
# 
# data$total.tos.high.school = data$TO.prep + data$total.to.aau
# 
# data$tovs.high.school = data$total.tos.high.school /
#   (data$total.games.aau + data$gp.misc.prep)
# 
# 
# 
# #HIGH SCHOOL 3ps
# 
# data$total.3ps.high.school = data$`3PM.prep` + data$threep.made.aau
# 
# data$`3ps.high.school` = data$total.3ps.high.school /
#   (data$total.games.aau + data$gp.ppg.prep)
#
#data[,7:ncol(data)][data[,7:ncol(data)] == 0] <- NA

#### End ####



data = data %>% dplyr::select(ws,
                              Position,
                              everything())



library(data.table)
#changing prep columns names
data = setnames(data, old = c('ppg.prep',
                              'mpg.prep',
                              'reb.prep',
                              'blk.prep',
                              'spg.prep',
                              'tov.prep'), 
                new = c('Points.prep',
                        'Minutes.prep',
                        'Rebounds.prep',
                        'Blocks.prep',
                        'Steals.prep',
                        'Turnovers.prep'))


#changing aau columns
data = setnames(data, old = c('pts.aau',
                              'mp.aau',
                              'reb.aau',
                              'blk.aau',
                              'stl.aau',
                              'to.aau'), 
                new = c('Points.aau',
                        'Minutes.aau',
                        'Rebounds.aau',
                        'Blocks.aau',
                        'Steals.aau',
                        'Turnovers.aau'))



data$Position.Basic = ifelse(data$Position %in% c('PG', 'SG'),
                             'G', 0)

data$Position.Basic = ifelse(data$Position %in% c('SF', 'PF'),
                             'F', data$Position.Basic)


data$Position.Basic = ifelse(data$Position == 'C',
                             'C', data$Position.Basic)

data$Position = as.factor(data$Position)
data$Position = plyr::revalue(data$Position,
                              c(
                                'PG' = 1,
                                'SG' = 2,
                                'SF' = 3,
                                'PF' = 4,
                                'C' = 5))


data$Position = as.numeric(data$Position)


#### Creating ESPN dataset ####

espn = data %>% dplyr::select(ws.per.game,
                              Position,
                              Position.Basic,
                              Height,
                              espn.rating,
                              ws,
                              g)

espn = espn[complete.cases(espn),]


espn.win.shares = espn$ws

espn.games = espn$g

espn = espn %>% dplyr::select(-ws,
                              -g)

#### End ####


#### Creating a dataset with all information ####

full = data[complete.cases(data),]

full.win.shares = full$ws

full.games = full$g

full = full %>% dplyr::select(-ws,
                              -g)

#### End ####


#### creating prep dataset ####
prep = data[,which(grepl('prep', colnames(data)))]

prep = cbind(data$ws.per.game, data$Position,
             data$Position.Basic, data$Height, data$ws,
             data$g, 
             prep)
colnames(prep)[1:6] = c('ws.per.game', 'Position', 'Position.Basic', 'Height',
                        'ws', 'g')


prep = prep[complete.cases(prep),]


prep.win.shares = prep$ws

prep.games = prep$g


prep = prep %>% dplyr::select(ws.per.game,
                              Points.prep,
                              Minutes.prep,
                              Rebounds.prep,
                              Blocks.prep,
                              Steals.prep,
                              Turnovers.prep,
                              GamesPlayed.prep,
                              Position,
                              Position.Basic,
                              Height)

#### End ####


#### creating aau dataset ####
aau = data[,which(grepl('aau', colnames(data)))]


aau = cbind(data$ws.per.game,
            data$Position, data$Position.Basic, data$Height,
            data$ws, data$g,
            aau)

colnames(aau)[1:6] = c('ws.per.game', 'Position', 'Position.Basic', 'Height',
                       'ws', 'g')


aau = aau[complete.cases(aau),]

aau.win.shares = aau$ws

aau.games = aau$g




aau = aau %>% dplyr::select(ws.per.game,
                            Points.aau,
                            Minutes.aau,
                            Rebounds.aau,
                            Blocks.aau,
                            Steals.aau,
                            Turnovers.aau,
                            GamesPlayed.aau,
                            Position,
                            Position.Basic,
                            Height
)



#### End ####

