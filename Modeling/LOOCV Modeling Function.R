
#### Define function and standard arguments ####
loocv.modeler = function(data = full, 
                         model = 'lm'){


#### load packages for built in models ####
library(glmnet)
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
predictions = c()
#### End ####

#### Create dataset of numeric predictors ####
is.fact <- sapply(data, is.factor)
num.data <- data[, -c(which(is.fact))]
#### End ####

#### Creating formula variable ####
formula = as.formula(sqrt.ws ~ .)
#### End ####

#### Hyperparamter tuning ####

set.seed(2020)

if(model == 'lasso'){
  

#### Find best lambda for lasso and ridge ####
  
  
  #data = num.data
  library(mlr)
  data = createDummyFeatures(data, cols = c('Position.Basic'))
  
  
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
 # data = num.data
  library(mlr)
  data = createDummyFeatures(data, cols = c('Position.Basic'))
  
ridge.cv <- cv.glmnet(as.matrix(data[,2:ncol(data)]),
                      data[,1],
                      nfolds = 5,
                      type.measure = "mse",
                      alpha = 0,
                      family = 'gaussian')
min.ridge.lambda = ridge.cv$lambda.min



}
#### End ####



if(model == 'rf'){
  library(randomForest)
  
  bestmtry <- randomForest::tuneRF(x = data[,2:ncol(data)],
                     y = data$sqrt.ws, 
                     stepFactor=1.5, ntree=1000)
  #print(bestmtry)
  
  optim.num.predictors = as.numeric(bestmtry[which.min(bestmtry[,2]), 1])
}


if(model == 'svm'){
  library(e1071)
  svm_tune <- tune(svm, formula, data=data,kernel ="radial", 
                   ranges = list(cost=c(0.001, 0.01,0.1, 1, 10, 100)))
  
  opt.c = summary(svm_tune)[[1]]
}


#### dummy vars for nnet ####

if(model == 'nnet'){
  library(mlr)

  data = createDummyFeatures(data, cols = c('Position.Basic'))

}




if(model == 'xgbDART'){
  resample.method <- trainControl(method = "cv",
                                  number = 5)
  library(caret)
  best.xgboost <- caret::train(form = formula,
                               data = data,
                               metric = 'RMSE',
                               maximize = F,
                        method = "xgbDART",
                        trControl = resample.method) 

  #best.xgboost = best.xgboost[4]
 
  best.xgboost = as.data.frame(best.xgboost$results)
  #colnames(best.xgboost) = gsub('results.', '', best.xgboost)
  opt.nrounds = as.numeric(best.xgboost[which.min(best.xgboost$RMSE), 'nrounds'][1])
  opt.max_depth = as.numeric(best.xgboost[which.min(best.xgboost[,'RMSE']), 'max_depth'])
  opt.eta = as.numeric(best.xgboost[which.min(best.xgboost[,'RMSE']), 'eta'])
  opt.gamma = as.numeric(best.xgboost[which.min(best.xgboost[,'RMSE']), 'gamma'])
  opt.colsample_bytree = as.numeric(best.xgboost[which.min(best.xgboost[,'RMSE']), 'colsample_bytree'])
  opt.min_child_weight = as.numeric(best.xgboost[which.min(best.xgboost[,'RMSE']), 'min_child_weight'])
  opt.subsample = as.numeric(best.xgboost[which.min(best.xgboost[,'RMSE']), 'subsample'])
  opt.skip_drop = as.numeric(best.xgboost[which.min(best.xgboost[,'RMSE']), 'skip_drop'])
  opt.rate_drop = as.numeric(best.xgboost[which.min(best.xgboost[,'RMSE']), 'rate_drop'])
  params <- list(max_depth = opt.max_depth,
                eta = opt.eta, 
                gamma = opt.gamma,
                colsample_bytree = opt.colsample_bytree,
                min_child_weight = opt.min_child_weight,
                subsample = opt.subsample,
                skip_drop = opt.skip_drop,
                opt.rate_drop = opt.rate_drop,
                verbose = 0, 
                nthread = 2,
                objective = "reg:squarederror")
}


if(model == 'earth'){
  library(caret)
  resample.method <- trainControl(method = "cv",
                                  number = 5)
  library(caret)
  best.earth <- caret::train(form = formula,
                               data = data,
                               metric = 'RMSE',
                               maximize = F,
                               method = "earth",
                               trControl = resample.method) 
  
  #best.earth = best.earth[4]
  
  best.earth = as.data.frame(best.earth$results)
  #colnames(best.earth) = gsub('results.', '', best.earth)
  opt.nprune = as.numeric(best.earth[which.min(best.earth$RMSE), 'nprune'][1])
  opt.degree = as.numeric(best.earth[which.min(best.earth$RMSE), 'degree'][1])
  
}

#### Loop through every observation, train model on other obs, and predict on held out ####
for(j in 1:num.obs){
  
  testIndexes <- which(folds==j)
  test.data <- data[testIndexes, ]
  train.data = data[-testIndexes, ]
  
  #### create X and y datasets / vectors ####
  train.y = train.data$sqrt.ws
  train.X = train.data %>% dplyr::select(-sqrt.ws)
  
  test.y= test.data$sqrt.ws
  test.X = test.data %>% dplyr::select(-sqrt.ws)
  
  #### create X / y without factors ####
  #### End ####
  
  
  
  if(model == 'nnet'){
    
  library(nnet)
    hidden.layers = floor((1/2)*c(ncol(train.data)-1))
    
  train.fit=avNNet(train.X,
                   train.y,
                   linout = T,
                   trace = F,
                   size = hidden.layers)
  
  data.pred=predict(train.fit, test.X)
  predictions = c(predictions, data.pred)
  }
  
  if(model == 'svm'){
    library(e1071)
    train.fit = svm(formula, data = train.data,
                          type = 'eps-regression',
                          kernel = 'radial')
    data.pred=predict(train.fit, test.data)
    predictions = c(predictions, data.pred)
    
  }
  
  
  if(model == 'lm'){
    train.fit = lm(formula, data = train.data)
    data.pred=predict(train.fit, test.data)
    predictions = c(predictions, data.pred)
}


if(model == 'lasso'){
  
  train.fit = glmnet(x = as.matrix(train.X), 
                     y = train.y,
                     alpha  = 1,
                     lambda = min.lasso.lambda,
                     family = 'gaussian')
data.pred=as.numeric(predict(train.fit, as.matrix(test.X)))
predictions = c(predictions, data.pred)
}
  
  if(model == 'ridge'){
    

    train.fit = glmnet(x = as.matrix(train.X), 
                       y = train.y,
                       alpha  = 0,
                       lambda = min.ridge.lambda,
                       family = 'gaussian')
    data.pred=as.numeric(predict(train.fit, as.matrix(test.X)))
    predictions = c(predictions, data.pred)
  }
  
  if(model == 'rf'){
    
    
    train.fit = randomForest(formula = formula,
              data= train.data,
              ntree = 500,
              mtry = optim.num.predictors
               )
    data.pred=predict(train.fit, test.data)
    predictions = c(predictions, data.pred)
  }
  
  
  if(model == 'xgbDART'){
    library(mlr)
    library(xgboost)
    train.data = createDummyFeatures(train.data, cols = c('Position.Basic'))
    test.data = createDummyFeatures(test.data, cols = c('Position.Basic'))
    train.fit = xgboost(data= as.matrix(train.data[,2:ncol(train.data)]),
                          label = train.data[,1],
                        param = params,
                        verbose = 0,
                        nrounds = opt.nrounds
    )
    data.pred=predict(train.fit, as.matrix(test.data[,2:ncol(test.data)]))
    predictions = c(predictions, data.pred)


  }
  # 
  if(model == 'earth'){
    library(caret)
    # train.fit = caret::train(form = formula,
    #                   data= train.data,
    #                   method = 'earth',
    #                   metric = 'RMSE',
    #                   maximize = F,
    #                   nprune = opt.nprune,
    #                   degree = opt.degree
    # )
    train.fit = earth(formula = formula,
                      data= train.data,
                      nprune = opt.nprune,
                      degree = opt.degree
    )
    
    data.pred=predict(train.fit, test.data)
    predictions = c(predictions, data.pred)
  }
  

  
}

#### End ####

return(predictions)
}


