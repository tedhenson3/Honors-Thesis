
#### Define function and standard arguments ####
loocv.stacked.modeler = function(preds = aau.espn.predictions,
                         ws = aau.espn.win.shares){
  
  #### Make predictions dataset ####
  data = cbind(ws, preds)
  colnames(data)[1] = 'ws'
  #### End ####
  
  #### Grab number of obs ####
  num.obs = nrow(data)
  #### End ####
  
  #### set the fold each ob will be in ####
  folds <- cut(seq(1,nrow(data)),breaks=num.obs,labels=FALSE)
  #### End ####
  
  #### Create empty vector for predictions ####
  predictions = c()
  #### End ####
  
  
  formula = as.formula(ws ~ .)

  #### Loop through every observation, train model on other obs, and predict on held out ####
  for(j in 1:num.obs){
    
    testIndexes <- which(folds==j)
    test.data <- data[testIndexes, ]
    train.data = data[-testIndexes, ]

    stacked = lm(formula, data = train.data)
      data.pred=predict(stacked, test.data)
      predictions = c(predictions, data.pred)
  }
  
  mod = lm(formula, data = data)
 save(mod, file = paste("~/Honors Thesis/Model Environments/", "full stacked", ".RData", sep = ""))
  
    
    
    
  #### End ####
  
  return(predictions)
}
