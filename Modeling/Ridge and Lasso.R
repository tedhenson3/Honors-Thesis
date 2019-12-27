
library(glmnet)


#### Lasso AAU ####
aau.predictors = model.matrix(ws.per.game ~ .,
                              aau)
lasso.aau = cv.glmnet(x = aau.predictors[,2:dim(aau.predictors)[2]],
                  y = aau$ws.per.game,
                  keep = T,
                  alpha = 1, nfolds = 5)


plot(x = lasso.aau$lambda, y = lasso.aau$cvm)
print('Coefficients:')
coef(lasso.aau)
# print(paste('error=', min(lasso.aau$cvm),
#             sep = ''))

aau.lasso.pred = 
  lasso.aau$fit.preval[, lasso.aau$lambda == lasso.aau$lambda.min]*aau.games

aau.lasso.error = aau.win.shares  - aau.lasso.pred

aau.lasso.rmse = sqrt(mean(aau.lasso.error^2))
aau.lasso.rmse

plot(aau.lasso.pred,
     aau.win.shares,
     xlim = c(min(aau.lasso.pred,
                  aau.win.shares),
              max(aau.lasso.pred,
                  aau.win.shares)))
abline(0,
       1)



#### End ####




#### Lasso Prep ####
prep.predictors = model.matrix(ws.per.game ~ .,
                              prep)
lasso.prep = cv.glmnet(x = prep.predictors[,2:dim(prep.predictors)[2]],
                      y = prep$ws.per.game,
                      alpha = 1, nfolds = 5)


plot(x = lasso.prep$lambda, y = lasso.prep$cvm)
print('Coefficients:')
coef(lasso.prep)
print(paste('error=', min(lasso.prep$cvm),
            sep = ''))

#### End ####