

#load("~/Honors Thesis/Model Environments/All Predictions (complete players dws).RData")
espn.predictions = data.frame(pls = NA,
                            
                              lasso = 
              loocv.stacked.modeler(preds = data.frame(espn.ows.predictions$lasso,
                                                 espn.dws.predictions$lasso),
                                                      espn.win.shares),
             ridge = NA,
             
             rf = NA,
                              earth = 
                                loocv.stacked.modeler(preds = data.frame(espn.ows.predictions$earth,
                                                                    espn.dws.predictions$earth),
                                                      espn.win.shares),
                              svm.radial = 
                                loocv.stacked.modeler(preds = data.frame(espn.ows.predictions$svm.radial,
                                                                    espn.dws.predictions$svm.radial),
                                                      espn.win.shares),
                              
                              xgbDART = loocv.stacked.modeler(preds = data.frame(espn.ows.predictions$xgbDART,
                                                                            espn.dws.predictions$xgbDART),
                                                              espn.win.shares),
                              stacked = loocv.stacked.modeler(preds = data.frame(espn.ows.predictions$stacked,
                                                                            espn.dws.predictions$stacked),
                                                              espn.win.shares))


prep.predictions = data.frame(pls = 
                                loocv.stacked.modeler(preds = data.frame(prep.ows.predictions$pls,
                                                                    prep.dws.predictions$pls),
                                                      prep.win.shares),
                              lasso = 
                                loocv.stacked.modeler(preds = data.frame(prep.ows.predictions$lasso,
                                                                    prep.dws.predictions$lasso),
                                                      prep.win.shares),
                              ridge = 
                                loocv.stacked.modeler(preds = data.frame(prep.ows.predictions$ridge,
                                                                         prep.dws.predictions$ridge),
                                                      prep.win.shares),
                              
                              rf = 
                                loocv.stacked.modeler(preds = data.frame(prep.ows.predictions$rf,
                                                                         prep.dws.predictions$rf),
                                                      prep.win.shares),
                              earth = 
                                loocv.stacked.modeler(preds = data.frame(prep.ows.predictions$earth,
                                                                    prep.dws.predictions$earth),
                                                      prep.win.shares),
                              svm.radial = 
                                loocv.stacked.modeler(preds = data.frame(prep.ows.predictions$svm.radial,
                                                                    prep.dws.predictions$svm.radial),
                                                      prep.win.shares),
                              
                              xgbDART = loocv.stacked.modeler(preds = data.frame(prep.ows.predictions$xgbDART,
                                                                            prep.dws.predictions$xgbDART),
                                                              prep.win.shares),
                              stacked = loocv.stacked.modeler(preds = data.frame(prep.ows.predictions$stacked,
                                                                            prep.dws.predictions$stacked),
                                                              prep.win.shares))
aau.predictions = data.frame(pls = 
                               loocv.stacked.modeler(preds = data.frame(aau.ows.predictions$pls,
                                                                   aau.dws.predictions$pls),
                                                     aau.win.shares),
                             lasso = 
                               loocv.stacked.modeler(preds = data.frame(aau.ows.predictions$lasso,
                                                                   aau.dws.predictions$lasso),
                                                     aau.win.shares),
                             
                             
                             ridge = 
                               loocv.stacked.modeler(preds = data.frame(aau.ows.predictions$ridge,
                                                                        aau.dws.predictions$ridge),
                                                     aau.win.shares),
                             
                             rf = 
                               loocv.stacked.modeler(preds = data.frame(aau.ows.predictions$rf,
                                                                        aau.dws.predictions$rf),
                                                     aau.win.shares),
                             earth = 
                               loocv.stacked.modeler(preds = data.frame(aau.ows.predictions$earth,
                                                                   aau.dws.predictions$earth),
                                                     aau.win.shares),
                             svm.radial = 
                               loocv.stacked.modeler(preds = data.frame(aau.ows.predictions$svm.radial,
                                                                   aau.dws.predictions$svm.radial),
                                                     aau.win.shares),
                             
                             xgbDART = loocv.stacked.modeler(preds = data.frame(aau.ows.predictions$xgbDART,
                                                                           aau.dws.predictions$xgbDART),
                                                             aau.win.shares),
                             stacked = loocv.stacked.modeler(preds = data.frame(aau.ows.predictions$stacked,
                                                                           aau.dws.predictions$stacked),
                                                             aau.win.shares))

full.predictions = data.frame(pls = 
                                loocv.stacked.modeler(preds = data.frame(full.ows.predictions$pls,
                                                                    full.dws.predictions$pls),
                                                      full.win.shares),
                              lasso = 
                                loocv.stacked.modeler(preds = data.frame(full.ows.predictions$lasso,
                                                                    full.dws.predictions$lasso),
                                                      full.win.shares),
                              
                              ridge = 
                                loocv.stacked.modeler(preds = data.frame(full.ows.predictions$ridge,
                                                                         full.dws.predictions$ridge),
                                                      full.win.shares),
                              
                              rf = 
                                loocv.stacked.modeler(preds = data.frame(full.ows.predictions$rf,
                                                                         full.dws.predictions$rf),
                                                      full.win.shares),
                              earth = 
                                loocv.stacked.modeler(preds = data.frame(full.ows.predictions$earth,
                                                                    full.dws.predictions$earth),
                                                      full.win.shares),
                              svm.radial = 
                                loocv.stacked.modeler(preds = data.frame(full.ows.predictions$svm.radial,
                                                                    full.dws.predictions$svm.radial),
                                                      full.win.shares),
                              
                              xgbDART = loocv.stacked.modeler(preds = data.frame(full.ows.predictions$xgbDART,
                                                                            full.dws.predictions$xgbDART),
                                                              full.win.shares),
                              stacked = loocv.stacked.modeler(preds = data.frame(full.ows.predictions$stacked,
                                                                            full.dws.predictions$stacked),
                                                              full.win.shares))
aau.espn.predictions = data.frame(pls = 
                                    loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$pls,
                                                                        aau.espn.dws.predictions$pls),
                                                          aau.espn.win.shares),
                                  lasso = 
                                    loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$lasso,
                                                                        aau.espn.dws.predictions$lasso),
                                                          aau.espn.win.shares),
                                  
                                  ridge = 
                                    loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$ridge,
                                                                             aau.espn.dws.predictions$ridge),
                                                          aau.espn.win.shares),
                                  
                                  rf = 
                                    loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$rf,
                                                                             aau.espn.dws.predictions$rf),
                                                          aau.espn.win.shares),
                                  earth = 
                                    loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$earth,
                                                                        aau.espn.dws.predictions$earth),
                                                          aau.espn.win.shares),
                                  svm.radial = 
                                    loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$svm.radial,
                                                                        aau.espn.dws.predictions$svm.radial),
                                                          aau.espn.win.shares),
                                  
                                  xgbDART = loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$xgbDART,
                                                                                aau.espn.dws.predictions$xgbDART),
                                                                  aau.espn.win.shares),
                                  stacked = loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$stacked,
                                                                                aau.espn.dws.predictions$stacked),
                                                                  aau.espn.win.shares))
prep.espn.predictions = data.frame(pls = 
                                     loocv.stacked.modeler(preds = data.frame(prep.espn.ows.predictions$pls,
                                                                         prep.espn.dws.predictions$pls),
                                                           prep.espn.win.shares),
                                   lasso = 
                                     loocv.stacked.modeler(preds = data.frame(prep.espn.ows.predictions$lasso,
                              prep.espn.dws.predictions$lasso),
                                                           prep.espn.win.shares),
                                   
                                   ridge = 
                                     loocv.stacked.modeler(preds = data.frame(prep.espn.ows.predictions$ridge,
                                                                              prep.espn.dws.predictions$ridge),
                                                           prep.espn.win.shares),
                                   
                                   rf = 
                                     loocv.stacked.modeler(preds = data.frame(prep.espn.ows.predictions$rf,
                                                                              prep.espn.dws.predictions$rf),
                                                           prep.espn.win.shares),
                                   earth = 
                                     loocv.stacked.modeler(preds = data.frame(prep.espn.ows.predictions$earth,
                                                                         prep.espn.dws.predictions$earth),
                                                           prep.espn.win.shares),
                                   svm.radial = 
                                     loocv.stacked.modeler(preds = data.frame(prep.espn.ows.predictions$svm.radial,
                                                                         prep.espn.dws.predictions$svm.radial),
                                                           prep.espn.win.shares),
                                   
                                   xgbDART = loocv.stacked.modeler(preds = data.frame(prep.espn.ows.predictions$xgbDART,
                                                                                 prep.espn.dws.predictions$xgbDART),
                                                                   prep.espn.win.shares),
                                   stacked = loocv.stacked.modeler(preds = data.frame(prep.espn.ows.predictions$stacked,
                                                                                 prep.espn.dws.predictions$stacked),
                                                                   prep.espn.win.shares))
aau.espn.predictions = data.frame(pls = 
                                    loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$pls,
                                                                        aau.espn.dws.predictions$pls),
                                                          aau.espn.win.shares),
                                  lasso = 
                                    loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$lasso,
                                                                        aau.espn.dws.predictions$lasso),
                                                          aau.espn.win.shares),
                                  
                                  
                                  ridge = 
                                    loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$ridge,
                                                                             aau.espn.dws.predictions$ridge),
                                                          aau.espn.win.shares),
                                  
                                  rf = 
                                    loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$rf,
                                                                             aau.espn.dws.predictions$rf),
                                                          aau.espn.win.shares),
                                  earth = 
                                    loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$earth,
                                                                        aau.espn.dws.predictions$earth),
                                                          aau.espn.win.shares),
                                  svm.radial = 
                                    loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$svm.radial,
                                                                        aau.espn.dws.predictions$svm.radial),
                                                          aau.espn.win.shares),
                                  
                                  xgbDART = loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$xgbDART,
                                                                                aau.espn.dws.predictions$xgbDART),
                                                                  aau.espn.win.shares),
                                  stacked = loocv.stacked.modeler(preds = data.frame(aau.espn.ows.predictions$stacked,
                                                                                aau.espn.dws.predictions$stacked),
                                                                  aau.espn.win.shares))


aau.prep.predictions = data.frame(pls = 
                                    loocv.stacked.modeler(preds = data.frame(aau.prep.ows.predictions$pls,
                                                                             aau.prep.dws.predictions$pls),
                                                          aau.prep.win.shares),
                                  lasso = 
                                    loocv.stacked.modeler(preds = data.frame(aau.prep.ows.predictions$lasso,
                                                                             aau.prep.dws.predictions$lasso),
                                                          aau.prep.win.shares),
                                  
                                  
                                  ridge = 
                                    loocv.stacked.modeler(preds = data.frame(aau.prep.ows.predictions$ridge,
                                                                             aau.prep.dws.predictions$ridge),
                                                          aau.prep.win.shares),
                                  
                                  rf = 
                                    loocv.stacked.modeler(preds = data.frame(aau.prep.ows.predictions$rf,
                                                                             aau.prep.dws.predictions$rf),
                                                          aau.prep.win.shares),
                                  earth = 
                                    loocv.stacked.modeler(preds = data.frame(aau.prep.ows.predictions$earth,
                                                                             aau.prep.dws.predictions$earth),
                                                          aau.prep.win.shares),
                                  svm.radial = 
                                    loocv.stacked.modeler(preds = data.frame(aau.prep.ows.predictions$svm.radial,
                                                                             aau.prep.dws.predictions$svm.radial),
                                                          aau.prep.win.shares),
                                  
                                  xgbDART = loocv.stacked.modeler(preds = data.frame(aau.prep.ows.predictions$xgbDART,
                                                                                     aau.prep.dws.predictions$xgbDART),
                                                                  aau.prep.win.shares),
                                  stacked = loocv.stacked.modeler(preds = data.frame(aau.prep.ows.predictions$stacked,
                                                                                     aau.prep.dws.predictions$stacked),
                                                                  aau.prep.win.shares))




espn.errors = data.frame(pls = NA,
                         lasso = espn.win.shares - espn.predictions$lasso,
                         ridge = NA,
                         rf = NA,
                         earth = espn.win.shares - espn.predictions$earth,
                         svm.radial = espn.win.shares - espn.predictions$svm,
                         xgbDART = espn.win.shares - espn.predictions$xgbDART,
                         stacked = espn.win.shares - espn.predictions$stacked)

prep.errors = data.frame(pls = prep.win.shares - prep.predictions$pls,
                         lasso = prep.win.shares - prep.predictions$lasso,
                         ridge = prep.win.shares - prep.predictions$ridge,
                         rf = prep.win.shares - prep.predictions$rf,
                         earth = prep.win.shares - prep.predictions$earth,
                         svm.radial = prep.win.shares - prep.predictions$svm,
                         xgbDART = prep.win.shares - prep.predictions$xgbDART,
                         stacked = prep.win.shares - prep.predictions$stacked)


aau.errors = data.frame(pls = aau.win.shares - aau.predictions$pls,
                        lasso = aau.win.shares - aau.predictions$lasso,
                        ridge = aau.win.shares - aau.predictions$ridge,
                        rf = aau.win.shares - aau.predictions$rf,
                        earth = aau.win.shares - aau.predictions$earth,
                        svm.radial = aau.win.shares - aau.predictions$svm,
                        xgbDART = aau.win.shares - aau.predictions$xgbDART,
                        stacked = aau.win.shares - aau.predictions$stacked)

full.errors = data.frame(pls = full.win.shares - full.predictions$pls,
                         lasso = full.win.shares - full.predictions$lasso,
                         ridge = full.win.shares - full.predictions$ridge,
                         rf = full.win.shares - full.predictions$rf,
                         earth = full.win.shares - full.predictions$earth,
                         svm.radial = full.win.shares - full.predictions$svm,
                         xgbDART = full.win.shares - full.predictions$xgbDART,
                         stacked = full.win.shares - full.predictions$stacked)

aau.espn.errors = data.frame(pls = aau.espn.win.shares - aau.espn.predictions$pls,
                             lasso = aau.espn.win.shares - aau.espn.predictions$lasso,
                             ridge = aau.espn.win.shares - aau.espn.predictions$ridge,
                             rf = aau.espn.win.shares - aau.espn.predictions$rf,
                             earth = aau.espn.win.shares - aau.espn.predictions$earth,
                             svm.radial = aau.espn.win.shares - aau.espn.predictions$svm,
                             xgbDART = aau.espn.win.shares - aau.espn.predictions$xgbDART,
                             stacked = aau.espn.win.shares - aau.espn.predictions$stacked)

prep.espn.errors = data.frame(pls = prep.espn.win.shares - prep.espn.predictions$pls,
                              lasso = prep.espn.win.shares - prep.espn.predictions$lasso,
                              ridge = prep.espn.win.shares - prep.espn.predictions$ridge,
                              rf = prep.espn.win.shares - prep.espn.predictions$rf,
                              earth = prep.espn.win.shares - prep.espn.predictions$earth,
                              svm.radial = prep.espn.win.shares - prep.espn.predictions$svm,
                              xgbDART = prep.espn.win.shares - prep.espn.predictions$xgbDART,
                              stacked = prep.espn.win.shares - prep.espn.predictions$stacked)



aau.prep.errors = data.frame(pls = aau.prep.win.shares - aau.prep.predictions$pls,
                             lasso = aau.prep.win.shares - aau.prep.predictions$lasso,
                             ridge = aau.prep.win.shares - aau.prep.predictions$ridge,
                             rf = aau.prep.win.shares - aau.prep.predictions$rf,
                             earth = aau.prep.win.shares - aau.prep.predictions$earth,
                             svm.radial = aau.prep.win.shares - aau.prep.predictions$svm,
                             xgbDART = aau.prep.win.shares - aau.prep.predictions$xgbDART,
                             stacked = aau.prep.win.shares - aau.prep.predictions$stacked)





espn.rmse = data.frame(pls = NA, 
                       lasso = sqrt(mean((espn.errors$lasso)^2)),
                       ridge = NA,
                       rf = NA,
                       earth = sqrt(mean((espn.errors$earth)^2)),
                       svm.radial = sqrt(mean((espn.errors$svm.radial)^2)),
                       xgbDART = sqrt(mean((espn.errors$xgbDART)^2)),
                       stacked = sqrt(mean((espn.errors$stacked)^2)))

prep.rmse = data.frame(pls = sqrt(mean((prep.errors$pls)^2)), 
                       lasso = sqrt(mean((prep.errors$lasso)^2)),
                       ridge = sqrt(mean((prep.errors$ridge)^2)),
                       rf = sqrt(mean((prep.errors$rf)^2)),
                       earth = sqrt(mean((prep.errors$earth)^2)),
                       svm.radial = sqrt(mean((prep.errors$svm.radial)^2)),
                       xgbDART = sqrt(mean((prep.errors$xgbDART)^2)),
                       stacked = sqrt(mean((prep.errors$stacked)^2)))


aau.rmse = data.frame(pls = sqrt(mean((aau.errors$pls)^2)), 
                      lasso = sqrt(mean((aau.errors$lasso)^2)),
                      ridge = sqrt(mean((aau.errors$ridge)^2)),
                      rf = sqrt(mean((aau.errors$rf)^2)),
                      earth = sqrt(mean((aau.errors$earth)^2)),
                      svm.radial = sqrt(mean((aau.errors$svm.radial)^2)),
                      xgbDART = sqrt(mean((aau.errors$xgbDART)^2)),
                      stacked = sqrt(mean((aau.errors$stacked)^2)))


full.rmse = data.frame(pls = sqrt(mean((full.errors$pls)^2)), 
                       lasso = sqrt(mean((full.errors$lasso)^2)),
                       ridge = sqrt(mean((full.errors$ridge)^2)),
                       rf = sqrt(mean((full.errors$rf)^2)),
                       earth = sqrt(mean((full.errors$earth)^2)),
                       svm.radial = sqrt(mean((full.errors$svm.radial)^2)),
                       xgbDART = sqrt(mean((full.errors$xgbDART)^2)),
                       stacked = sqrt(mean((full.errors$stacked)^2)))



aau.espn.rmse = data.frame(pls = sqrt(mean((aau.espn.errors$pls)^2)), 
                           lasso = sqrt(mean((aau.espn.errors$lasso)^2)),
                           ridge = sqrt(mean((aau.espn.errors$ridge)^2)),
                           rf = sqrt(mean((aau.espn.errors$rf)^2)),
                           earth = sqrt(mean((aau.espn.errors$earth)^2)),
                           svm.radial = sqrt(mean((aau.espn.errors$svm.radial)^2)),
                           xgbDART = sqrt(mean((aau.espn.errors$xgbDART)^2)),
                           stacked = sqrt(mean((aau.espn.errors$stacked)^2)))


prep.espn.rmse = data.frame(pls = sqrt(mean((prep.espn.errors$pls)^2)), 
                            lasso = sqrt(mean((prep.espn.errors$lasso)^2)),
                            ridge = sqrt(mean((prep.espn.errors$ridge)^2)),
                            rf = sqrt(mean((prep.espn.errors$rf)^2)),
                            earth = sqrt(mean((prep.espn.errors$earth)^2)),
                            svm.radial = sqrt(mean((prep.espn.errors$svm.radial)^2)),
                            xgbDART = sqrt(mean((prep.espn.errors$xgbDART)^2)),
                            stacked = sqrt(mean((prep.espn.errors$stacked)^2)))


aau.prep.rmse = data.frame(pls = sqrt(mean((aau.prep.errors$pls)^2)), 
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

save.image("~/Honors Thesis/Model Environments/All Predictions regressed ows+dws.RData")


write.csv(final.rmse,
          file = '~/Honors Thesis/Predictions/All RMSEs (less vars more folds ows+dws regressed).csv')


