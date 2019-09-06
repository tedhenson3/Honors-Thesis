
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


prep.score = read_csv(file = 'prep.score.csv')

colnames(prep.score)[1] = 'Name'
colnames(prep.score)[3] = 'gp.ppg'
colnames(prep.score)[4] = 'ppg.prep'

colnames(prep.score)[7] = 'fg.prep'

prep.score = prep.score %>% dplyr::arrange(Name, Season)


# prep = prep %>% group_by(Name)   %>% mutate(ppg.lag =lag(ppg.prep, n = 1),
#                                             fg.lag = lag(fg.prep, n = 1),
#                                             gp.ppg.lag = lag(gp.ppg, n = 1))

#prep.score$Season.x = prep.score$Season + 1


prep.score = prep.score %>% arrange(Name, desc(Season), desc(gp.ppg))
prep.score = prep.score %>% 
  group_by(Name) %>% 
  filter(row_number()==1)

#checker
zion = prep.score %>% dplyr::filter(Name == 'Zion Williamson')





prep.minutes = read_csv('prep.minutes.csv')

colnames(prep.minutes)[3] = 'gp.min'

prep.minutes = prep.minutes %>% dplyr::arrange(player.id, Season)

# prep.minutes = prep.minutes %>% group_by(player.id)   %>% mutate(mpg.lag =lag(MPG, n = 1),
#                                                                  gp.min.lag = lag(gp.min, n = 1))

prep.minutes = prep.minutes %>% dplyr::select(Season, player.id, MPG, MIN, gp.min)

#prep.minutes$Season.x = prep.minutes$Season + 1

prep.minutes = prep.minutes %>% arrange(player.id, desc(Season), desc(gp.min))
prep.minutes = prep.minutes %>% 
  group_by(player.id) %>% 
  filter(row_number()==1)

colnames(prep.minutes)[3] = 'mpg.prep'


prep.misc = read_csv('prep.misc.csv')
prep.misc = prep.misc %>% dplyr::filter(!is.na(BLKPG))



prep.misc = prep.misc %>% dplyr::select(BLKPG, APG, SPG, TOPG, Season, player.id, GP,
                                        BLK, AST, STL, TO)
colnames(prep.misc)[7] = 'gp.misc'


prep.misc = prep.misc %>% dplyr::arrange(player.id, Season)

# prep.misc = prep.misc %>% group_by(player.id)   %>% mutate(blk.lag =lag(BLKPG, n = 1),
#                                                            apg.lag =lag(APG, n = 1),
#                                                            spg.lag =lag(SPG, n = 1),
#                                                            topg.lag =lag(TOPG, n = 1),
#                                                            gp.misc.lag  = lag(gp.misc, n = 1))


colnames(prep.misc)[1] = 'blk.prep'
colnames(prep.misc)[2] = 'apg.prep'
colnames(prep.misc)[3] = 'spg.prep'
colnames(prep.misc)[4] = 'tov.prep'



#prep.misc$Season.x = prep.misc$Season + 1


prep.misc = prep.misc %>% arrange(player.id, desc(Season), desc(gp.misc))
prep.misc = prep.misc %>% 
  group_by(player.id) %>% 
  filter(row_number()==1)


prep.reb = read_csv('prep.reb.csv')


colnames(prep.reb)[3] = 'gp.reb'
prep.reb = prep.reb[!duplicated(prep.reb),]


prep.reb = prep.reb %>% dplyr::arrange(player.id, Season)


prep.reb = prep.reb %>% dplyr::select(RPG,  Season, player.id, gp.reb, REB)


# prep.reb = prep.reb %>% group_by(player.id)   %>% mutate(rpg.lag =lag(RPG, n = 1),
#                                                          off.lag =lag(OFF, n = 1),
#                                                          def.lag =lag(DEF, n = 1),
#                                                          gp.reb.lag = lag(gp.reb))
#prep.reb$Season.x = prep.reb$Season + 1


colnames(prep.reb)[1] = 'reb.prep'
# colnames(prep.reb)[2] = 'off.reb.prep'
# colnames(prep.reb)[3] = 'def.reb.prep'


prep.reb = prep.reb %>% arrange(player.id, desc(Season), desc(gp.reb))
prep.reb = prep.reb %>% 
  group_by(player.id) %>% 
  filter(row_number()==1)


prep.total = full_join(prep.score, prep.minutes, by = c('player.id',
                                                    'Season'))

prep.total = full_join(prep.total, prep.reb, by = c('player.id',
                                                     'Season'))

prep.total = full_join(prep.total, prep.misc, by = c('player.id',
                                                      'Season'))

prep.total$Season = prep.total$Season + 1


my.max = function(x){
  ted = max(x)
  return(ted)
}

indices = prep.total[, c('gp.min', 'gp.ppg', 'gp.misc', 'gp.reb')]
prep.total$gp.max = apply(X = indices, FUN = my.max, MARGIN = 1)
prep.total$gp.min = ifelse(is.na(prep.total$gp.min), 0,  prep.total$gp.min)
prep.total$gp.misc = ifelse(is.na(prep.total$gp.misc), 0,  prep.total$gp.misc)
prep.total$gp.reb = ifelse(is.na(prep.total$gp.reb), 0,  prep.total$gp.reb)
prep.total$gp.ppg = ifelse(is.na(prep.total$gp.ppg), 0,  prep.total$gp.ppg)
indices = prep.total[, c('gp.min', 'gp.ppg', 'gp.misc', 'gp.reb')]

prep.total$gp.average = rowMeans(indices)


prep.total$player.id = gsub('-jr', 'jr', prep.total$player.id)


prep.total$player.id = gsub('-jr', 'jr', prep.total$player.id)
prep.total$player.id = gsub('-ii', 'ii', prep.total$player.id)
prep.total$player.id = gsub('-iii', 'iii', prep.total$player.id)
prep.total$player.id = gsub('-iv', 'iv', prep.total$player.id)


write.csv(prep.total, file = 'Prep.Total.Final.Year.csv', row.names = F)
