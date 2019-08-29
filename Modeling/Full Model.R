
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
data <- read_csv("recruit.college.15-18.csv")
rankings.247 = read_csv("rankings.247.csv")

# maxpreps = read_csv("maxpreps.16-17.csv")
# 
# maxpreps = maxpreps %>% dplyr::select(Name, PPG, Pts)
# 
# colnames(maxpreps)[2] = 'maxpreps.ppg'
# 
# colnames(maxpreps)[3] = 'maxpreps.pts'


rankings.247$dif = as.numeric(rankings.247$National.Ranking) - as.numeric(rankings.247$Previous.National.Ranking)

colnames(rankings.247)[colnames(rankings.247) == 'Rating'] <- 'rating.247'


colnames(data)[colnames(data) == 'Rating'] <- 'espn.rating'





data <- data %>% dplyr::filter(g > 10)


data = data %>% dplyr::arrange(player.id, Season)

zion = data %>% dplyr::filter(Name == 'Zion Williamson')
library(dplyr)

data = data %>% 
  group_by(Name) %>% 
  filter(row_number()==1)

zion = data %>% dplyr::filter(Name == 'Zion Williamson')

# 
# data = data[first(unique(data$Name)),]
# 

feet = as.numeric(substr(data$Height, 1, 1))

inches = as.numeric(gsub("'", "", substr(data$Height, 3, 4)))

data$fixed.height = (feet*12) + inches

data = data[which(!is.na(data$Weight)),]


data = data %>% dplyr::arrange(desc(ws))


data = left_join(x = data, y = rankings.247, by = c('Name'))



prep = read_csv(file = 'prep.score.csv')

colnames(prep)[1] = 'Name'
colnames(prep)[3] = 'gp.ppg'
colnames(prep)[4] = 'ppg.prep'

colnames(prep)[7] = 'fg.prep'

prep = prep %>% dplyr::arrange(Name, Season)


# prep = prep %>% group_by(Name)   %>% mutate(ppg.lag =lag(ppg.prep, n = 1),
#                                             fg.lag = lag(fg.prep, n = 1),
#                                             gp.ppg.lag = lag(gp.ppg, n = 1))

prep$Season.x = prep$Season + 1


prep = prep %>% arrange(Name, desc(Season.x), desc(gp.ppg))
prep = prep %>% 
  group_by(Name) %>% 
  filter(row_number()==1)

zion = prep %>% dplyr::filter(Name == 'Zion Williamson')


data$player.id = word(data$player.id.x, start = 1, end = -2, sep = '-')

data = left_join(x = data, y = prep, by = c('player.id', 'Season.x'))




prep.minutes = read_csv('prep.minutes.csv')

colnames(prep.minutes)[3] = 'gp.min'

prep.minutes = prep.minutes %>% dplyr::arrange(player.id, Season)

# prep.minutes = prep.minutes %>% group_by(player.id)   %>% mutate(mpg.lag =lag(MPG, n = 1),
#                                                                  gp.min.lag = lag(gp.min, n = 1))

prep.minutes = prep.minutes %>% dplyr::select(Season, player.id, MPG, MIN, gp.min)

prep.minutes$Season.x = prep.minutes$Season + 1

prep.minutes = prep.minutes %>% arrange(player.id, desc(Season.x), desc(gp.min))
prep.minutes = prep.minutes %>% 
  group_by(player.id) %>% 
  filter(row_number()==1)

colnames(prep.minutes)[3] = 'mpg.prep'


data = left_join(x = data, y = prep.minutes, by = c('player.id', 'Season.x'))


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



prep.misc$Season.x = prep.misc$Season + 1


prep.misc = prep.misc %>% arrange(player.id, desc(Season.x), desc(gp.misc))
prep.misc = prep.misc %>% 
  group_by(player.id) %>% 
  filter(row_number()==1)

data = left_join(x = data, y = prep.misc, by = c('player.id', 'Season.x'))

prep.reb = read_csv('prep.reb.csv')


colnames(prep.reb)[3] = 'gp.reb'
prep.reb = prep.reb[!duplicated(prep.reb),]


prep.reb = prep.reb %>% dplyr::arrange(player.id, Season)


prep.reb = prep.reb %>% dplyr::select(RPG,  Season, player.id, gp.reb, REB)


# prep.reb = prep.reb %>% group_by(player.id)   %>% mutate(rpg.lag =lag(RPG, n = 1),
#                                                          off.lag =lag(OFF, n = 1),
#                                                          def.lag =lag(DEF, n = 1),
#                                                          gp.reb.lag = lag(gp.reb))
prep.reb$Season.x = prep.reb$Season + 1


colnames(prep.reb)[1] = 'reb.prep'
# colnames(prep.reb)[2] = 'off.reb.prep'
# colnames(prep.reb)[3] = 'def.reb.prep'


prep.reb = prep.reb %>% arrange(player.id, desc(Season.x), desc(gp.reb))
prep.reb = prep.reb %>% 
  group_by(player.id) %>% 
  filter(row_number()==1)

data = left_join(x = data, y = prep.reb, by = c('player.id', 'Season.x'))


# nike <- read_csv(file = 'all.nike.csv')
# nike <- as.data.frame(nike)
# 
# data = left_join(x = data, y = nike, by = c('player.id'))


data = data %>% dplyr::filter(!is.na(ppg.prep))

data = data %>% dplyr::filter(!is.na(ws))




data = data %>% dplyr::select(Name.x, ws, ws_per_40,
                              Position_1,
                              fixed.height,
                              espn.rating,
                              ppg.prep,
                              mpg.prep,
                              reb.prep,
                              apg.prep,
                              Weight,
                              spg.prep,
                              tov.prep,
                              blk.prep,
                              fg.prep,
                              gp.ppg,
                              gp.misc,
                              gp.min,
                              gp.reb,
                              PTS,
                              MIN,
                              REB,
                              AST,
                              STL,
                              TO,
                              BLK,
                              `3PM`,
                              `3P%`,
                              FGM,
                              FTM,
                              `FT%`
)








# school.table = as.data.frame(table(data$High.School))
# colnames(school.table)[1] = 'High.School'
# colnames(school.table)[2] = 'Category'
# 
# data = left_join(data, school.table, by = 'High.School')
# 
# 
# data$prep = ifelse(data$Category > 2, data$High.School, 'solo')
# 
# data$Category = as.factor(data$Category)
# 
# data$pounds.inch = data$Weight / data$fixed.height


# summary = data %>% group_by(High.School) %>% summarise(height = mean(espn.rating), freq = n())
# summary
#plot(x = summary$freq, y = summary$height)




library(MASS)

library(kernlab)

data$Position_1 = as.factor(data$Position_1)







#data$Position_1 = gsub('Center', 'Forward', data$Position_1)

data$Position_1 = gsub('Guard-Forward', 'Forward', data$Position_1)

data$Guard.Dummy = ifelse(data$Position_1 == 'Guard', 1, 0)
data$Forward.Dummy = ifelse(data$Position_1 == 'Forward', 1, 0)
data$Center.Dummy = ifelse(data$Position_1 == 'Center', 1, 0)
data = data %>% dplyr::select(-Position_1)
data = data %>% dplyr::select(Name.x, ws, ws_per_40, Guard.Dummy, Forward.Dummy, Center.Dummy,
                              everything())


my.max = function(x){
  ted = max(x, na.rm = T)
  return(ted)
}

indices = data[, c('gp.min', 'gp.ppg', 'gp.misc', 'gp.reb')]
data$gp.max = apply(X = indices, FUN = my.max, MARGIN = 1)
data$gp.min = ifelse(is.na(data$gp.min), 0,  data$gp.min)
data$gp.misc = ifelse(is.na(data$gp.misc), 0,  data$gp.misc)
data$gp.reb = ifelse(is.na(data$gp.reb), 0,  data$gp.reb)
data$gp.ppg = ifelse(is.na(data$gp.ppg), 0,  data$gp.ppg)
indices = data[, c('gp.min', 'gp.ppg', 'gp.misc', 'gp.reb')]

data$gp.average = rowMeans(indices)


#data[,7:ncol(data)] <- data[,7:ncol(data)] %>% mutate_all(funs(replace_na(.,0)))







#data$gp.sum = apply(X = indices, FUN = is.na, MARGIN = 1)

# indices = data[, c('gp.min.lag', 'gp.ppg.lag', 'gp.misc.lag', 'gp.reb.lag')]
# 
# data$gp.max.lag = apply(X = indices, FUN = my.max, MARGIN = 1)
# 

train_ind <- createDataPartition(y = data$ws, p = .8, list = F)

train <- data[train_ind, ]
test <- data[-train_ind, ]


library(RANN)  # required for knnInpute


knn.impute <- preProcess(train[,6:ncol(train)], method=c("knnImpute"))
# 
train[,6:ncol(train)] <- predict(knn.impute, newdata = train[,6:ncol(train)])



ws.formula = as.formula(
  'ws  ~
  ppg.prep + mpg.prep + fg.prep +
  blk.prep + spg.prep + apg.prep + tov.prep  +  
  reb.prep + 
  
  gp.average + espn.rating + poly(espn.rating, degree = 3) + 
  
  PTS + MIN + 
  BLK + STL + AST + TO + 
  REB + 
  
  `3PM` +  `3P%` + FGM + FTM + `FT%` + 
  
  fixed.height + Weight  + 
  Guard.Dummy + Center.Dummy + Forward.Dummy + 
  
  I(PTS/gp.max)  + I(MIN/gp.max) + 
  I(BLK/gp.max)  + I(STL/gp.max)  + I(AST/gp.max) + I(TO/gp.max) + 
  I(REB/gp.max) + 
  I(`3PM`/gp.max) + I(FGM/gp.max) + I(FTM/gp.max) + 
  
  I(`3PM`*`3P%`)  + I(FGM*fg.prep) + I(FTM*`FT%`)
  
  
  
  ')




fitControl <- trainControl(
  method = 'cv',                   # k-fold cross validation
  number = 30,  
  savePredictions = 'final'       # saves predictions for optimal tuning parameter
) 





library(caretEnsemble)
library(nnet)
options(java.parameters = "-Xmx5g")

algorithmList <- c('brnn',
                   'rf',
                   'bridge',
                   'blasso')



models.full <- caretList(form = ws.formula, data=train,  trControl=fitControl, methodList=algorithmList) 
results <- resamples(models.full)
summary(results)



set.seed(5000)

stackControl <- trainControl(
  method = 'cv',                   # k-fold cross validation
  number = 30,  
  
  savePredictions = 'final'      # saves predictions for optimal tuning parameter
) 

stack.glm <- caretStack(models.full, 
                        method = "glm", 
                        trControl=stackControl) 




test[,6:ncol(test)] <- predict(knn.impute, newdata = test[,6:ncol(test)])




#predict WAR values using your model
#bart =  predict(models.full$bartMachine, test)


bridge.full = predict(models.full$bridge, test)
rf.full = predict(models.full$rf, test)
brnn.full = predict(models.full$brnn, test)
stacked.full <- predict(stack.glm, test)
blasso.full <- predict(models.full$blasso, test)


#compute the residuals
full.error.stacked <- test$ws - stacked.full
full.error.bridge <- test$ws - bridge.full
full.error.rf <- test$ws - rf.full
full.error.brnn <- test$ws - brnn.full
full.error.blasso <- test$ws - blasso.full

rmse.stacked <- mean(sqrt((full.error.stacked^2)))
rmse.bridge <- mean(sqrt((full.error.bridge^2)))
rmse.rf <- mean(sqrt((full.error.rf^2)))
rmse.brnn = mean(sqrt(full.error.brnn^2))
rmse.blasso = mean(sqrt(full.error.blasso^2))


all.inputs.matrix = matrix(nrow = 5, ncol = 2)
all.inputs.matrix[1,1] = 'Stacked Model'
all.inputs.matrix[2,1] = 'Bayesian Ridge'
all.inputs.matrix[3,1] = 'Random Forest'
all.inputs.matrix[4,1] = 'Neural Network'
all.inputs.matrix[5,1] = 'Bayesian Lasso'

all.inputs.matrix[1,2] = rmse.stacked
all.inputs.matrix[2,2] = rmse.bridge
all.inputs.matrix[3,2] = rmse.rf
all.inputs.matrix[4,2] = rmse.brnn
all.inputs.matrix[5,2] = rmse.blasso

all.inputs.matrix = as.data.frame(all.inputs.matrix)
colnames(all.inputs.matrix)[1] = 'Model Type'
colnames(all.inputs.matrix)[2] = 'RMSE'
print(all.inputs.matrix)

library(monomvn)
bl = models.full$blasso$finalModel
plot(bl, which=c("coef"))


ggplot() + 
  
  #select type of plot (such as bar graph, histogram, etc.). set x and y = to your variables
  
  geom_point(aes(x = stacked, y = full.error.stacked)
             , colour = 'skyblue',
             size = 2.5) + 
  geom_hline(yintercept=0, col="red", linetype="dashed") + 
  #draw line of best fit through the points
  
  #set plot title and subtitles
  labs(title = 'Full Model (Stacked)', 
       subtitle = paste('Out-of-Sample RMSE = ', round(rmse.stacked, 4), sep = '')) + 
  
  #set x axis title
  xlab(label = 'Predicted Win Shares')  + ggtitle('Full Model (Stacked)') + 
  theme_bw() + 
  theme(text=element_text(size=14)) + 
  #set y axis title
  ylab(label = 'Residuals') + xlim(0, 5) + ylim(-3.5, 3.5)

