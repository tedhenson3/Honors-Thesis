

source('~/Honors Thesis/Data Cleaning/Prepping Data for Modeling.R')
source('~/Honors Thesis/Modeling/LOOCV Modeling Function.R')


prep.pred.lasso = loocv.modeler(model = 'lasso',
                                data = prep,
                                cbb.games = prep.games,
                                cbb.win.shares =  full.win.shares)


aau.pred.lasso = loocv.modeler(model = 'lasso',
                               data = aau,
                               cbb.games = aau.games,
                               cbb.win.shares =  aau.win.shares)


espn.pred.lasso = loocv.modeler(model = 'lasso',
                                data = espn,
                                cbb.games = espn.games,
                                cbb.win.shares =  espn.win.shares)

full.pred.lasso = loocv.modeler(model = 'lasso',
                                data = full,
                                cbb.games = full.games,
                                cbb.win.shares =  full.win.shares)


prep.pred.ridge = loocv.modeler(model = 'ridge',
                                data = prep,
                                cbb.games = prep.games,
                                cbb.win.shares =  full.win.shares)


aau.pred.ridge = loocv.modeler(model = 'ridge',
                               data = aau,
                               cbb.games = aau.games,
                               cbb.win.shares =  aau.win.shares)


espn.pred.ridge = loocv.modeler(model = 'ridge',
                                data = espn,
                                cbb.games = espn.games,
                                cbb.win.shares =  espn.win.shares)

full.pred.ridge = loocv.modeler(model = 'ridge',
                                data = full,
                                cbb.games = full.games,
                                cbb.win.shares =  full.win.shares)



prep.pred.svm = loocv.modeler(model = 'svm',
                              data = prep,
                              cbb.games = prep.games,
                              cbb.win.shares =  full.win.shares)


aau.pred.svm = loocv.modeler(model = 'svm',
                             data = aau,
                             cbb.games = aau.games,
                             cbb.win.shares =  aau.win.shares)


espn.pred.svm = loocv.modeler(model = 'svm',
                              data = espn,
                              cbb.games = espn.games,
                              cbb.win.shares =  espn.win.shares)

full.pred.svm = loocv.modeler(model = 'svm',
                              data = full,
                              cbb.games = full.games,
                              cbb.win.shares =  full.win.shares)




prep.pred.nnet = loocv.modeler(model = 'nnet',
                               data = prep,
                               cbb.games = prep.games,
                               cbb.win.shares =  full.win.shares)


aau.pred.nnet = loocv.modeler(model = 'nnet',
                              data = aau,
                              cbb.games = aau.games,
                              cbb.win.shares =  aau.win.shares)


espn.pred.nnet = loocv.modeler(model = 'nnet',
                               data = espn,
                               cbb.games = espn.games,
                               cbb.win.shares =  espn.win.shares)

full.pred.nnet = loocv.modeler(model = 'nnet',
                               data = full,
                               cbb.games = full.games,
                               cbb.win.shares =  full.win.shares)



prep.pred.lm = loocv.modeler(model = 'lm',
                             data = prep,
                             cbb.games = prep.games,
                             cbb.win.shares =  full.win.shares)


aau.pred.lm = loocv.modeler(model = 'lm',
                            data = aau,
                            cbb.games = aau.games,
                            cbb.win.shares =  aau.win.shares)


espn.pred.lm = loocv.modeler(model = 'lm',
                             data = espn,
                             cbb.games = espn.games,
                             cbb.win.shares =  espn.win.shares)

full.pred.lm = loocv.modeler(model = 'lm',
                             data = full,
                             cbb.games = full.games,
                             cbb.win.shares =  full.win.shares)




prep.pred.xgbDART = loocv.modeler(model = 'xgbDART',
              data = prep,
              cbb.games = prep.games,
              cbb.win.shares =  full.win.shares)


aau.pred.xgbDART = loocv.modeler(model = 'xgbDART',
              data = aau,
              cbb.games = aau.games,
              cbb.win.shares =  aau.win.shares)


espn.pred.xgbDART = loocv.modeler(model = 'xgbDART',
              data = espn,
              cbb.games = espn.games,
              cbb.win.shares =  espn.win.shares)

full.pred.xgbDART = loocv.modeler(model = 'xgbDART',
                             data = full,
                             cbb.games = full.games,
                             cbb.win.shares =  full.win.shares)



prep.pred.rf = loocv.modeler(model = 'rf',
                             data = prep,
                             cbb.games = prep.games,
                             cbb.win.shares =  full.win.shares)


aau.pred.rf = loocv.modeler(model = 'rf',
                            data = aau,
                            cbb.games = aau.games,
                            cbb.win.shares =  aau.win.shares)


espn.pred.rf = loocv.modeler(model = 'rf',
                             data = espn,
                             cbb.games = espn.games,
                             cbb.win.shares =  espn.win.shares)

full.pred.rf = loocv.modeler(model = 'rf',
                             data = full,
                             cbb.games = full.games,
                             cbb.win.shares =  full.win.shares)




espn.predictions = data.frame(lm = espn.pred.lm^3,
                                  lasso = espn.pred.lasso^3,
                                  ridge = espn.pred.ridge^3,
                                  rf = espn.pred.rf^3,
                                  nnet = espn.pred.nnet^3,
                                  svm.radial = espn.pred.svm^3,
                                  xgbDART = espn.pred.xgbDART^3)

prep.predictions = data.frame(lm = prep.pred.lm^3,
                                  lasso = prep.pred.lasso^3,
                                  ridge = prep.pred.ridge^3,
                                  rf = prep.pred.rf^3,
                                  nnet = prep.pred.nnet^3,
                                  svm.radial = prep.pred.svm^3,
                                  xgbDART = prep.pred.xgbDART^3)

aau.predictions = data.frame(lm = aau.pred.lm^3,
                                 lasso = aau.pred.lasso^3,
                                 ridge = aau.pred.ridge^3,
                                 rf = aau.pred.rf^3,
                                 nnet = aau.pred.nnet^3,
                                 svm.radial = aau.pred.svm^3,
                                 xgbDART = aau.pred.xgbDART^3)

full.predictions = data.frame(lm = full.pred.lm,
                                  lasso = full.pred.lasso,
                                  ridge = full.pred.ridge,
                                  rf = full.pred.rf,
                                  nnet = full.pred.nnet,
                                  svm.radial = full.pred.svm,
                                  xgbDART = full.pred.xgbDART
                              )


espn.errors = data.frame(lm = espn.win.shares - espn.pred.lm,
                         lasso = espn.win.shares - espn.pred.lasso,
                         ridge = espn.win.shares - espn.pred.ridge,
                         rf = espn.win.shares - espn.pred.rf,
                         nnet = espn.win.shares - espn.pred.nnet,
                         svm.radial = espn.win.shares - espn.pred.svm,
                         xgbDART = espn.win.shares - espn.pred.xgbDART)

prep.errors = data.frame(lm = prep.win.shares - prep.pred.lm,
                         lasso = prep.win.shares - prep.pred.lasso,
                         ridge = prep.win.shares - prep.pred.ridge,
                         rf = prep.win.shares - prep.pred.rf,
                         nnet = prep.win.shares - prep.pred.nnet,
                         svm.radial = prep.win.shares - prep.pred.svm,
                         xgbDART = prep.win.shares - prep.pred.xgbDART)


aau.errors = data.frame(lm = aau.win.shares - aau.pred.lm,
                         lasso = aau.win.shares - aau.pred.lasso,
                         ridge = aau.win.shares - aau.pred.ridge,
                         rf = aau.win.shares - aau.pred.rf,
                         nnet = aau.win.shares - aau.pred.nnet,
                         svm.radial = aau.win.shares - aau.pred.svm,
                         xgbDART = aau.win.shares - aau.pred.xgbDART)

full.errors = data.frame(lm = full.win.shares - full.pred.lm,
                        lasso = full.win.shares - full.pred.lasso,
                        ridge = full.win.shares - full.pred.ridge,
                        rf = full.win.shares - full.pred.rf,
                        nnet = full.win.shares - full.pred.nnet,
                        svm.radial = full.win.shares - full.pred.svm,
                        xgbDART = full.win.shares - full.pred.xgbDART)


espn.rmse = data.frame(lm = sqrt(mean((espn.errors$lm)^2)), 
                       lasso = sqrt(mean((espn.errors$lasso)^2)),
                       ridge = sqrt(mean((espn.errors$ridge)^2)),
                       rf = sqrt(mean((espn.errors$rf)^2)),
                       nnet = sqrt(mean((espn.errors$nnet)^2)),
                       svm.radial = sqrt(mean((espn.errors$svm.radial)^2)),
                       xgbDART = sqrt(mean((espn.errors$xgbDART)^2)))

prep.rmse = data.frame(lm = sqrt(mean((prep.errors$lm)^2)), 
                       lasso = sqrt(mean((prep.errors$lasso)^2)),
                       ridge = sqrt(mean((prep.errors$ridge)^2)),
                       rf = sqrt(mean((prep.errors$rf)^2)),
                       nnet = sqrt(mean((prep.errors$nnet)^2)),
                       svm.radial = sqrt(mean((prep.errors$svm.radial)^2)),
                       xgbDART = sqrt(mean((prep.errors$xgbDART)^2)))


aau.rmse = data.frame(lm = sqrt(mean((aau.errors$lm)^2)), 
                       lasso = sqrt(mean((aau.errors$lasso)^2)),
                       ridge = sqrt(mean((aau.errors$ridge)^2)),
                       rf = sqrt(mean((aau.errors$rf)^2)),
                       nnet = sqrt(mean((aau.errors$nnet)^2)),
                       svm.radial = sqrt(mean((aau.errors$svm.radial)^2)),
                       xgbDART = sqrt(mean((aau.errors$xgbDART)^2)))


full.rmse = data.frame(lm = sqrt(mean((full.errors$lm)^2)), 
                      lasso = sqrt(mean((full.errors$lasso)^2)),
                      ridge = sqrt(mean((full.errors$ridge)^2)),
                      rf = sqrt(mean((full.errors$rf)^2)),
                      nnet = sqrt(mean((full.errors$nnet)^2)),
                      svm.radial = sqrt(mean((full.errors$svm.radial)^2)),
                      xgbDART = sqrt(mean((full.errors$xgbDART)^2)))

final.rmse = cbind(t(espn.rmse), t(prep.rmse), t(aau.rmse), t(full.rmse))
colnames(final.rmse) = c('espn', 'prep', 'aau', 'full')
final.rmse


save.image("~/Honors Thesis/Predictions/All Predictions (espn.rating 80 filtered).RData")

write.csv(final.rmse,
          row.names = F,
          file = '~/Honors Thesis/Predictions/All RMSEs (espn.rating 80 filtered).csv')


