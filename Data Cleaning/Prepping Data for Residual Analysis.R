library(readr)
library(tidyverse)
library(caret)
library(caretEnsemble)





data = read_csv('~/Honors Thesis/Clean Data/espn.bball-ref.aau.prep(updated).csv')


#2 wrong players scraped#
data = data %>% dplyr::filter(Season != 1993 & Season != 2014 & Season != 2020)

# nums = nums <- unlist(lapply(data, is.numeric))  
# x = data[,nums]
# View(cor(x, use = 'pairwise.complete.obs'))

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


data = as.data.frame(data)

data = data %>% group_by(Season, group) %>% dplyr::mutate(group.num = n())

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
                                            -g,
                              -Weight,
                              -fixed.height,
                              -dws,
                              -Name,
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


data = data %>% dplyr::select(
                              -pf.aau,
                              -to.aau,
                              -given.pts.aau,
                              -threep.made.aau,
                              -max.pts.aau,
                              -ft.made.aau,
                              -fg.made.aau
                              )
# ggplot(data, aes(, ws)) + 
#   #facet_grid(Position ~ .) + 
#   geom_point() + geom_smooth()


#getting rid of some prep stats not in current aau summary and weren't predictive


scat.data = data %>% dplyr::select(`FT%.prep`,
                                   `3P%.prep`,
                                   fg.prep,
                                   apg.prep,
                                   ws)
#scat.data = scat.data %>% dplyr::select(-g)


data = data %>% dplyr::select(-`FT%.prep`,
                              -`3P%.prep`,
                              -fg.prep,
                               -HIGH.prep,
                              -tov.prep,
                              -apg.prep,
                               -spg.prep,
                              -blk.prep,
                              -mpg.prep,
                              -reb.prep
                              )

#getting rid of max pts variable
# data = data %>% dplyr::select(-HIGH.prep,
#                               -max.pts.aau)

#data$BMI = data$fixed.height / data$Weight
                              
nums = nums <- unlist(lapply(data, is.numeric))  
x = data[,nums]
#View(cor(x, use = 'pairwise.complete.obs'))
#renaming some columns                     
colnames(data)[which(colnames(data) == 'gp.max.prep')] = 'GamesPlayed.prep'

data$GamesPlayed.aau = games.played.aau

#colnames(data)[colnames(data)=="fixed.height"] <- "Height"

# ggplot(data, aes(x = spg.prep, y = ws, colour = Position)) +
#   geom_point() +
#   facet_grid(Position ~ .) +
#   geom_smooth()
data = data[complete.cases(data),]



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
data = setnames(data, old = c('ppg.prep'), 
                new = c('Points.prep'))


#changing aau columns
data = setnames(data, old = c('pts.aau',
                              'mp.aau',
                              'reb.aau',
                              'blk.aau',
                              'stl.aau'), 
                new = c('Points.aau',
                        'Minutes.aau',
                        'Rebounds.aau',
                        'Blocks.aau',
                        'Steals.aau'))



# data$Position.Basic = ifelse(data$Position %in% c('PG', 'SG'),
#                              'G', 0)
# 
# data$Position.Basic = ifelse(data$Position %in% c('SF', 'PF'),
#                              'F', data$Position.Basic)
# 
# 
# data$Position.Basic = ifelse(data$Position == 'C',
#                              'C', data$Position.Basic)

data$Position.Basic = as.factor(data$Position)

data$Position = as.factor(data$Position)
data$Position = plyr::revalue(data$Position,
                              c(
                                'PG' = 1,
                                'SG' = 2,
                                'SF' = 3,
                                'PF' = 4,
                                'C' = 5))


data$Position = as.numeric(data$Position)
data = data %>% dplyr::select(-Position)


#### Creating ESPN dataset ####

espn = data %>% dplyr::select(ws,
                              Season,
                              `player.id`,
                              espn.rating)

espn = espn[complete.cases(espn),]


espn.win.shares = espn$ws





#espn.scat.data = espn %>% dplyr::select(-Position.Basic)

#### End ####


#### Creating a dataset with all information ####

full = data[complete.cases(data),]

full.win.shares = full$ws



full = full %>% dplyr::select(ws, everything())
#### End ####


#### Creating ESPN and Prep dataset ####

prep.espn = data[,-c(which(grepl('aau', colnames(data))))]

prep.espn = prep.espn[complete.cases(prep.espn),]

prep.espn.win.shares = prep.espn$ws



prep.espn = prep.espn %>% dplyr::select(ws, everything())

#### End ####


#### Creating aau and espn dataset ####
aau.espn = data[,-c(which(grepl('prep', colnames(data))))]

aau.espn = aau.espn[complete.cases(aau.espn),]

aau.espn.win.shares = aau.espn$ws



aau.espn = aau.espn %>% dplyr::select(everything())


#### End ####

#### Creating AAU and Prep Dataset ####
aau.prep = data[,-c(which(grepl('espn', colnames(data))))]

aau.prep = aau.prep[complete.cases(aau.prep),]

aau.prep.win.shares = aau.prep$ws



aau.prep = aau.prep %>% dplyr::select(everything())

#### End ####

#### creating prep dataset ####
prep = data[,which(grepl('prep', colnames(data)))]

prep = cbind(data$ws, 
             data$Position.Basic, 
             prep)
colnames(prep)[1:2] = c('ws','Position.Basic')

prep = prep[complete.cases(prep),]


prep.win.shares = prep$ws



# prep = prep %>% dplyr::select(ws,
#                               Points.prep,
#                               Blocks.prep,
#                               Steals.prep,
#                               GamesPlayed.prep,
#                               Position.Basic)

prep.scat.data = prep %>% dplyr::select(-Position.Basic)

#### End ####


#### creating aau dataset ####
aau = data[,which(grepl('aau', colnames(data)))]


aau = cbind(data$ws,data$Position.Basic,
            aau)

colnames(aau)[1:2] = c('ws', 'Position.Basic')


aau = aau[complete.cases(aau),]

aau.win.shares = aau$ws





# aau = aau %>% dplyr::select(ws,
#                             Points.aau,
#                             Minutes.aau,
#                             Rebounds.aau,
#                             Blocks.aau,
#                             Steals.aau,
#                             GamesPlayed.aau,
#                             Position.Basic)

aau.scat.data = aau %>% dplyr::select(-Position.Basic)






#### End ####

#### Converting all tbl to dataframes - causaed many issues! ####

espn = as.data.frame(espn)
aau = as.data.frame(aau)
prep = as.data.frame(prep)
full = as.data.frame(full)
aau.prep = as.data.frame(aau.prep)
aau.espn = as.data.frame(aau.espn)
prep.espn = as.data.frame(prep.espn)

#### End ####



#### adding a dataset variable (for saving models conditionally) ####

espn$dataset = 'espn'
aau$dataset = 'aau'
prep$dataset = 'prep'
full$dataset = 'full'
aau.prep$dataset = 'aau.prep'
aau.espn$dataset = 'aau.espn'
prep.espn$dataset = 'prep.espn'

#### End ####

ggplot(full, aes(x = espn.rating, y = ws)) + geom_point()
ggplot(full, aes(x = Points.aau, y = ws)) + geom_point()