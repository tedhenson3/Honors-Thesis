

load("~/Honors Thesis/Model Environments/All Predictions (complete players dws).RData")

espn.predictions = espn.ows.predictions + espn.dws.predictions
prep.predictions = prep.ows.predictions + prep.dws.predictions
aau.predictions = aau.ows.predictions + aau.dws.predictions
full.predictions = full.ows.predictions + full.dws.predictions
aau.espn.predictions = aau.espn.ows.predictions + aau.espn.dws.predictions
prep.espn.predictions = prep.espn.ows.predictions + prep.espn.dws.predictions
aau.prep.predictions = aau.prep.ows.predictions + aau.prep.dws.predictions




espn.errors = data.frame(lm = espn.win.shares - espn.predictions$lm,
                         lasso = espn.win.shares - espn.predictions$lasso,
                         ridge = espn.win.shares - espn.predictions$ridge,
                         rf = espn.win.shares - espn.predictions$rf,
                         earth = espn.win.shares - espn.predictions$earth,
                         svm.radial = espn.win.shares - espn.predictions$svm,
                         xgbDART = espn.win.shares - espn.predictions$xgbDART,
                         stacked = espn.win.shares - espn.predictions$stacked)

prep.errors = data.frame(lm = prep.win.shares - prep.predictions$lm,
                         lasso = prep.win.shares - prep.predictions$lasso,
                         ridge = prep.win.shares - prep.predictions$ridge,
                         rf = prep.win.shares - prep.predictions$rf,
                         earth = prep.win.shares - prep.predictions$earth,
                         svm.radial = prep.win.shares - prep.predictions$svm,
                         xgbDART = prep.win.shares - prep.predictions$xgbDART,
                         stacked = prep.win.shares - prep.predictions$stacked)


aau.errors = data.frame(lm = aau.win.shares - aau.predictions$lm,
                        lasso = aau.win.shares - aau.predictions$lasso,
                        ridge = aau.win.shares - aau.predictions$ridge,
                        rf = aau.win.shares - aau.predictions$rf,
                        earth = aau.win.shares - aau.predictions$earth,
                        svm.radial = aau.win.shares - aau.predictions$svm,
                        xgbDART = aau.win.shares - aau.predictions$xgbDART,
                        stacked = aau.win.shares - aau.predictions$stacked)

full.errors = data.frame(lm = full.win.shares - full.predictions$lm,
                         lasso = full.win.shares - full.predictions$lasso,
                         ridge = full.win.shares - full.predictions$ridge,
                         rf = full.win.shares - full.predictions$rf,
                         earth = full.win.shares - full.predictions$earth,
                         svm.radial = full.win.shares - full.predictions$svm,
                         xgbDART = full.win.shares - full.predictions$xgbDART,
                         stacked = full.win.shares - full.predictions$stacked)

aau.espn.errors = data.frame(lm = aau.espn.win.shares - aau.espn.predictions$lm,
                             lasso = aau.espn.win.shares - aau.espn.predictions$lasso,
                             ridge = aau.espn.win.shares - aau.espn.predictions$ridge,
                             rf = aau.espn.win.shares - aau.espn.predictions$rf,
                             earth = aau.espn.win.shares - aau.espn.predictions$earth,
                             svm.radial = aau.espn.win.shares - aau.espn.predictions$svm,
                             xgbDART = aau.espn.win.shares - aau.espn.predictions$xgbDART,
                             stacked = aau.espn.win.shares - aau.espn.predictions$stacked)

prep.espn.errors = data.frame(lm = prep.espn.win.shares - prep.espn.predictions$lm,
                              lasso = prep.espn.win.shares - prep.espn.predictions$lasso,
                              ridge = prep.espn.win.shares - prep.espn.predictions$ridge,
                              rf = prep.espn.win.shares - prep.espn.predictions$rf,
                              earth = prep.espn.win.shares - prep.espn.predictions$earth,
                              svm.radial = prep.espn.win.shares - prep.espn.predictions$svm,
                              xgbDART = prep.espn.win.shares - prep.espn.predictions$xgbDART,
                              stacked = prep.espn.win.shares - prep.espn.predictions$stacked)



aau.prep.errors = data.frame(lm = aau.prep.win.shares - aau.prep.predictions$lm,
                             lasso = aau.prep.win.shares - aau.prep.predictions$lasso,
                             ridge = aau.prep.win.shares - aau.prep.predictions$ridge,
                             rf = aau.prep.win.shares - aau.prep.predictions$rf,
                             earth = aau.prep.win.shares - aau.prep.predictions$earth,
                             svm.radial = aau.prep.win.shares - aau.prep.predictions$svm,
                             xgbDART = aau.prep.win.shares - aau.prep.predictions$xgbDART,
                             stacked = aau.prep.win.shares - aau.prep.predictions$stacked)





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

write.csv(final.rmse,
          file = '~/Honors Thesis/Predictions/All RMSEs (complete players ows+dws 2).csv')


