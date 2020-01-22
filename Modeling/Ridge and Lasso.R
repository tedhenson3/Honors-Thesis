
library(glmnet)


#### Lasso AAU ####
aau.predictors = model.matrix(sqrt.ws ~ .,
                              aau)
lasso.aau = cv.glmnet(x = aau.predictors[,2:dim(aau.predictors)[2]],
                  y = aau$sqrt.ws,
                  keep = T,
                  alpha = 1, nfolds = 10)


# plot(x = lasso.aau$lambda, y = lasso.aau$cvm)
# print('Coefficients:')
# coef(lasso.aau)
# print(paste('error=', min(lasso.aau$cvm),
#             sep = ''))

aau.lasso.pred = 
  lasso.aau$fit.preval[, lasso.aau$lambda == lasso.aau$lambda.min]

aau.lasso.error = aau.win.shares  - aau.lasso.pred

aau.lasso.rmse = sqrt(mean(aau.lasso.error^2))
# aau.lasso.rmse

# plot(aau.lasso.pred,
#      aau.win.shares,
#      xlim = c(min(aau.lasso.pred,
#                   aau.win.shares),
#               max(aau.lasso.pred,
#                   aau.win.shares)))
# abline(0,
#        1)



#### End ####




#### Lasso Prep ####
prep.predictors = model.matrix(sqrt.ws ~ .,
                              prep)
lasso.prep = cv.glmnet(x = prep.predictors[,2:dim(prep.predictors)[2]],
                      y = prep$sqrt.ws,
                      alpha = 1, nfolds = 10)


# plot(x = lasso.prep$lambda, y = lasso.prep$cvm)
# print('Coefficients:')
# coef(lasso.prep)
# print(paste('error=', min(lasso.prep$cvm),
#             sep = ''))

#### End ####


#### Ridge AAU ####
aau.predictors = model.matrix(sqrt.ws ~ .,
                              aau)
ridge.aau = cv.glmnet(x = aau.predictors[,2:dim(aau.predictors)[2]],
                      y = aau$sqrt.ws,
                      keep = T,
                      alpha = 0, nfolds = 10)


# plot(x = ridge.aau$lambda, y = ridge.aau$cvm)
# print('Coefficients:')
# coef(ridge.aau)
# print(paste('error=', min(ridge.aau$cvm),
#             sep = ''))

aau.ridge.pred = 
  ridge.aau$fit.preval[, ridge.aau$lambda == ridge.aau$lambda.min]

aau.ridge.error = aau.win.shares  - aau.ridge.pred

aau.ridge.rmse = sqrt(mean(aau.ridge.error^2))
# aau.ridge.rmse

# plot(aau.ridge.pred,
#      aau.win.shares,
#      xlim = c(min(aau.ridge.pred,
#                   aau.win.shares),
#               max(aau.ridge.pred,
#                   aau.win.shares)))
# abline(0,
#        1)



#### End ####




#### ridge Prep ####
prep.predictors = model.matrix(sqrt.ws ~ .,
                               prep)
ridge.prep = cv.glmnet(x = prep.predictors[,2:dim(prep.predictors)[2]],
                       y = prep$sqrt.ws,
                       alpha = 0, nfolds = 10)


# plot(x = ridge.prep$lambda, y = ridge.prep$cvm)
# print('Coefficients:')
# coef(ridge.prep)
# print(paste('error=', min(ridge.prep$cvm),
#             sep = ''))

#### End ####