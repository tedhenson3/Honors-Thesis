

source('~/Honors Thesis/Data Cleaning/Prepping Data for Modeling (ows).R')
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



prep.pred.pls = loocv.modeler(model = 'pls',
                              data = prep)


aau.pred.pls = loocv.modeler(model = 'pls',
                             data = aau)

espn.pred.lm = loocv.modeler(model = 'lm',
                             data = espn)

full.pred.pls = loocv.modeler(model = 'pls',
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




aau.espn.pred.pls = loocv.modeler(model = 'pls',
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




prep.espn.pred.pls = loocv.modeler(model = 'pls',
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




aau.prep.pred.pls = loocv.modeler(model = 'pls',
                                  data = aau.prep)

aau.prep.pred.xgbDART = loocv.modeler(model = 'xgbDART',
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
# espn.raw.pred.pls = loocv.modeler(model = 'pls',
#                                  data = espn.raw)
# 
# espn.raw.pred.xgbDART = loocv.modeler(model = 'xgbDART',
#                                       data = espn.raw)
# 
# 
# 
# espn.raw.pred.rf = loocv.modeler(model = 'rf',
#                                  data = espn.raw)
# 


espn.ows.predictions = data.frame(
  #pls = NA,
  lasso = espn.pred.lm,
  # ridge = c(rep(0, 185)),
  # rf = c(rep(0, 185)),
  earth = espn.pred.earth,
  svm.radial = espn.pred.svm,
  xgbDART = espn.pred.xgbDART)

prep.ows.predictions = data.frame(pls = prep.pred.pls,
                              lasso = prep.pred.lasso,
                              ridge = prep.pred.ridge,
                              rf = prep.pred.rf,
                              earth = prep.pred.earth,
                              svm.radial = prep.pred.svm,
                              xgbDART = prep.pred.xgbDART)

aau.ows.predictions = data.frame(pls = aau.pred.pls,
                             lasso = aau.pred.lasso,
                             ridge = aau.pred.ridge,
                             rf = aau.pred.rf,
                             earth = aau.pred.earth,
                             svm.radial = aau.pred.svm,
                             xgbDART = aau.pred.xgbDART)

full.ows.predictions = data.frame(pls = full.pred.pls,
                              lasso = full.pred.lasso,
                              ridge = full.pred.ridge,
                              rf = full.pred.rf,
                              earth = full.pred.earth,
                              svm.radial = full.pred.svm,
                              xgbDART = full.pred.xgbDART
)


aau.espn.ows.predictions = data.frame(pls = aau.espn.pred.pls,
                                  lasso = aau.espn.pred.lasso,
                                  ridge = aau.espn.pred.ridge,
                                  rf = aau.espn.pred.rf,
                                  earth = aau.espn.pred.earth,
                                  svm.radial = aau.espn.pred.svm,
                                  xgbDART = aau.espn.pred.xgbDART
)

prep.espn.ows.predictions = data.frame(pls = prep.espn.pred.pls,
                                   lasso = prep.espn.pred.lasso,
                                   ridge = prep.espn.pred.ridge,
                                   rf = prep.espn.pred.rf,
                                   earth = prep.espn.pred.earth,
                                   svm.radial = prep.espn.pred.svm,
                                   xgbDART = prep.espn.pred.xgbDART
)


aau.prep.ows.predictions = data.frame(pls = aau.prep.pred.pls,
                                  lasso = aau.prep.pred.lasso,
                                  ridge = aau.prep.pred.ridge,
                                  rf = aau.prep.pred.rf,
                                  earth = aau.prep.pred.earth,
                                  svm.radial = aau.prep.pred.svm,
                                  xgbDART = aau.prep.pred.xgbDART
)


source('~/Honors Thesis/Modeling/LOOCV Modeling Function (Stacked).R')

prep.pred.stacked  = loocv.stacked.modeler(preds = prep.ows.predictions,
                                           ws = prep.win.shares)


aau.pred.stacked = loocv.stacked.modeler(preds = aau.ows.predictions,
                                         ws = aau.win.shares)


espn.pred.stacked = loocv.stacked.modeler(preds = espn.ows.predictions,
                                          ws = espn.win.shares)

full.pred.stacked = loocv.stacked.modeler(preds = full.ows.predictions,
                                          ws = full.win.shares)


aau.espn.pred.stacked = loocv.stacked.modeler(preds = aau.espn.ows.predictions,
                                         ws = aau.espn.win.shares)

prep.espn.pred.stacked = loocv.stacked.modeler(preds = prep.espn.ows.predictions,
                                          ws = prep.espn.win.shares)

aau.prep.pred.stacked = loocv.stacked.modeler(preds = aau.prep.ows.predictions,
                                         ws = aau.prep.win.shares)


espn.ows.predictions = data.frame(pls = NA,
                              lasso = espn.pred.lm,
                              ridge = NA,
                              rf = NA,
                              earth = espn.pred.earth,
                              svm.radial = espn.pred.svm,
                              xgbDART = espn.pred.xgbDART,
                              stacked = espn.pred.stacked)

prep.ows.predictions = data.frame(pls = prep.pred.pls,
                              lasso = prep.pred.lasso,
                              ridge = prep.pred.ridge,
                              rf = prep.pred.rf,
                              earth = prep.pred.earth,
                              svm.radial = prep.pred.svm,
                              xgbDART = prep.pred.xgbDART,
                              stacked = prep.pred.stacked)

aau.ows.predictions = data.frame(pls = aau.pred.pls,
                             lasso = aau.pred.lasso,
                             ridge = aau.pred.ridge,
                             rf = aau.pred.rf,
                             earth = aau.pred.earth,
                             svm.radial = aau.pred.svm,
                             xgbDART = aau.pred.xgbDART,
                             stacked = aau.pred.stacked)

full.ows.predictions = data.frame(pls = full.pred.pls,
                              lasso = full.pred.lasso,
                              ridge = full.pred.ridge,
                              rf = full.pred.rf,
                              earth = full.pred.earth,
                              svm.radial = full.pred.svm,
                              xgbDART = full.pred.xgbDART,
                              stacked = full.pred.stacked
                              
)


aau.espn.ows.predictions = data.frame(pls = aau.espn.pred.pls,
                                  lasso = aau.espn.pred.lasso,
                                  ridge = aau.espn.pred.ridge,
                                  rf = aau.espn.pred.rf,
                                  earth = aau.espn.pred.earth,
                                  svm.radial = aau.espn.pred.svm,
                                  xgbDART = aau.espn.pred.xgbDART,
                                  stacked = aau.espn.pred.stacked
)

prep.espn.ows.predictions = data.frame(pls = prep.espn.pred.pls,
                                   lasso = prep.espn.pred.lasso,
                                   ridge = prep.espn.pred.ridge,
                                   rf = prep.espn.pred.rf,
                                   earth = prep.espn.pred.earth,
                                   svm.radial = prep.espn.pred.svm,
                                   xgbDART = prep.espn.pred.xgbDART,
                                   stacked = prep.espn.pred.stacked
)


aau.prep.ows.predictions = data.frame(pls = aau.prep.pred.pls,
                                  lasso = aau.prep.pred.lasso,
                                  ridge = aau.prep.pred.ridge,
                                  rf = aau.prep.pred.rf,
                                  earth = aau.prep.pred.earth,
                                  svm.radial = aau.prep.pred.svm,
                                  xgbDART = aau.prep.pred.xgbDART,
                                  stacked = aau.prep.pred.stacked
)


