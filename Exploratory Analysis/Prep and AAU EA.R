
setwd('~/Honors Thesis/Clean Data')
library(readr)
library(tidyverse)
library(caret)
library(caretEnsemble)


# #note to self: do not forget to add in recreated per game prep stats 
# # as given stats are inaccurate
# # predict offense and defense seperate


data = read_csv('espn.bball-ref.aau.prep.csv')

plot(x = data$ppg.prep, y = data$aau.pts)
data = data %>% dplyr::filter(!is.na(ppg.prep) | !is.na(aau.pts))

data = data %>% dplyr::filter(!is.na(ws))

data <- data %>% dplyr::filter(g > 10)

data = data %>% dplyr::select(-Name, -player.id,
                       -Season, -g)




train_ind <- createDataPartition(y = data$ws, p = .8, list = F)

train <- data[train_ind, ]


featurePlot(x = train[, c('ppg.prep', 'HIGH', 'PTS', 
                          'aau.pts', 'aau.max.pts', 'aau.sum.pts')],
            y = train$ws)

featurePlot(x = train[, c('ppg.prep')],
            y = train$aau.pts)


featurePlot(x = train[, c('HIGH')],
            y = train$aau.max.pts)


featurePlot(x = train[, c('PTS')],
            y = train$aau.sum.pts)


test <- data[-train_ind, ]

# 
# 
# library(RANN)  # required for knnInpute
# 
# 
# knn.impute <- preProcess(train[,2:ncol(train)], method=c("knnImpute"))
# # 
# train[,2:ncol(train)] <- predict(knn.impute, newdata = train[,2:ncol(train)])
# 
# 
# 

# 
# ws.formula = as.formula(
#   'ws  ~ . ')
# 
# 
# 
# 
# 
# fitControl <- trainControl(
#   method = 'cv',                   # k-fold cross validation
#   number = 30,  
#   savePredictions = 'final'       # saves predictions for optimal tuning parameter
# ) 
# 
# 
# 
# 
# 
# library(caretEnsemble)
# library(nnet)
# options(java.parameters = "-Xmx5g")
# 
# algorithmList <- c('elm',
#                    'rf',
#                    'svmPoly',
#                    'lasso')
# 
# 
# 
# models.full <- caretList(form = ws.formula, data=train,  trControl=fitControl, methodList=algorithmList) 
# results <- resamples(models.full)
# summary(results)
# 
# 
# 
# set.seed(5000)
# 
# stackControl <- trainControl(
#   method = 'cv',                   # k-fold cross validation
#   number = 30,  
#   
#   savePredictions = 'final'      # saves predictions for optimal tuning parameter
# ) 
# 
# stack.glm <- caretStack(models.full, 
#                         method = "glm", 
#                         trControl=stackControl) 
# 
# 
# 
# 
# test[,2:ncol(test)] <- predict(knn.impute, newdata = test[,2:ncol(test)])
# 
# 
# 
# 
# #predict WAR values using your model
# #bart =  predict(models.full$bartMachine, test)
# 
# 
# elm.full = predict(models.full$elm, test)
# rf.full = predict(models.full$rf, test)
# svmPoly.full = predict(models.full$svmPoly, test)
# stacked.full <- predict(stack.glm, test)
# blasso.full <- predict(models.full$lasso, test)
# 
# 
# #compute the residuals
# full.error.stacked <- test$ws - stacked.full
# full.error.elm <- test$ws - elm.full
# full.error.rf <- test$ws - rf.full
# full.error.svmPoly <- test$ws - svmPoly.full
# full.error.blasso <- test$ws - blasso.full
# 
# rmse.stacked <- mean(sqrt((full.error.stacked^2)))
# rmse.elm <- mean(sqrt((full.error.elm^2)))
# rmse.rf <- mean(sqrt((full.error.rf^2)))
# rmse.svmPoly = mean(sqrt(full.error.svmPoly^2))
# rmse.blasso = mean(sqrt(full.error.blasso^2))
# 
# 
# all.inputs.matrix = matrix(nrow = 5, ncol = 2)
# all.inputs.matrix[1,1] = 'Stacked Model'
# all.inputs.matrix[2,1] = 'ELM'
# all.inputs.matrix[3,1] = 'Random Forest'
# all.inputs.matrix[4,1] = 'Suppor Vector Machine'
# all.inputs.matrix[5,1] = 'Lasso'
# 
# all.inputs.matrix[1,2] = rmse.stacked
# all.inputs.matrix[2,2] = rmse.elm
# all.inputs.matrix[3,2] = rmse.rf
# all.inputs.matrix[4,2] = rmse.svmPoly
# all.inputs.matrix[5,2] = rmse.blasso
# 
# all.inputs.matrix = as.data.frame(all.inputs.matrix)
# colnames(all.inputs.matrix)[1] = 'Model Type'
# colnames(all.inputs.matrix)[2] = 'RMSE'
# print(all.inputs.matrix)
# 
# library(monomvn)
# bl = models.full$blasso$finalModel
# plot(bl, which=c("coef"))
# 
# 
# ggplot() + 
#   
#   #select type of plot (such as bar graph, histogram, etc.). set x and y = to your variables
#   
#   geom_point(aes(x = stacked, y = full.error.stacked)
#              , colour = 'skyblue',
#              size = 2.5) + 
#   geom_hline(yintercept=0, col="red", linetype="dashed") + 
#   #draw line of best fit through the points
#   
#   #set plot title and subtitles
#   labs(title = 'Full Model (Stacked)', 
#        subtitle = paste('Out-of-Sample RMSE = ', round(rmse.stacked, 4), sep = '')) + 
#   
#   #set x axis title
#   xlab(label = 'Predicted Win Shares')  + ggtitle('Full Model (Stacked)') + 
#   theme_bw() + 
#   theme(text=element_text(size=14)) + 
#   #set y axis title
#   ylab(label = 'Residuals') + xlim(0, 5) + ylim(-3.5, 3.5)
# 
