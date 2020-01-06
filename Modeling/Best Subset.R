

library(leaps)

num.folds = 10

aau.folds = createFolds(aau$ws.per.game,
                      k = num.folds,
                      )

set.seed(2020)
#Randomly shuffle the data
aau.data<-aau[sample(nrow(aau)),]

#Create 10 equally size folds
aau.folds <- cut(seq(1,nrow(aau.data)),breaks=10,labels=FALSE)

nvar.aau = c(ncol(aau)-1)
nvar.prep = c(ncol(prep)-1)


for(j in 1:num.folds){
  
  testIndexes <- which(aau.folds==j)
  test.data <- aau.data[testIndexes, ]
  train.data = aau.data[-testIndexes, ]
  aau.best.fit=regsubsets(ws.per.game~.,data=train.data, nbest = 1,
                          nvmax=nvar.aau) 
  
  #prep.best.fit=regsubsets(ws.per.game~.,data=prep[prep.folds!=j,], nvmax=nvar.prep) 
  
  # For each subset
  for(i in 1:nvar.aau){
    predict.regsubsets = function(object, newdata, id, ...) {
      form = as.formula(object$call[[2]])
      mat = model.matrix(form, newdata)
      coefi = coef(object, id = id)
      mat[, names(coefi)] %*% coefi
    }
   aau.pred=predict.regsubsets(aau.best.fit, test.data, id =i)*aau.games[testIndexes]
    aau.reg.sub.error = aau.win.shares[testIndexes]  - aau.pred
    # 
    aau.reg.sub.rmse = sqrt(mean(aau.reg.sub.error^2))
    # cv.errors[j,i]=mean((Hitters$Salary[folds==j]-pred)^2)
  }
}