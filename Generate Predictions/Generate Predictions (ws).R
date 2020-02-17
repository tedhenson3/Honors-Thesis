

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



prep.pred.pls = loocv.modeler(model = 'pls',
                             data = prep)


aau.pred.pls = loocv.modeler(model = 'pls',
                            data = aau)

espn.pred.lm = loocv.modeler(model = 'lm',
                             data = espn)

full.pred.pls = loocv.modeler(model = 'pls',
                             data = full)




prep.pred.brnn = loocv.modeler(model = 'brnn',
                                  data = prep)


aau.pred.brnn = loocv.modeler(model = 'brnn',
                                 data = aau)


espn.pred.brnn = loocv.modeler(model = 'brnn',
                                  data = espn)

full.pred.brnn = loocv.modeler(model = 'brnn',
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

aau.espn.pred.brnn = loocv.modeler(model = 'brnn',
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

prep.espn.pred.brnn = loocv.modeler(model = 'brnn',
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

aau.prep.pred.brnn = loocv.modeler(model = 'brnn',
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
# espn.raw.pred.brnn = loocv.modeler(model = 'brnn',
#                                       data = espn.raw)
# 
# 
# 
# espn.raw.pred.rf = loocv.modeler(model = 'rf',
#                                  data = espn.raw)
# 


espn.predictions = data.frame(
                              #pls = NA,
                              lasso = espn.pred.lm,
                              # ridge = c(rep(0, 185)),
                              # rf = c(rep(0, 185)),
                              earth = espn.pred.earth,
                              svm.radial = espn.pred.svm,
                              brnn = espn.pred.brnn)

prep.predictions = data.frame(pls = prep.pred.pls,
                              lasso = prep.pred.lasso,
                              ridge = prep.pred.ridge,
                              rf = prep.pred.rf,
                              earth = prep.pred.earth,
                              svm.radial = prep.pred.svm,
                              brnn = prep.pred.brnn)

aau.predictions = data.frame(pls = aau.pred.pls,
                             lasso = aau.pred.lasso,
                             ridge = aau.pred.ridge,
                             rf = aau.pred.rf,
                             earth = aau.pred.earth,
                             svm.radial = aau.pred.svm,
                             brnn = aau.pred.brnn)

full.predictions = data.frame(pls = full.pred.pls,
                              lasso = full.pred.lasso,
                              ridge = full.pred.ridge,
                              rf = full.pred.rf,
                              earth = full.pred.earth,
                              svm.radial = full.pred.svm,
                              brnn = full.pred.brnn
)


aau.espn.predictions = data.frame(pls = aau.espn.pred.pls,
                                  lasso = aau.espn.pred.lasso,
                                  ridge = aau.espn.pred.ridge,
                                  rf = aau.espn.pred.rf,
                                  earth = aau.espn.pred.earth,
                                  svm.radial = aau.espn.pred.svm,
                                  brnn = aau.espn.pred.brnn
)

prep.espn.predictions = data.frame(pls = prep.espn.pred.pls,
                                   lasso = prep.espn.pred.lasso,
                                   ridge = prep.espn.pred.ridge,
                                   rf = prep.espn.pred.rf,
                                   earth = prep.espn.pred.earth,
                                   svm.radial = prep.espn.pred.svm,
                                   brnn = prep.espn.pred.brnn
)


aau.prep.predictions = data.frame(pls = aau.prep.pred.pls,
                                  lasso = aau.prep.pred.lasso,
                                  ridge = aau.prep.pred.ridge,
                                  rf = aau.prep.pred.rf,
                                  earth = aau.prep.pred.earth,
                                  svm.radial = aau.prep.pred.svm,
                                  brnn = aau.prep.pred.brnn
)

# 
# espn.raw.predictions = data.frame(pls = espn.raw.pred.pls,
#                                   lasso = NULL,
#                                   ridge = NULL,
#                                   rf = espn.raw.pred.rf,
#                                   earth = espn.raw.pred.earth,
#                                   svm.radial = espn.raw.pred.svm,
#                                   brnn = espn.raw.pred.brnn
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

full.pred.stacked = loocv.stacked.modeler(preds = full.predictions,
                                          ws = full.win.shares)


aau.espn.pred.stacked = loocv.stacked.modeler(preds = aau.espn.predictions,
                                         ws = aau.espn.win.shares)

prep.espn.pred.stacked = loocv.stacked.modeler(preds = prep.espn.predictions,
                                          ws = prep.espn.win.shares)

aau.prep.pred.stacked = loocv.stacked.modeler(preds = aau.prep.predictions,
                                         ws = aau.prep.win.shares)


# espn.raw.pred.stacked = loocv.stacked.modeler(preds = espn.raw.predictions,
#                                               ws = espn.raw.win.shares)


espn.predictions = data.frame(pls = NA,
                              lasso = espn.pred.lm,
                              ridge = espn.pred.lm,
                              rf = NA,
                              earth = espn.pred.earth,
                              svm.radial = espn.pred.svm,
                              brnn = espn.pred.brnn,
                              stacked = espn.pred.stacked)

prep.predictions = data.frame(pls = prep.pred.pls,
                              lasso = prep.pred.lasso,
                              ridge = prep.pred.ridge,
                              rf = prep.pred.rf,
                              earth = prep.pred.earth,
                              svm.radial = prep.pred.svm,
                              brnn = prep.pred.brnn,
                              stacked = prep.pred.stacked)

aau.predictions = data.frame(pls = aau.pred.pls,
                             lasso = aau.pred.lasso,
                             ridge = aau.pred.ridge,
                             rf = aau.pred.rf,
                             earth = aau.pred.earth,
                             svm.radial = aau.pred.svm,
                             brnn = aau.pred.brnn,
                             stacked = aau.pred.stacked)

full.predictions = data.frame(pls = full.pred.pls,
                              lasso = full.pred.lasso,
                              ridge = full.pred.ridge,
                              rf = full.pred.rf,
                              earth = full.pred.earth,
                              svm.radial = full.pred.svm,
                              brnn = full.pred.brnn,
                              stacked = full.pred.stacked
)


aau.espn.predictions = data.frame(pls = aau.espn.pred.pls,
                                  lasso = aau.espn.pred.lasso,
                                  ridge = aau.espn.pred.ridge,
                                  rf = aau.espn.pred.rf,
                                  earth = aau.espn.pred.earth,
                                  svm.radial = aau.espn.pred.svm,
                                  brnn = aau.espn.pred.brnn,
                                  stacked = aau.espn.pred.stacked
)

prep.espn.predictions = data.frame(pls = prep.espn.pred.pls,
                                   lasso = prep.espn.pred.lasso,
                                   ridge = prep.espn.pred.ridge,
                                   rf = prep.espn.pred.rf,
                                   earth = prep.espn.pred.earth,
                                   svm.radial = prep.espn.pred.svm,
                                   brnn = prep.espn.pred.brnn,
                                   stacked = prep.espn.pred.stacked
)


aau.prep.predictions = data.frame(pls = aau.prep.pred.pls,
                                  lasso = aau.prep.pred.lasso,
                                  ridge = aau.prep.pred.ridge,
                                  rf = aau.prep.pred.rf,
                                  earth = aau.prep.pred.earth,
                                  svm.radial = aau.prep.pred.svm,
                                  brnn = aau.prep.pred.brnn,
                                  stacked = aau.prep.pred.stacked
)


# 
# espn.raw.predictions = data.frame(pls = espn.raw.pred.pls,
#                                   lasso = espn.raw.pred.lasso,
#                                   ridge = espn.raw.pred.ridge,
#                                   rf = espn.raw.pred.rf,
#                                   earth = espn.raw.pred.earth,
#                                   svm.radial = espn.raw.pred.svm,
#                                   brnn = espn.raw.pred.brnn,
#                                   stacked = espn.raw.pred.stacked
# )




espn.errors = data.frame(pls = NA,
                         lasso =espn.win.shares - espn.pred.lm,
                         ridge = espn.win.shares - espn.pred.lm,
                         rf = NA,
                         earth = espn.win.shares - espn.pred.earth,
                         svm.radial = espn.win.shares - espn.pred.svm,
                         brnn = espn.win.shares - espn.pred.brnn,
                         stacked = espn.win.shares - espn.pred.stacked)

prep.errors = data.frame(pls = prep.win.shares - prep.pred.pls,
                         lasso = prep.win.shares - prep.pred.lasso,
                         ridge = prep.win.shares - prep.pred.ridge,
                         rf = prep.win.shares - prep.pred.rf,
                         earth = prep.win.shares - prep.pred.earth,
                         svm.radial = prep.win.shares - prep.pred.svm,
                         brnn = prep.win.shares - prep.pred.brnn,
                         stacked = prep.win.shares - prep.pred.stacked)


aau.errors = data.frame(pls = aau.win.shares - aau.pred.pls,
                        lasso = aau.win.shares - aau.pred.lasso,
                        ridge = aau.win.shares - aau.pred.ridge,
                        rf = aau.win.shares - aau.pred.rf,
                        earth = aau.win.shares - aau.pred.earth,
                        svm.radial = aau.win.shares - aau.pred.svm,
                        brnn = aau.win.shares - aau.pred.brnn,
                        stacked = aau.win.shares - aau.pred.stacked)

full.errors = data.frame(pls = full.win.shares - full.pred.pls,
                         lasso = full.win.shares - full.pred.lasso,
                         ridge = full.win.shares - full.pred.ridge,
                         rf = full.win.shares - full.pred.rf,
                         earth = full.win.shares - full.pred.earth,
                         svm.radial = full.win.shares - full.pred.svm,
                         brnn = full.win.shares - full.pred.brnn,
                         stacked = full.win.shares - full.pred.stacked)

aau.espn.errors = data.frame(pls = aau.espn.win.shares - aau.espn.pred.pls,
                             lasso = aau.espn.win.shares - aau.espn.pred.lasso,
                             ridge = aau.espn.win.shares - aau.espn.pred.ridge,
                             rf = aau.espn.win.shares - aau.espn.pred.rf,
                             earth = aau.espn.win.shares - aau.espn.pred.earth,
                             svm.radial = aau.espn.win.shares - aau.espn.pred.svm,
                             brnn = aau.espn.win.shares - aau.espn.pred.brnn,
                             stacked = aau.espn.win.shares - aau.espn.pred.stacked)

prep.espn.errors = data.frame(pls = prep.espn.win.shares - prep.espn.pred.pls,
                              lasso = prep.espn.win.shares - prep.espn.pred.lasso,
                              ridge = prep.espn.win.shares - prep.espn.pred.ridge,
                              rf = prep.espn.win.shares - prep.espn.pred.rf,
                              earth = prep.espn.win.shares - prep.espn.pred.earth,
                              svm.radial = prep.espn.win.shares - prep.espn.pred.svm,
                              brnn = prep.espn.win.shares - prep.espn.pred.brnn,
                              stacked = prep.espn.win.shares - prep.espn.pred.stacked)



aau.prep.errors = data.frame(pls = aau.prep.win.shares - aau.prep.pred.pls,
                             lasso = aau.prep.win.shares - aau.prep.pred.lasso,
                             ridge = aau.prep.win.shares - aau.prep.pred.ridge,
                             rf = aau.prep.win.shares - aau.prep.pred.rf,
                             earth = aau.prep.win.shares - aau.prep.pred.earth,
                             svm.radial = aau.prep.win.shares - aau.prep.pred.svm,
                             brnn = aau.prep.win.shares - aau.prep.pred.brnn,
                             stacked = aau.prep.win.shares - aau.prep.pred.stacked)


# espn.raw.errors = data.frame(pls = espn.raw.win.shares - espn.raw.pred.pls,
#                              lasso = espn.raw.win.shares - espn.raw.pred.lasso,
#                              ridge = espn.raw.win.shares - espn.raw.pred.ridge,
#                              rf = espn.raw.win.shares - espn.raw.pred.rf,
#                              earth = espn.raw.win.shares - espn.raw.pred.earth,
#                              svm.radial = espn.raw.win.shares - espn.raw.pred.svm,
#                              brnn = espn.raw.win.shares - espn.raw.pred.brnn,
#                              stacked = espn.raw.win.shares - espn.raw.pred.stacked)
# 
# 



espn.rmse = data.frame(pls = NA, 
                       lasso = sqrt(mean((espn.errors$lasso)^2)),
                       ridge = sqrt(mean((espn.errors$ridge)^2)),
                       rf = NA,
                       earth = sqrt(mean((espn.errors$earth)^2)),
                       svm.radial = sqrt(mean((espn.errors$svm.radial)^2)),
                       brnn = sqrt(mean((espn.errors$brnn)^2)),
                       stacked = sqrt(mean((espn.errors$stacked)^2)))

prep.rmse = data.frame(pls = sqrt(mean((prep.errors$pls)^2)), 
                       lasso = sqrt(mean((prep.errors$lasso)^2)),
                       ridge = sqrt(mean((prep.errors$ridge)^2)),
                       rf = sqrt(mean((prep.errors$rf)^2)),
                       earth = sqrt(mean((prep.errors$earth)^2)),
                       svm.radial = sqrt(mean((prep.errors$svm.radial)^2)),
                       brnn = sqrt(mean((prep.errors$brnn)^2)),
                       stacked = sqrt(mean((prep.errors$stacked)^2)))


aau.rmse = data.frame(pls = sqrt(mean((aau.errors$pls)^2)), 
                      lasso = sqrt(mean((aau.errors$lasso)^2)),
                      ridge = sqrt(mean((aau.errors$ridge)^2)),
                      rf = sqrt(mean((aau.errors$rf)^2)),
                      earth = sqrt(mean((aau.errors$earth)^2)),
                      svm.radial = sqrt(mean((aau.errors$svm.radial)^2)),
                      brnn = sqrt(mean((aau.errors$brnn)^2)),
                      stacked = sqrt(mean((aau.errors$stacked)^2)))


full.rmse = data.frame(pls = sqrt(mean((full.errors$pls)^2)), 
                       lasso = sqrt(mean((full.errors$lasso)^2)),
                       ridge = sqrt(mean((full.errors$ridge)^2)),
                       rf = sqrt(mean((full.errors$rf)^2)),
                       earth = sqrt(mean((full.errors$earth)^2)),
                       svm.radial = sqrt(mean((full.errors$svm.radial)^2)),
                       brnn = sqrt(mean((full.errors$brnn)^2)),
                       stacked = sqrt(mean((full.errors$stacked)^2)))



aau.espn.rmse = data.frame(pls = sqrt(mean((aau.espn.errors$pls)^2)), 
                           lasso = sqrt(mean((aau.espn.errors$lasso)^2)),
                           ridge = sqrt(mean((aau.espn.errors$ridge)^2)),
                           rf = sqrt(mean((aau.espn.errors$rf)^2)),
                           earth = sqrt(mean((aau.espn.errors$earth)^2)),
                           svm.radial = sqrt(mean((aau.espn.errors$svm.radial)^2)),
                           brnn = sqrt(mean((aau.espn.errors$brnn)^2)),
                           stacked = sqrt(mean((aau.espn.errors$stacked)^2)))


prep.espn.rmse = data.frame(pls = sqrt(mean((prep.espn.errors$pls)^2)), 
                            lasso = sqrt(mean((prep.espn.errors$lasso)^2)),
                            ridge = sqrt(mean((prep.espn.errors$ridge)^2)),
                            rf = sqrt(mean((prep.espn.errors$rf)^2)),
                            earth = sqrt(mean((prep.espn.errors$earth)^2)),
                            svm.radial = sqrt(mean((prep.espn.errors$svm.radial)^2)),
                            brnn = sqrt(mean((prep.espn.errors$brnn)^2)),
                            stacked = sqrt(mean((prep.espn.errors$stacked)^2)))


aau.prep.rmse = data.frame(pls = sqrt(mean((aau.prep.errors$pls)^2)), 
                           lasso = sqrt(mean((aau.prep.errors$lasso)^2)),
                           ridge = sqrt(mean((aau.prep.errors$ridge)^2)),
                           rf = sqrt(mean((aau.prep.errors$rf)^2)),
                           earth = sqrt(mean((aau.prep.errors$earth)^2)),
                           svm.radial = sqrt(mean((aau.prep.errors$svm.radial)^2)),
                           brnn = sqrt(mean((aau.prep.errors$brnn)^2)),
                           stacked = sqrt(mean((aau.prep.errors$stacked)^2)))


# espn.raw.rmse = data.frame(pls = sqrt(mean((espn.raw.errors$pls)^2)), 
#                            lasso = sqrt(mean((espn.raw.errors$lasso)^2)),
#                            ridge = sqrt(mean((espn.raw.errors$ridge)^2)),
#                            rf = sqrt(mean((espn.raw.errors$rf)^2)),
#                            earth = sqrt(mean((espn.raw.errors$earth)^2)),
#                            svm.radial = sqrt(mean((espn.raw.errors$svm.radial)^2)),
#                            brnn = sqrt(mean((espn.raw.errors$brnn)^2)),
#                            stacked = sqrt(mean((espn.raw.errors$stacked)^2)))

full.cv.r2=  data.frame(pls = cor(full.win.shares, full.predictions$pls)^2, 
lasso = cor(full.win.shares, full.predictions$lasso)^2,
ridge = cor(full.win.shares, full.predictions$ridge)^2,
rf = cor(full.win.shares, full.predictions$rf)^2,
earth = cor(full.win.shares, full.predictions$earth)^2,
svm.radial = cor(full.win.shares, full.predictions$svm.radial)^2,
brnn = cor(full.win.shares, full.predictions$brnn)^2,
stacked = cor(full.win.shares, full.predictions$stacked)^2)


final.rmse = cbind(t(espn.rmse), 
                   t(prep.rmse), 
                   t(aau.rmse), 
                   t(full.rmse),
                   t(aau.espn.rmse),
                   t(prep.espn.rmse),
                   t(aau.prep.rmse))
colnames(final.rmse) = c('espn', 'prep', 'aau', 'full', 'aau.espn', 
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


save.image("~/Honors Thesis/Model Environments/All Predictions (raw ws 5 folds brnn).RData")

write.csv(final.rmse,
          file = '~/Honors Thesis/Predictions/All RMSEs (raw ws 5 folds brnn).csv')


