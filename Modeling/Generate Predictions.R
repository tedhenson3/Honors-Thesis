

source('~/Honors Thesis/Data Cleaning/Prepping Data for Modeling.R')
source('~/Honors Thesis/Modeling/LOOCV Modeling Function.R')


prep.pred.lasso = loocv.modeler(model = 'lasso',
                                data = prep)


aau.pred.lasso = loocv.modeler(model = 'lasso',
                               data = aau)


espn.pred.lasso = loocv.modeler(model = 'lasso',
                                data = espn)

full.pred.lasso = loocv.modeler(model = 'lasso',
                                data = full)


prep.pred.ridge = loocv.modeler(model = 'ridge',
                                data = prep)


aau.pred.ridge = loocv.modeler(model = 'ridge',
                               data = aau)


espn.pred.ridge = loocv.modeler(model = 'ridge',
                                data = espn)

full.pred.ridge = loocv.modeler(model = 'ridge',
                                data = full)



prep.pred.svm = loocv.modeler(model = 'svm',
                              data = prep)


aau.pred.svm = loocv.modeler(model = 'svm',
                             data = aau)


espn.pred.svm = loocv.modeler(model = 'svm',
                              data = espn)

full.pred.svm = loocv.modeler(model = 'svm',
                              data = full)




prep.pred.nnet = loocv.modeler(model = 'nnet',
                               data = prep)


aau.pred.nnet = loocv.modeler(model = 'nnet',
                              data = aau)


espn.pred.nnet = loocv.modeler(model = 'nnet',
                               data = espn)

full.pred.nnet = loocv.modeler(model = 'nnet',
                               data = full)



prep.pred.lm = loocv.modeler(model = 'lm',
                             data = prep)


aau.pred.lm = loocv.modeler(model = 'lm',
                            data = aau)


espn.pred.lm = loocv.modeler(model = 'lm',
                             data = espn)

full.pred.lm = loocv.modeler(model = 'lm',
                             data = full)




prep.pred.xgbDART = loocv.modeler(model = 'xgbDART',
              data = prep)


aau.pred.xgbDART = loocv.modeler(model = 'xgbDART',
              data = aau)


espn.pred.xgbDART = loocv.modeler(model = 'xgbDART',
              data = espn)

full.pred.xgbDART = loocv.modeler(model = 'xgbDART',
                             data = full)



prep.pred.rf = loocv.modeler(model = 'rf',
                             data = prep)


aau.pred.rf = loocv.modeler(model = 'rf',
                            data = aau)


espn.pred.rf = loocv.modeler(model = 'rf',
                             data = espn)

full.pred.rf = loocv.modeler(model = 'rf',
                             data = full)


aau.espn.pred.lasso = loocv.modeler(model = 'lasso',
                                    data = aau.espn)


aau.espn.pred.ridge = loocv.modeler(model = 'ridge',
                                    data = aau.espn)


aau.espn.pred.svm = loocv.modeler(model = 'svm',
                                  data = aau.espn)




aau.espn.pred.nnet = loocv.modeler(model = 'nnet',
                                   data = aau.espn)




aau.espn.pred.lm = loocv.modeler(model = 'lm',
                                 data = aau.espn)

aau.espn.pred.xgbDART = loocv.modeler(model = 'xgbDART',
                                      data = aau.espn)



aau.espn.pred.rf = loocv.modeler(model = 'rf',
                                 data = aau.espn)





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

full.predictions = data.frame(lm = full.pred.lm^3,
                                  lasso = full.pred.lasso^3,
                                  ridge = full.pred.ridge^3,
                                  rf = full.pred.rf^3,
                                  nnet = full.pred.nnet^3,
                                  svm.radial = full.pred.svm^3,
                                  xgbDART = full.pred.xgbDART^3
                              )


aau.espn.predictions = data.frame(lm = aau.espn.pred.lm^3,
                              lasso = aau.espn.pred.lasso^3,
                              ridge = aau.espn.pred.ridge^3,
                              rf = aau.espn.pred.rf^3,
                              nnet = aau.espn.pred.nnet^3,
                              svm.radial = aau.espn.pred.svm^3,
                              xgbDART = aau.espn.pred.xgbDART^3
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

aau.espn.errors = data.frame(lm = aau.espn.win.shares - aau.espn.pred.lm,
                         lasso = aau.espn.win.shares - aau.espn.pred.lasso,
                         ridge = aau.espn.win.shares - aau.espn.pred.ridge,
                         rf = aau.espn.win.shares - aau.espn.pred.rf,
                         nnet = aau.espn.win.shares - aau.espn.pred.nnet,
                         svm.radial = aau.espn.win.shares - aau.espn.pred.svm,
                         xgbDART = aau.espn.win.shares - aau.espn.pred.xgbDART)


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



aau.espn.rmse = data.frame(lm = sqrt(mean((aau.espn.errors$lm)^2)), 
                       lasso = sqrt(mean((aau.espn.errors$lasso)^2)),
                       ridge = sqrt(mean((aau.espn.errors$ridge)^2)),
                       rf = sqrt(mean((aau.espn.errors$rf)^2)),
                       nnet = sqrt(mean((aau.espn.errors$nnet)^2)),
                       svm.radial = sqrt(mean((aau.espn.errors$svm.radial)^2)),
                       xgbDART = sqrt(mean((aau.espn.errors$xgbDART)^2)))

final.rmse = cbind(t(espn.rmse), 
                   t(prep.rmse), 
                   t(aau.rmse), 
                   t(full.rmse),
                   t(aau.espn.rmse))
colnames(final.rmse) = c('espn', 'prep', 'aau', 'full', 'aau.espn')
final.rmse


save.image("~/Honors Thesis/Predictions/All Predictions (espn.rating 80 filtered).RData")

write.csv(final.rmse,
          row.names = F,
          file = '~/Honors Thesis/Predictions/All RMSEs (espn.rating 80 filtered).csv')


