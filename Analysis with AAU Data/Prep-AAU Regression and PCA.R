





setwd('~/Honors Thesis/Clean Data')
library(readr)
library(tidyverse)
library(caret)
library(caretEnsemble)





data = read_csv('espn.bball-ref.aau.prep.csv')


data = data %>% dplyr::filter(g > 10)
# data = data %>% dplyr::select(-g)

data = data %>% dplyr::select(-total.given.pts.aau,
                              -given.pts.aau)


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





#data = data[ , colSums(is.na(data)) == 0]

#data[is.na(data)] = 0



#data$Season = ifelse(data$Season == 2019, 1, 0)

# data = data %>% select(-ows, -dws,
#                        -Season)



#AAU PTS PER MIN
data$pts.per.min.aau = data$total.pts.aau / data$total.mp.aau


#need to justify later
data$pts.per.min.aau = ifelse(is.infinite(data$pts.per.min.aau),
                              NA,
                              data$pts.per.min.aau)

#HIGH SCHOOL POINTS

data$total.pts.high.school = data$PTS.prep + data$total.pts.aau

data$ppg.high.school = (data$total.pts.high.school) /
  (data$gp.ppg.prep + data$total.games.aau)

data$mean.pts.high.school = (data$ppg.prep + data$pts.aau) / 2


#HIGH SCHOOL REBOUNDS

data$total.rebs.high.school = data$REB.prep + data$total.reb.aau

data$rebs.high.school = data$total.rebs.high.school /
  (data$total.games.aau + data$gp.reb.prep)


#HIGH SCHOOL BLOCKS

data$total.blks.high.school = data$blk.aau + data$BLK.prep

data$blks.high.school = data$total.blks.high.school /
  (data$total.games.aau + data$gp.misc.prep)




#HIGH SCHOOL STEALS

data$total.stls.high.school = data$STL.prep + data$total.stl.aau

data$stls.high.school = data$total.stls.high.school /
  (data$total.games.aau + data$gp.misc.prep)



#HIGH SCHOOL FTs

data$total.fts.high.school = data$FTM.prep + data$total.ft.made.aau

data$fts.high.school = data$total.fts.high.school /
  (data$total.games.aau + data$gp.ppg.prep)






#HIGH SCHOOL MAX

my.max = function(x) {
  return(max(x, na.rm = T))
}

data$max.pts.high.school = apply(X = data[, c('HIGH.prep', 'max.pts.aau')],
                                 FUN = my.max,
                                 MARGIN = c(1))


data$max.pts.high.school = ifelse(is.infinite(data$max.pts.high.school),
                                  NA,
                                  data$max.pts.high.school)



#HIGH SCHOOL tos

data$total.tos.high.school = data$TO.prep + data$total.to.aau

data$tovs.high.school = data$total.tos.high.school /
  (data$total.games.aau + data$gp.misc.prep)



#HIGH SCHOOL 3ps

data$total.3ps.high.school = data$`3PM.prep` + data$threep.made.aau

data$`3ps.high.school` = data$total.3ps.high.school /
  (data$total.games.aau + data$gp.ppg.prep)

#data[,7:ncol(data)][data[,7:ncol(data)] == 0] <- NA


data = data %>% dplyr::select(Name,
                              player.id,
                              Position,
                              ws,
                              ows,
                              dws,
                              Season,
                              everything())

data = data[, which(grepl('gp.', colnames(data)) == 0)]


###prep 
prep = data[,which(grepl('prep', colnames(data)))]

prep = cbind(data$ws, prep)
colnames(prep)[1] = 'ws'

prep = prep[complete.cases(prep),]


prep = prep %>% dplyr::select(ws,
                            ppg.prep,
                            mpg.prep,
                            HIGH.prep,
                            reb.prep,
                            blk.prep,
                            spg.prep,
                            tov.prep)

#aau
aau = data[,which(grepl('aau', colnames(data)))]

aau = cbind(data$ws, aau)
colnames(aau)[1] = 'ws'
aau = aau[complete.cases(aau),]

aau = aau[,which(grepl('total', colnames(aau)) == 0)]

aau = aau %>% dplyr::select(ws,
                            pts.aau,
                            mp.aau,
                            max.pts.aau,
                            reb.aau,
                            blk.aau,
                            stl.aau,
                            to.aau
                            )

library(glmnet)



set.seed(123) 
train.control <- trainControl(method = "cv", number = 5)


### AAU regression Model

aau.lm <- train(ws ~., data = aau, method = "lm",
               trControl = train.control)


summary(aau.lm)



### Prep regression Model

prep.lm <- train(ws ~., data = prep, method = "lm",
                 trControl = train.control)


summary(prep.lm)



### AAU PCA

aau.pca <- prcomp(aau, center = T, scale = T)


aau.pca$rotation



### Prep PCA

prep.pca <- prcomp(prep, center = T, scale = T)


prep.pca$rotation

