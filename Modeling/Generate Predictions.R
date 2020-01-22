

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




prep.pred.earth = loocv.modeler(model = 'earth',
                                data = prep)


aau.pred.earth = loocv.modeler(model = 'earth',
                               data = aau)


espn.pred.earth = loocv.modeler(model = 'earth',
                                data = espn)

full.pred.earth = loocv.modeler(model = 'earth',
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




aau.espn.pred.earth = loocv.modeler(model = 'earth',
                                    data = aau.espn)




aau.espn.pred.lm = loocv.modeler(model = 'lm',
                                 data = aau.espn)

aau.espn.pred.xgbDART = loocv.modeler(model = 'xgbDART',
                                      data = aau.espn)



aau.espn.pred.rf = loocv.modeler(model = 'rf',
                                 data = aau.espn)



prep.espn.pred.lasso = loocv.modeler(model = 'lasso',
                                     data = prep.espn)


prep.espn.pred.ridge = loocv.modeler(model = 'ridge',
                                     data = prep.espn)


prep.espn.pred.svm = loocv.modeler(model = 'svm',
                                   data = prep.espn)




prep.espn.pred.earth = loocv.modeler(model = 'earth',
                                     data = prep.espn)




prep.espn.pred.lm = loocv.modeler(model = 'lm',
                                  data = prep.espn)

prep.espn.pred.xgbDART = loocv.modeler(model = 'xgbDART',
                                       data = prep.espn)



prep.espn.pred.rf = loocv.modeler(model = 'rf',
                                  data = prep.espn)




aau.prep.pred.lasso = loocv.modeler(model = 'lasso',
                                    data = aau.prep)


aau.prep.pred.ridge = loocv.modeler(model = 'ridge',
                                    data = aau.prep)


aau.prep.pred.svm = loocv.modeler(model = 'svm',
                                  data = aau.prep)




aau.prep.pred.earth = loocv.modeler(model = 'earth',
                                    data = aau.prep)




aau.prep.pred.lm = loocv.modeler(model = 'lm',
                                 data = aau.prep)

aau.prep.pred.xgbDART = loocv.modeler(model = 'xgbDART',
                                      data = aau.prep)



aau.prep.pred.rf = loocv.modeler(model = 'rf',
                                 data = aau.prep)

source('~/Honors Thesis/Modeling/LOOCV Modeling Function (Stacked).R')

prep.pred.stacked  = loocv.stacked.modeler(preds = prep.predictions,
                                           ws = prep.win.shares)


aau.pred.stacked = loocv.stacked.modeler(preds = aau.predictions,
                                         ws = aau.win.shares)


espn.pred.stacked = loocv.stacked.modeler(preds = espn.predictions,
                                          ws = espn.win.shares)

full.pred.stacked = loocv.stacked.modeler(preds = full.predictions,
                                          ws = full.win.shares)


aau.espn.pred.stacked = loocv.stacked.modeler(preds = aau.espn.predictions,
                                         ws = aau.espn.win.shares)

prep.espn.pred.stacked = loocv.stacked.modeler(preds = prep.espn.predictions,
                                          ws = prep.espn.win.shares)

aau.prep.pred.stacked = loocv.stacked.modeler(preds = aau.prep.predictions,
                                         ws = aau.prep.win.shares)


espn.predictions = data.frame(lm = espn.pred.lm,
                              lasso = espn.pred.lasso,
                              ridge = espn.pred.ridge,
                              rf = espn.pred.rf,
                              earth = espn.pred.earth,
                              svm.radial = espn.pred.svm,
                              xgbDART = espn.pred.xgbDART,
                              stacked = espn.pred.stacked)

prep.predictions = data.frame(lm = prep.pred.lm,
                              lasso = prep.pred.lasso,
                              ridge = prep.pred.ridge,
                              rf = prep.pred.rf,
                              earth = prep.pred.earth,
                              svm.radial = prep.pred.svm,
                              xgbDART = prep.pred.xgbDART,
                              stacked = prep.pred.stacked)

aau.predictions = data.frame(lm = aau.pred.lm,
                             lasso = aau.pred.lasso,
                             ridge = aau.pred.ridge,
                             rf = aau.pred.rf,
                             earth = aau.pred.earth,
                             svm.radial = aau.pred.svm,
                             xgbDART = aau.pred.xgbDART,
                             stacked = aau.pred.stacked)

full.predictions = data.frame(lm = full.pred.lm,
                              lasso = full.pred.lasso,
                              ridge = full.pred.ridge,
                              rf = full.pred.rf,
                              earth = full.pred.earth,
                              svm.radial = full.pred.svm,
                              xgbDART = full.pred.xgbDART,
                              stacked = full.pred.stacked
)


aau.espn.predictions = data.frame(lm = aau.espn.pred.lm,
                                  lasso = aau.espn.pred.lasso,
                                  ridge = aau.espn.pred.ridge,
                                  rf = aau.espn.pred.rf,
                                  earth = aau.espn.pred.earth,
                                  svm.radial = aau.espn.pred.svm,
                                  xgbDART = aau.espn.pred.xgbDART,
                                  stacked = aau.espn.pred.stacked
)

prep.espn.predictions = data.frame(lm = prep.espn.pred.lm,
                                   lasso = prep.espn.pred.lasso,
                                   ridge = prep.espn.pred.ridge,
                                   rf = prep.espn.pred.rf,
                                   earth = prep.espn.pred.earth,
                                   svm.radial = prep.espn.pred.svm,
                                   xgbDART = prep.espn.pred.xgbDART,
                                   stacked = prep.espn.pred.stacked
)


aau.prep.predictions = data.frame(lm = aau.prep.pred.lm,
                                  lasso = aau.prep.pred.lasso,
                                  ridge = aau.prep.pred.ridge,
                                  rf = aau.prep.pred.rf,
                                  earth = aau.prep.pred.earth,
                                  svm.radial = aau.prep.pred.svm,
                                  xgbDART = aau.prep.pred.xgbDART,
                                  stacked = aau.prep.pred.stacked
)





espn.errors = data.frame(lm = espn.win.shares - espn.pred.lm,
                         lasso = espn.win.shares - espn.pred.lasso,
                         ridge = espn.win.shares - espn.pred.ridge,
                         rf = espn.win.shares - espn.pred.rf,
                         earth = espn.win.shares - espn.pred.earth,
                         svm.radial = espn.win.shares - espn.pred.svm,
                         xgbDART = espn.win.shares - espn.pred.xgbDART,
                         stacked = espn.win.shares - espn.pred.stacked)

prep.errors = data.frame(lm = prep.win.shares - prep.pred.lm,
                         lasso = prep.win.shares - prep.pred.lasso,
                         ridge = prep.win.shares - prep.pred.ridge,
                         rf = prep.win.shares - prep.pred.rf,
                         earth = prep.win.shares - prep.pred.earth,
                         svm.radial = prep.win.shares - prep.pred.svm,
                         xgbDART = prep.win.shares - prep.pred.xgbDART,
                         stacked = prep.win.shares - prep.pred.stacked)


aau.errors = data.frame(lm = aau.win.shares - aau.pred.lm,
                        lasso = aau.win.shares - aau.pred.lasso,
                        ridge = aau.win.shares - aau.pred.ridge,
                        rf = aau.win.shares - aau.pred.rf,
                        earth = aau.win.shares - aau.pred.earth,
                        svm.radial = aau.win.shares - aau.pred.svm,
                        xgbDART = aau.win.shares - aau.pred.xgbDART,
                        stacked = aau.win.shares - aau.pred.stacked)

full.errors = data.frame(lm = full.win.shares - full.pred.lm,
                         lasso = full.win.shares - full.pred.lasso,
                         ridge = full.win.shares - full.pred.ridge,
                         rf = full.win.shares - full.pred.rf,
                         earth = full.win.shares - full.pred.earth,
                         svm.radial = full.win.shares - full.pred.svm,
                         xgbDART = full.win.shares - full.pred.xgbDART,
                         stacked = full.win.shares - full.pred.stacked)

aau.espn.errors = data.frame(lm = aau.espn.win.shares - aau.espn.pred.lm,
                             lasso = aau.espn.win.shares - aau.espn.pred.lasso,
                             ridge = aau.espn.win.shares - aau.espn.pred.ridge,
                             rf = aau.espn.win.shares - aau.espn.pred.rf,
                             earth = aau.espn.win.shares - aau.espn.pred.earth,
                             svm.radial = aau.espn.win.shares - aau.espn.pred.svm,
                             xgbDART = aau.espn.win.shares - aau.espn.pred.xgbDART,
                             stacked = aau.espn.win.shares - aau.espn.pred.stacked)

prep.espn.errors = data.frame(lm = prep.espn.win.shares - prep.espn.pred.lm,
                              lasso = prep.espn.win.shares - prep.espn.pred.lasso,
                              ridge = prep.espn.win.shares - prep.espn.pred.ridge,
                              rf = prep.espn.win.shares - prep.espn.pred.rf,
                              earth = prep.espn.win.shares - prep.espn.pred.earth,
                              svm.radial = prep.espn.win.shares - prep.espn.pred.svm,
                              xgbDART = prep.espn.win.shares - prep.espn.pred.xgbDART,
                              stacked = prep.espn.win.shares - prep.espn.pred.stacked)



aau.prep.errors = data.frame(lm = aau.prep.win.shares - aau.prep.pred.lm,
                             lasso = aau.prep.win.shares - aau.prep.pred.lasso,
                             ridge = aau.prep.win.shares - aau.prep.pred.ridge,
                             rf = aau.prep.win.shares - aau.prep.pred.rf,
                             earth = aau.prep.win.shares - aau.prep.pred.earth,
                             svm.radial = aau.prep.win.shares - aau.prep.pred.svm,
                             xgbDART = aau.prep.win.shares - aau.prep.pred.xgbDART,
                             stacked = aau.prep.win.shares - aau.prep.pred.stacked)





espn.rmse = data.frame(lm = sqrt(mean((espn.errors$lm)^2)), 
                       lasso = sqrt(mean((espn.errors$lasso)^2)),
                       ridge = sqrt(mean((espn.errors$ridge)^2)),
                       rf = sqrt(mean((espn.errors$rf)^2)),
                       earth = sqrt(mean((espn.errors$earth)^2)),
                       svm.radial = sqrt(mean((espn.errors$svm.radial)^2)),
                       xgbDART = sqrt(mean((espn.errors$xgbDART)^2)),
                       stacked = sqrt(mean((espn.errors$stacked)^2)))

prep.rmse = data.frame(lm = sqrt(mean((prep.errors$lm)^2)), 
                       lasso = sqrt(mean((prep.errors$lasso)^2)),
                       ridge = sqrt(mean((prep.errors$ridge)^2)),
                       rf = sqrt(mean((prep.errors$rf)^2)),
                       earth = sqrt(mean((prep.errors$earth)^2)),
                       svm.radial = sqrt(mean((prep.errors$svm.radial)^2)),
                       xgbDART = sqrt(mean((prep.errors$xgbDART)^2)),
                       stacked = sqrt(mean((prep.errors$stacked)^2)))


aau.rmse = data.frame(lm = sqrt(mean((aau.errors$lm)^2)), 
                      lasso = sqrt(mean((aau.errors$lasso)^2)),
                      ridge = sqrt(mean((aau.errors$ridge)^2)),
                      rf = sqrt(mean((aau.errors$rf)^2)),
                      earth = sqrt(mean((aau.errors$earth)^2)),
                      svm.radial = sqrt(mean((aau.errors$svm.radial)^2)),
                      xgbDART = sqrt(mean((aau.errors$xgbDART)^2)),
                      stacked = sqrt(mean((aau.errors$stacked)^2)))


full.rmse = data.frame(lm = sqrt(mean((full.errors$lm)^2)), 
                       lasso = sqrt(mean((full.errors$lasso)^2)),
                       ridge = sqrt(mean((full.errors$ridge)^2)),
                       rf = sqrt(mean((full.errors$rf)^2)),
                       earth = sqrt(mean((full.errors$earth)^2)),
                       svm.radial = sqrt(mean((full.errors$svm.radial)^2)),
                       xgbDART = sqrt(mean((full.errors$xgbDART)^2)),
                       stacked = sqrt(mean((full.errors$stacked)^2)))



aau.espn.rmse = data.frame(lm = sqrt(mean((aau.espn.errors$lm)^2)), 
                           lasso = sqrt(mean((aau.espn.errors$lasso)^2)),
                           ridge = sqrt(mean((aau.espn.errors$ridge)^2)),
                           rf = sqrt(mean((aau.espn.errors$rf)^2)),
                           earth = sqrt(mean((aau.espn.errors$earth)^2)),
                           svm.radial = sqrt(mean((aau.espn.errors$svm.radial)^2)),
                           xgbDART = sqrt(mean((aau.espn.errors$xgbDART)^2)),
                           stacked = sqrt(mean((aau.espn.errors$stacked)^2)))


prep.espn.rmse = data.frame(lm = sqrt(mean((prep.espn.errors$lm)^2)), 
                            lasso = sqrt(mean((prep.espn.errors$lasso)^2)),
                            ridge = sqrt(mean((prep.espn.errors$ridge)^2)),
                            rf = sqrt(mean((prep.espn.errors$rf)^2)),
                            earth = sqrt(mean((prep.espn.errors$earth)^2)),
                            svm.radial = sqrt(mean((prep.espn.errors$svm.radial)^2)),
                            xgbDART = sqrt(mean((prep.espn.errors$xgbDART)^2)),
                            stacked = sqrt(mean((prep.espn.errors$stacked)^2)))


aau.prep.rmse = data.frame(lm = sqrt(mean((aau.prep.errors$lm)^2)), 
                           lasso = sqrt(mean((aau.prep.errors$lasso)^2)),
                           ridge = sqrt(mean((aau.prep.errors$ridge)^2)),
                           rf = sqrt(mean((aau.prep.errors$rf)^2)),
                           earth = sqrt(mean((aau.prep.errors$earth)^2)),
                           svm.radial = sqrt(mean((aau.prep.errors$svm.radial)^2)),
                           xgbDART = sqrt(mean((aau.prep.errors$xgbDART)^2)),
                           stacked = sqrt(mean((aau.prep.errors$stacked)^2)))


final.rmse = cbind(t(espn.rmse), 
                   t(prep.rmse), 
                   t(aau.rmse), 
                   t(full.rmse),
                   t(aau.espn.rmse),
                   t(prep.espn.rmse),
                   t(aau.prep.rmse))
colnames(final.rmse) = c('espn', 'prep', 'aau', 'full', 'aau.espn', 
                         'prep.espn', 'aau.prep')
final.rmse

n.espn = nrow(espn)
n.prep = nrow(prep)
n.aau = nrow(aau)
n.full = nrow(full)
n.aau.espn = nrow(aau.espn)
n.prep.espn = nrow(prep.espn)
n.aau.prep = nrow(aau.prep)

n.vec = c(n.espn, n.prep, n.aau, n.full, n.aau.espn, n.prep.espn, n.aau.prep)

rmse.col.names = paste(colnames(final.rmse),' ',
                       'n=',n.vec, sep = '')

colnames(final.rmse) = rmse.col.names

save.image("~/Honors Thesis/Predictions/All Predictions (espn.rating 80 filtered).RData")

write.csv(final.rmse,
          file = '~/Honors Thesis/Predictions/All RMSEs (espn.rating 80 filtered).csv')


