
#### AAU regression Model on Win Shares Per Game ####


library(glmnet)



set.seed(123) 
train.control <- trainControl(method = "LOOCV")



aau.lm <- train(sqrt.ws ~., data = aau, method = "lm",
                trControl = train.control)


pred = predict(aau.lm, aau)


rmse = round(sqrt(mean((aau.win.shares - pred)^2)), 2)



dat = as.data.frame(cbind(pred, aau.win.shares))
colnames(dat) = c('pred', 'ws')

aau.graph = ggplot(dat) + geom_point(aes(x = pred, y = ws),
                                     colour = 'skyblue') + xlab("Predicted") + 
  
  ylab("Actual") + labs(title = 'AAU Model Predicted versus Actual Win Shares',
                        subtitle = paste('RMSE=', rmse, sep = '')) + 
  geom_abline(intercept=0,slope = 1) + xlim(-1, 8) + 
  ylim(-1, 8) + theme_bw()

#### End ####



#### Prep regression Model ####

prep.lm <- train(sqrt.ws ~ ., data = prep, method = "lm",
                 trControl = train.control)


pred = predict(prep.lm, prep)


rmse = round(sqrt(mean((prep.win.shares - pred)^2)), 2)



dat = as.data.frame(cbind(pred, prep.win.shares))
colnames(dat) = c('pred', 'ws')


prep.graph = ggplot(dat) + geom_point(aes(x = pred, y = ws),
                                      colour = 'skyblue') + xlab("Predicted") + 
  
  ylab("Actual") + labs(title = 'Prep Circuit Model Predicted versus Actual Win Shares',
                        subtitle = paste('RMSE=', rmse, sep = '')) + 
  geom_abline(intercept=0,slope = 1) + xlim(-1, 8) + 
  ylim(-1, 8) + theme_bw()


#### End ####
