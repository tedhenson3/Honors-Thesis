

source('~/Honors Thesis/Data Cleaning/Prepping Data for Modeling.R')
source('~/Honors Thesis/Modeling/LOOCV Modeling Function.R')



prep.pred.xgboost = loocv.modeler(model = 'xgboost',
                              data = prep)


aau.pred.xgboost = loocv.modeler(model = 'xgboost',
                             data = aau)


espn.pred.xgboost = loocv.modeler(model = 'xgboost',
                              data = espn)

full.pred.xgboost = loocv.modeler(model = 'xgboost',
                              data = full)



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



prep.pred.nnet = loocv.modeler(model = 'nnet',
                             data = prep)


aau.pred.nnet = loocv.modeler(model = 'nnet',
                            data = aau)

espn.pred.nnet = loocv.modeler(model = 'nnet',
                             data = espn)

full.pred.nnet = loocv.modeler(model = 'nnet',
                             data = full)





prep.pred.rf = loocv.modeler(model = 'rf',
                             data = prep)


aau.pred.rf = loocv.modeler(model = 'rf',
                            data = aau)


espn.pred.rf = NA

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




aau.espn.pred.nnet = loocv.modeler(model = 'nnet',
                                 data = aau.espn)

aau.espn.pred.xgboost = loocv.modeler(model = 'xgboost',
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




prep.espn.pred.nnet = loocv.modeler(model = 'nnet',
                                  data = prep.espn)

prep.espn.pred.xgboost = loocv.modeler(model = 'xgboost',
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




aau.prep.pred.nnet = loocv.modeler(model = 'nnet',
                                 data = aau.prep)

aau.prep.pred.xgboost = loocv.modeler(model = 'xgboost',
                                      data = aau.prep)



aau.prep.pred.rf = loocv.modeler(model = 'rf',
                                 data = aau.prep)

#### ESPN RAW ####

# 
# espn.raw.pred.svm = loocv.modeler(model = 'svm',
#                                   data = espn.raw)
# 
# 
# 
# 
# espn.raw.pred.earth = loocv.modeler(model = 'earth',
#                                     data = espn.raw)
# 
# 
# 
# 
# espn.raw.pred.nnet = loocv.modeler(model = 'nnet',
#                                  data = espn.raw)
# 
# espn.raw.pred.xgboost = loocv.modeler(model = 'xgboost',
#                                       data = espn.raw)
# 
# 
# 
# espn.raw.pred.rf = loocv.modeler(model = 'rf',
#                                  data = espn.raw)
# 


espn.predictions = data.frame(
                              #nnet = NA,
                              #lasso = espn.pred.nnet,
                              # ridge = c(rep(0, 185)),
                              # rf = c(rep(0, 185)),
                              earth = espn.pred.earth,
                              svm.radial = espn.pred.svm,
                              xgboost = espn.pred.xgboost)

prep.predictions = data.frame(nnet = prep.pred.nnet,
                              lasso = prep.pred.lasso,
                              ridge = prep.pred.ridge,
                              rf = prep.pred.rf,
                              earth = prep.pred.earth,
                              svm.radial = prep.pred.svm,
                              xgboost = prep.pred.xgboost)

aau.predictions = data.frame(nnet = aau.pred.nnet,
                             lasso = aau.pred.lasso,
                             ridge = aau.pred.ridge,
                             rf = aau.pred.rf,
                             earth = aau.pred.earth,
                             svm.radial = aau.pred.svm,
                             xgboost = aau.pred.xgboost)

full.predictions = data.frame(nnet = full.pred.nnet,
                              lasso = full.pred.lasso,
                              ridge = full.pred.ridge,
                              rf = full.pred.rf,
                              earth = full.pred.earth,
                              svm.radial = full.pred.svm,
                              xgboost = full.pred.xgboost
)


aau.espn.predictions = data.frame(nnet = aau.espn.pred.nnet,
                                  lasso = aau.espn.pred.lasso,
                                  ridge = aau.espn.pred.ridge,
                                  rf = aau.espn.pred.rf,
                                  earth = aau.espn.pred.earth,
                                  svm.radial = aau.espn.pred.svm,
                                  xgboost = aau.espn.pred.xgboost
)

prep.espn.predictions = data.frame(nnet = prep.espn.pred.nnet,
                                   lasso = prep.espn.pred.lasso,
                                   ridge = prep.espn.pred.ridge,
                                   rf = prep.espn.pred.rf,
                                   earth = prep.espn.pred.earth,
                                   svm.radial = prep.espn.pred.svm,
                                   xgboost = prep.espn.pred.xgboost
)


aau.prep.predictions = data.frame(nnet = aau.prep.pred.nnet,
                                  lasso = aau.prep.pred.lasso,
                                  ridge = aau.prep.pred.ridge,
                                  rf = aau.prep.pred.rf,
                                  earth = aau.prep.pred.earth,
                                  svm.radial = aau.prep.pred.svm,
                                  xgboost = aau.prep.pred.xgboost
)

# 
# espn.raw.predictions = data.frame(nnet = espn.raw.pred.nnet,
#                                   lasso = NULL,
#                                   ridge = NULL,
#                                   rf = espn.raw.pred.rf,
#                                   earth = espn.raw.pred.earth,
#                                   svm.radial = espn.raw.pred.svm,
#                                   xgboost = espn.raw.pred.xgboost
# )
# 
# 



source('~/Honors Thesis/Modeling/LOOCV Modeling Function (Stacked).R')

prep.pred.stacked  = loocv.stacked.modeler(preds = prep.predictions,
                                           ws = prep.win.shares)


aau.pred.stacked = loocv.stacked.modeler(preds = aau.predictions,
                                         ws = aau.win.shares)


espn.pred.stacked = loocv.stacked.modeler(preds = espn.predictions,
                                          ws = espn.win.shares)




aau.espn.pred.stacked = loocv.stacked.modeler(preds = aau.espn.predictions,
                                         ws = aau.espn.win.shares)

prep.espn.pred.stacked = loocv.stacked.modeler(preds = prep.espn.predictions,
                                          ws = prep.espn.win.shares)

aau.prep.pred.stacked = loocv.stacked.modeler(preds = aau.prep.predictions,
                                         ws = aau.prep.win.shares)

full.pred.stacked = loocv.stacked.modeler(preds = full.predictions,
                                          ws = full.win.shares)
# espn.raw.pred.stacked = loocv.stacked.modeler(preds = espn.raw.predictions,
#                                               ws = espn.raw.win.shares)


espn.predictions = data.frame(nnet = NA,
                              lasso = NA,
                              ridge = NA,
                              rf = NA,
                              earth = espn.pred.earth,
                              svm.radial = espn.pred.svm,
                              xgboost = espn.pred.xgboost,
                              stacked = espn.pred.stacked)

prep.predictions = data.frame(nnet = prep.pred.nnet,
                              lasso = prep.pred.lasso,
                              ridge = prep.pred.ridge,
                              rf = prep.pred.rf,
                              earth = prep.pred.earth,
                              svm.radial = prep.pred.svm,
                              xgboost = prep.pred.xgboost,
                              stacked = prep.pred.stacked)

aau.predictions = data.frame(nnet = aau.pred.nnet,
                             lasso = aau.pred.lasso,
                             ridge = aau.pred.ridge,
                             rf = aau.pred.rf,
                             earth = aau.pred.earth,
                             svm.radial = aau.pred.svm,
                             xgboost = aau.pred.xgboost,
                             stacked = aau.pred.stacked)

full.predictions = data.frame(nnet = full.pred.nnet,
                              lasso = full.pred.lasso,
                              ridge = full.pred.ridge,
                              rf = full.pred.rf,
                              earth = full.pred.earth,
                              svm.radial = full.pred.svm,
                              xgboost = full.pred.xgboost,
                              stacked = full.pred.stacked
)


aau.espn.predictions = data.frame(nnet = aau.espn.pred.nnet,
                                  lasso = aau.espn.pred.lasso,
                                  ridge = aau.espn.pred.ridge,
                                  rf = aau.espn.pred.rf,
                                  earth = aau.espn.pred.earth,
                                  svm.radial = aau.espn.pred.svm,
                                  xgboost = aau.espn.pred.xgboost,
                                  stacked = aau.espn.pred.stacked
)

prep.espn.predictions = data.frame(nnet = prep.espn.pred.nnet,
                                   lasso = prep.espn.pred.lasso,
                                   ridge = prep.espn.pred.ridge,
                                   rf = prep.espn.pred.rf,
                                   earth = prep.espn.pred.earth,
                                   svm.radial = prep.espn.pred.svm,
                                   xgboost = prep.espn.pred.xgboost,
                                   stacked = prep.espn.pred.stacked
)


aau.prep.predictions = data.frame(nnet = aau.prep.pred.nnet,
                                  lasso = aau.prep.pred.lasso,
                                  ridge = aau.prep.pred.ridge,
                                  rf = aau.prep.pred.rf,
                                  earth = aau.prep.pred.earth,
                                  svm.radial = aau.prep.pred.svm,
                                  xgboost = aau.prep.pred.xgboost,
                                  stacked = aau.prep.pred.stacked
)


# 
# espn.raw.predictions = data.frame(nnet = espn.raw.pred.nnet,
#                                   lasso = espn.raw.pred.lasso,
#                                   ridge = espn.raw.pred.ridge,
#                                   rf = espn.raw.pred.rf,
#                                   earth = espn.raw.pred.earth,
#                                   svm.radial = espn.raw.pred.svm,
#                                   xgboost = espn.raw.pred.xgboost,
#                                   stacked = espn.raw.pred.stacked
# )




espn.errors = data.frame(nnet = espn.win.shares - espn.pred.nnet,
                         lasso =NA,
                         ridge = NA,
                         rf = NA,
                         earth = espn.win.shares - espn.pred.earth,
                         svm.radial = espn.win.shares - espn.pred.svm,
                         xgboost = espn.win.shares - espn.pred.xgboost,
                         stacked = espn.win.shares - espn.pred.stacked)

prep.errors = data.frame(nnet = prep.win.shares - prep.pred.nnet,
                         lasso = prep.win.shares - prep.pred.lasso,
                         ridge = prep.win.shares - prep.pred.ridge,
                         rf = prep.win.shares - prep.pred.rf,
                         earth = prep.win.shares - prep.pred.earth,
                         svm.radial = prep.win.shares - prep.pred.svm,
                         xgboost = prep.win.shares - prep.pred.xgboost,
                         stacked = prep.win.shares - prep.pred.stacked)


aau.errors = data.frame(nnet = aau.win.shares - aau.pred.nnet,
                        lasso = aau.win.shares - aau.pred.lasso,
                        ridge = aau.win.shares - aau.pred.ridge,
                        rf = aau.win.shares - aau.pred.rf,
                        earth = aau.win.shares - aau.pred.earth,
                        svm.radial = aau.win.shares - aau.pred.svm,
                        xgboost = aau.win.shares - aau.pred.xgboost,
                        stacked = aau.win.shares - aau.pred.stacked)

full.errors = data.frame(nnet = full.win.shares - full.pred.nnet,
                         lasso = full.win.shares - full.pred.lasso,
                         ridge = full.win.shares - full.pred.ridge,
                         rf = full.win.shares - full.pred.rf,
                         earth = full.win.shares - full.pred.earth,
                         svm.radial = full.win.shares - full.pred.svm,
                         xgboost = full.win.shares - full.pred.xgboost,
                         stacked = full.win.shares - full.pred.stacked)

aau.espn.errors = data.frame(nnet = aau.espn.win.shares - aau.espn.pred.nnet,
                             lasso = aau.espn.win.shares - aau.espn.pred.lasso,
                             ridge = aau.espn.win.shares - aau.espn.pred.ridge,
                             rf = aau.espn.win.shares - aau.espn.pred.rf,
                             earth = aau.espn.win.shares - aau.espn.pred.earth,
                             svm.radial = aau.espn.win.shares - aau.espn.pred.svm,
                             xgboost = aau.espn.win.shares - aau.espn.pred.xgboost,
                             stacked = aau.espn.win.shares - aau.espn.pred.stacked)

prep.espn.errors = data.frame(nnet = prep.espn.win.shares - prep.espn.pred.nnet,
                              lasso = prep.espn.win.shares - prep.espn.pred.lasso,
                              ridge = prep.espn.win.shares - prep.espn.pred.ridge,
                              rf = prep.espn.win.shares - prep.espn.pred.rf,
                              earth = prep.espn.win.shares - prep.espn.pred.earth,
                              svm.radial = prep.espn.win.shares - prep.espn.pred.svm,
                              xgboost = prep.espn.win.shares - prep.espn.pred.xgboost,
                              stacked = prep.espn.win.shares - prep.espn.pred.stacked)



aau.prep.errors = data.frame(nnet = aau.prep.win.shares - aau.prep.pred.nnet,
                             lasso = aau.prep.win.shares - aau.prep.pred.lasso,
                             ridge = aau.prep.win.shares - aau.prep.pred.ridge,
                             rf = aau.prep.win.shares - aau.prep.pred.rf,
                             earth = aau.prep.win.shares - aau.prep.pred.earth,
                             svm.radial = aau.prep.win.shares - aau.prep.pred.svm,
                             xgboost = aau.prep.win.shares - aau.prep.pred.xgboost,
                             stacked = aau.prep.win.shares - aau.prep.pred.stacked)


# espn.raw.errors = data.frame(nnet = espn.raw.win.shares - espn.raw.pred.nnet,
#                              lasso = espn.raw.win.shares - espn.raw.pred.lasso,
#                              ridge = espn.raw.win.shares - espn.raw.pred.ridge,
#                              rf = espn.raw.win.shares - espn.raw.pred.rf,
#                              earth = espn.raw.win.shares - espn.raw.pred.earth,
#                              svm.radial = espn.raw.win.shares - espn.raw.pred.svm,
#                              xgboost = espn.raw.win.shares - espn.raw.pred.xgboost,
#                              stacked = espn.raw.win.shares - espn.raw.pred.stacked)
# 
# 



espn.rmse = data.frame(nnet = sqrt(mean((espn.errors$lasso)^2)), 
                       lasso = NA,
                       ridge = NA,
                       rf = NA,
                       earth = sqrt(mean((espn.errors$earth)^2)),
                       svm.radial = sqrt(mean((espn.errors$svm.radial)^2)),
                       xgboost = sqrt(mean((espn.errors$xgboost)^2)),
                       stacked = sqrt(mean((espn.errors$stacked)^2)))

prep.rmse = data.frame(nnet = sqrt(mean((prep.errors$nnet)^2)), 
                       lasso = sqrt(mean((prep.errors$lasso)^2)),
                       ridge = sqrt(mean((prep.errors$ridge)^2)),
                       rf = sqrt(mean((prep.errors$rf)^2)),
                       earth = sqrt(mean((prep.errors$earth)^2)),
                       svm.radial = sqrt(mean((prep.errors$svm.radial)^2)),
                       xgboost = sqrt(mean((prep.errors$xgboost)^2)),
                       stacked = sqrt(mean((prep.errors$stacked)^2)))


aau.rmse = data.frame(nnet = sqrt(mean((aau.errors$nnet)^2)), 
                      lasso = sqrt(mean((aau.errors$lasso)^2)),
                      ridge = sqrt(mean((aau.errors$ridge)^2)),
                      rf = sqrt(mean((aau.errors$rf)^2)),
                      earth = sqrt(mean((aau.errors$earth)^2)),
                      svm.radial = sqrt(mean((aau.errors$svm.radial)^2)),
                      xgboost = sqrt(mean((aau.errors$xgboost)^2)),
                      stacked = sqrt(mean((aau.errors$stacked)^2)))


full.rmse = data.frame(nnet = sqrt(mean((full.errors$nnet)^2)), 
                       lasso = sqrt(mean((full.errors$lasso)^2)),
                       ridge = sqrt(mean((full.errors$ridge)^2)),
                       rf = sqrt(mean((full.errors$rf)^2)),
                       earth = sqrt(mean((full.errors$earth)^2)),
                       svm.radial = sqrt(mean((full.errors$svm.radial)^2)),
                       xgboost = sqrt(mean((full.errors$xgboost)^2)),
                       stacked = sqrt(mean((full.errors$stacked)^2)))



aau.espn.rmse = data.frame(nnet = sqrt(mean((aau.espn.errors$nnet)^2)), 
                           lasso = sqrt(mean((aau.espn.errors$lasso)^2)),
                           ridge = sqrt(mean((aau.espn.errors$ridge)^2)),
                           rf = sqrt(mean((aau.espn.errors$rf)^2)),
                           earth = sqrt(mean((aau.espn.errors$earth)^2)),
                           svm.radial = sqrt(mean((aau.espn.errors$svm.radial)^2)),
                           xgboost = sqrt(mean((aau.espn.errors$xgboost)^2)),
                           stacked = sqrt(mean((aau.espn.errors$stacked)^2)))


prep.espn.rmse = data.frame(nnet = sqrt(mean((prep.espn.errors$nnet)^2)), 
                            lasso = sqrt(mean((prep.espn.errors$lasso)^2)),
                            ridge = sqrt(mean((prep.espn.errors$ridge)^2)),
                            rf = sqrt(mean((prep.espn.errors$rf)^2)),
                            earth = sqrt(mean((prep.espn.errors$earth)^2)),
                            svm.radial = sqrt(mean((prep.espn.errors$svm.radial)^2)),
                            xgboost = sqrt(mean((prep.espn.errors$xgboost)^2)),
                            stacked = sqrt(mean((prep.espn.errors$stacked)^2)))


aau.prep.rmse = data.frame(nnet = sqrt(mean((aau.prep.errors$nnet)^2)), 
                           lasso = sqrt(mean((aau.prep.errors$lasso)^2)),
                           ridge = sqrt(mean((aau.prep.errors$ridge)^2)),
                           rf = sqrt(mean((aau.prep.errors$rf)^2)),
                           earth = sqrt(mean((aau.prep.errors$earth)^2)),
                           svm.radial = sqrt(mean((aau.prep.errors$svm.radial)^2)),
                           xgboost = sqrt(mean((aau.prep.errors$xgboost)^2)),
                           stacked = sqrt(mean((aau.prep.errors$stacked)^2)))


# espn.raw.rmse = data.frame(nnet = sqrt(mean((espn.raw.errors$nnet)^2)), 
#                            lasso = sqrt(mean((espn.raw.errors$lasso)^2)),
#                            ridge = sqrt(mean((espn.raw.errors$ridge)^2)),
#                            rf = sqrt(mean((espn.raw.errors$rf)^2)),
#                            earth = sqrt(mean((espn.raw.errors$earth)^2)),
#                            svm.radial = sqrt(mean((espn.raw.errors$svm.radial)^2)),
#                            xgboost = sqrt(mean((espn.raw.errors$xgboost)^2)),
#                            stacked = sqrt(mean((espn.raw.errors$stacked)^2)))

full.r2=  data.frame(nnet = cor(x = full.win.shares, y =full.predictions$nnet)^2, 
                     lasso = cor(x = full.win.shares, y =full.predictions$lasso)^2,
                     ridge = cor(x = full.win.shares, y =full.predictions$ridge)^2,
                     rf = cor(x = full.win.shares, y =full.predictions$rf)^2,
                     earth = cor(x = full.win.shares, y =full.predictions$earth)^2,
                     svm.radial = cor(x = full.win.shares, y =full.predictions$svm.radial)^2,
                     xgboost = cor(x = full.win.shares, y =full.predictions$xgboost)^2,
                     stacked = cor(x = full.win.shares, y =full.predictions$stacked)^2)

espn.r2=  data.frame(nnet = cor(x = espn.win.shares, y =espn.predictions$nnet)^2, 
                     lasso = NA,
                     ridge = NA,
                     rf = NA,
                     earth = cor(x = espn.win.shares, y =espn.predictions$earth)^2,
                     svm.radial = cor(x = espn.win.shares, y =espn.predictions$svm.radial)^2,
                     xgboost = NA,
                     stacked = cor(x = espn.win.shares, y =espn.predictions$stacked)^2)


prep.r2=  data.frame(nnet = cor(x = prep.win.shares,y = prep.predictions$nnet)^2, 
                     lasso = cor(x = prep.win.shares, y =prep.predictions$lasso)^2,
                     ridge = cor(x = prep.win.shares, y =prep.predictions$ridge)^2,
                     rf = cor(x = prep.win.shares, y =prep.predictions$rf)^2,
                     earth = cor(x = prep.win.shares, y =prep.predictions$earth)^2,
                     svm.radial = cor(x = prep.win.shares, y =prep.predictions$svm.radial)^2,
                     xgboost = cor(x = prep.win.shares, y =prep.predictions$xgboost)^2,
                     stacked = cor(x = prep.win.shares, y =prep.predictions$stacked)^2)


aau.r2=  data.frame(nnet = cor(x = aau.win.shares, y =aau.predictions$nnet)^2, 
                    lasso = cor(x = aau.win.shares, y =aau.predictions$lasso)^2,
                    ridge = cor(x = aau.win.shares, y =aau.predictions$ridge)^2,
                    rf = cor(x = aau.win.shares, y =aau.predictions$rf)^2,
                    earth = cor(x = aau.win.shares, y =aau.predictions$earth)^2,
                    svm.radial = cor(x = aau.win.shares, y =aau.predictions$svm.radial)^2,
                    xgboost = cor(x = aau.win.shares, y =aau.predictions$xgboost)^2,
                    stacked = cor(x = aau.win.shares, y =aau.predictions$stacked)^2)



aau.espn.r2=  data.frame(nnet = cor(x = aau.espn.win.shares, y =aau.espn.predictions$nnet)^2, 
                         lasso = cor(x = aau.espn.win.shares, y =aau.espn.predictions$lasso)^2,
                         ridge = cor(x = aau.espn.win.shares, y =aau.espn.predictions$ridge)^2,
                         rf = cor(x = aau.espn.win.shares, y =aau.espn.predictions$rf)^2,
                         earth = cor(x = aau.espn.win.shares, y =aau.espn.predictions$earth)^2,
                         svm.radial = cor(x = aau.espn.win.shares, y =aau.espn.predictions$svm.radial)^2,
                         xgboost = cor(x = aau.espn.win.shares, y =aau.espn.predictions$xgboost)^2,
                         stacked = cor(x = aau.espn.win.shares, y =aau.espn.predictions$stacked)^2)


prep.espn.r2=  data.frame(nnet = cor(x = prep.espn.win.shares, y =prep.espn.predictions$nnet)^2, 
                          lasso = cor(x = prep.espn.win.shares, y =prep.espn.predictions$lasso)^2,
                          ridge = cor(x = prep.espn.win.shares, y =prep.espn.predictions$ridge)^2,
                          rf = cor(x = prep.espn.win.shares, y =prep.espn.predictions$rf)^2,
                          earth = cor(x = prep.espn.win.shares, y =prep.espn.predictions$earth)^2,
                          svm.radial = cor(x = prep.espn.win.shares, y =prep.espn.predictions$svm.radial)^2,
                          xgboost = cor(x = prep.espn.win.shares, y =prep.espn.predictions$xgboost)^2,
                          stacked = cor(x = prep.espn.win.shares, y =prep.espn.predictions$stacked)^2)


aau.prep.r2=  data.frame(nnet = cor(x = aau.prep.win.shares, y =aau.prep.predictions$nnet)^2, 
                         lasso = cor(x = aau.prep.win.shares, y =aau.prep.predictions$lasso)^2,
                         ridge = cor(x = aau.prep.win.shares, y =aau.prep.predictions$ridge)^2,
                         rf = cor(x = aau.prep.win.shares, y =aau.prep.predictions$rf)^2,
                         earth = cor(x = aau.prep.win.shares, y =aau.prep.predictions$earth)^2,
                         svm.radial = cor(x = aau.prep.win.shares, y =aau.prep.predictions$svm.radial)^2,
                         xgboost = cor(x = aau.prep.win.shares, y =aau.prep.predictions$xgboost)^2,
                         stacked = cor(x = aau.prep.win.shares, y =aau.prep.predictions$stacked)^2)


final.rmse = cbind(t(espn.rmse), 
                   t(prep.rmse), 
                   t(aau.rmse), 
                   t(full.rmse),
                   t(aau.espn.rmse),
                   t(prep.espn.rmse),
                   t(aau.prep.rmse))
colnames(final.rmse) = c('espn', 'prep', 'aau', 'full', 'aau.espn', 
                         'prep.espn', 'aau.prep')



final.r2 = cbind(t(espn.r2), 
                   t(prep.r2), 
                   t(aau.r2), 
                   t(full.r2),
                   t(aau.espn.r2),
                   t(prep.espn.r2),
                   t(aau.prep.r2))
colnames(final.r2) = c('espn', 'prep', 'aau', 'full', 'aau.espn', 
                         'prep.espn', 'aau.prep')

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
final.rmse


r2.col.names = paste(colnames(final.r2),' ',
                       'n=',n.vec, sep = '')

colnames(final.r2) = r2.col.names
final.r2


write.csv(final.r2,
          file = '~/Honors Thesis/Predictions/All R2 (final).csv')

save.image("~/Honors Thesis/Model Environments/All Predictions (raw ws final).RData")
# 
# write.csv(final.rmse,
#           file = '~/Honors Thesis/Predictions/All RMSEs (raw ws 5 folds xgboost).csv')
# 
# 
