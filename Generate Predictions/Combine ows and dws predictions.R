

load("~/Honors Thesis/Model Environments/All Predictions (complete players dws).RData")

espn.predictions = espn.ows.predictions + espn.dws.predictions
prep.predictions = prep.ows.predictions + prep.dws.predictions
aau.predictions = aau.ows.predictions + aau.dws.predictions
full.predictions = full.ows.predictions + full.dws.predictions
aau.espn.predictions = aau.espn.ows.predictions + aau.espn.dws.predictions
prep.espn.predictions = prep.espn.ows.predictions + prep.espn.dws.predictions
aau.prep.predictions = aau.prep.ows.predictions + aau.prep.dws.predictions



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


full.r2=  data.frame(pls = cor(x = full.win.shares, y =full.predictions$pls)^2, 
                     lasso = cor(x = full.win.shares, y =full.predictions$lasso)^2,
                     ridge = cor(x = full.win.shares, y =full.predictions$ridge)^2,
                     rf = cor(x = full.win.shares, y =full.predictions$rf)^2,
                     earth = cor(x = full.win.shares, y =full.predictions$earth)^2,
                     svm.radial = cor(x = full.win.shares, y =full.predictions$svm.radial)^2,
                     xgbDART = cor(x = full.win.shares, y =full.predictions$xgbDART)^2,
                     stacked = cor(x = full.win.shares, y =full.predictions$stacked)^2)

espn.r2=  data.frame(pls = cor(x = espn.win.shares, y =espn.predictions$pls)^2, 
                     lasso = cor(x = espn.win.shares, y =espn.predictions$lasso)^2,
                     ridge = cor(x = espn.win.shares, y =espn.predictions$ridge)^2,
                     rf = cor(x = espn.win.shares, y =espn.predictions$rf)^2,
                     earth = cor(x = espn.win.shares, y =espn.predictions$earth)^2,
                     svm.radial = cor(x = espn.win.shares, y =espn.predictions$svm.radial)^2,
                     xgbDART = cor(x = espn.win.shares, y =espn.predictions$xgbDART)^2,
                     stacked = cor(x = espn.win.shares, y =espn.predictions$stacked)^2)


prep.r2=  data.frame(pls = cor(x = prep.win.shares,y = prep.predictions$pls)^2, 
                     lasso = cor(x = prep.win.shares, y =prep.predictions$lasso)^2,
                     ridge = cor(x = prep.win.shares, y =prep.predictions$ridge)^2,
                     rf = cor(x = prep.win.shares, y =prep.predictions$rf)^2,
                     earth = cor(x = prep.win.shares, y =prep.predictions$earth)^2,
                     svm.radial = cor(x = prep.win.shares, y =prep.predictions$svm.radial)^2,
                     xgbDART = cor(x = prep.win.shares, y =prep.predictions$xgbDART)^2,
                     stacked = cor(x = prep.win.shares, y =prep.predictions$stacked)^2)


aau.r2=  data.frame(pls = cor(x = aau.win.shares, y =aau.predictions$pls)^2, 
                    lasso = cor(x = aau.win.shares, y =aau.predictions$lasso)^2,
                    ridge = cor(x = aau.win.shares, y =aau.predictions$ridge)^2,
                    rf = cor(x = aau.win.shares, y =aau.predictions$rf)^2,
                    earth = cor(x = aau.win.shares, y =aau.predictions$earth)^2,
                    svm.radial = cor(x = aau.win.shares, y =aau.predictions$svm.radial)^2,
                    xgbDART = cor(x = aau.win.shares, y =aau.predictions$xgbDART)^2,
                    stacked = cor(x = aau.win.shares, y =aau.predictions$stacked)^2)



aau.espn.r2=  data.frame(pls = cor(x = aau.espn.win.shares, y =aau.espn.predictions$pls)^2, 
                         lasso = cor(x = aau.espn.win.shares, y =aau.espn.predictions$lasso)^2,
                         ridge = cor(x = aau.espn.win.shares, y =aau.espn.predictions$ridge)^2,
                         rf = cor(x = aau.espn.win.shares, y =aau.espn.predictions$rf)^2,
                         earth = cor(x = aau.espn.win.shares, y =aau.espn.predictions$earth)^2,
                         svm.radial = cor(x = aau.espn.win.shares, y =aau.espn.predictions$svm.radial)^2,
                         xgbDART = cor(x = aau.espn.win.shares, y =aau.espn.predictions$xgbDART)^2,
                         stacked = cor(x = aau.espn.win.shares, y =aau.espn.predictions$stacked)^2)


prep.espn.r2=  data.frame(pls = cor(x = prep.espn.win.shares, y =prep.espn.predictions$pls)^2, 
                          lasso = cor(x = prep.espn.win.shares, y =prep.espn.predictions$lasso)^2,
                          ridge = cor(x = prep.espn.win.shares, y =prep.espn.predictions$ridge)^2,
                          rf = cor(x = prep.espn.win.shares, y =prep.espn.predictions$rf)^2,
                          earth = cor(x = prep.espn.win.shares, y =prep.espn.predictions$earth)^2,
                          svm.radial = cor(x = prep.espn.win.shares, y =prep.espn.predictions$svm.radial)^2,
                          xgbDART = cor(x = prep.espn.win.shares, y =prep.espn.predictions$xgbDART)^2,
                          stacked = cor(x = prep.espn.win.shares, y =prep.espn.predictions$stacked)^2)


aau.prep.r2=  data.frame(pls = cor(x = aau.prep.win.shares, y =aau.prep.predictions$pls)^2, 
                         lasso = cor(x = aau.prep.win.shares, y =aau.prep.predictions$lasso)^2,
                         ridge = cor(x = aau.prep.win.shares, y =aau.prep.predictions$ridge)^2,
                         rf = cor(x = aau.prep.win.shares, y =aau.prep.predictions$rf)^2,
                         earth = cor(x = aau.prep.win.shares, y =aau.prep.predictions$earth)^2,
                         svm.radial = cor(x = aau.prep.win.shares, y =aau.prep.predictions$svm.radial)^2,
                         xgbDART = cor(x = aau.prep.win.shares, y =aau.prep.predictions$xgbDART)^2,
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
          file = '~/Honors Thesis/Predictions/All R2 (ows + dws 5 folds).csv')

write.csv(final.rmse,
          file = '~/Honors Thesis/Predictions/All RMSEs (ows + dws).csv')


