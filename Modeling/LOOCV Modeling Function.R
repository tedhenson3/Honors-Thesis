
#### Define function and standard arguments ####
loocv.modeler = function(data = full, 
                         model = 'lm', 
                         cbb.games = full.games, 
                         cbb.win.shares = full.win.shares){



#### load packages for built in models ####
library(glmnet)
library(caret)
#### End ####
  
#### Grab number of obs ####
num.obs = nrow(data)
#### End ####

#### Randomly shuffle the data (for good measure) ####
#data<-data[sample(num.obs),]
#### End ####

#### set the fold each ob will be in ####
folds <- cut(seq(1,nrow(data)),breaks=num.obs,labels=FALSE)
#### End ####

#### Create empty vector for predictions ####
predictions = c(0)
#### End ####

#### Create dataset of numeric predictors ####
is.fact <- sapply(data, is.factor)
num.data <- data[, -c(which(is.fact))]
#### End ####

if(model == 'lasso'){
  

#### Find best lambda for lasso and ridge ####
  
  set.seed(2020)
  
  data = num.data
  
  
lasso.cv <- cv.glmnet(as.matrix(data[,2:ncol(data)]),
                   data[,1],
                   nfolds = 5,
                   type.measure = "mse",
                   alpha = 1,
                   family = 'gaussian')
min.lasso.lambda = lasso.cv$lambda.min

}

if(model == 'ridge'){
  
  set.seed(2020)
  data = num.data
  
ridge.cv <- cv.glmnet(as.matrix(data[,2:ncol(data)]),
                      data[,1],
                      nfolds = 5,
                      type.measure = "mse",
                      alpha = 0,
                      family = 'gaussian')
min.ridge.lambda = ridge.cv$lambda.min



}
#### End ####

#### Loop through every observation, train model on other obs, and predict on held out ####
for(j in 1:num.obs){
  
  testIndexes <- which(folds==j)
  test.data <- data[testIndexes, ]
  train.data = data[-testIndexes, ]
  
  #### create X and y datasets / vectors ####
  train.y = train.data$ws.per.game
  train.X = train.data %>% dplyr::select(-ws.per.game)
  
  test.y= test.data$ws.per.game
  test.X = test.data %>% dplyr::select(-ws.per.game)
  
  #### create X / y without factors ####
  #### End ####
  
  #### Creating formula variable ####
  formula = as.formula('ws.per.game~.')
  #### End ####
  
  if(model == 'nnet::nnet'){
    
  
    hidden.layers = floor((2/3)*c(ncol(train.data)-1)+1)
  train.fit=nnet::nnet(formula,
                       data=train.data,
                       size = hidden.layers)
  }
  
  if(model == 'lm'){
    train.fit = lm(formula, data = train.data)
    data.pred=predict(train.fit, test.data)*cbb.games[testIndexes]
    predictions = c(predictions, data.pred)
}


if(model == 'lasso'){
  
  train.fit = glmnet(x = as.matrix(train.X), 
                     y = train.y,
                     alpha  = 1,
                     lambda = min.lasso.lambda,
                     family = 'gaussian')
data.pred=as.numeric(predict(train.fit, as.matrix(test.X)))*cbb.games[testIndexes]
predictions = c(predictions, data.pred)
}
  
  if(model == 'ridge'){
    

    train.fit = glmnet(x = as.matrix(train.X), 
                       y = train.y,
                       alpha  = 0,
                       lambda = min.ridge.lambda,
                       family = 'gaussian')
    data.pred=as.numeric(predict(train.fit, as.matrix(test.X)))*cbb.games[testIndexes]
    predictions = c(predictions, data.pred)
  }
  
  if(model == 'rf'){
    
    train.fit = train(form = formula,
              data= train.data,
              method = 'rf',
               metric = 'RMSE',
               maximize = F
               )
    data.pred=predict(train.fit, test.data)*cbb.games[testIndexes]
    predictions = c(predictions, data.pred)
  }
  
  if(model == 'earth'){
    
    train.fit = train(form = formula,
                      data= train.data,
                      method = 'earth',
                      metric = 'RMSE',
                      maximize = F
    )
    data.pred=predict(train.fit, test.data)*cbb.games[testIndexes]
    predictions = c(predictions, data.pred)
  }
  
}

#### End ####

return(predictions)
}



