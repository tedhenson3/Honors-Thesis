

source('~/Honors Thesis/Data Cleaning/Prepping Data for Modeling.R')
source('~/Honors Thesis/Modeling/LOOCV Modeling Function.R')



prep.pred.lm = loocv.modeler(model = 'lm',
                                  data = prep)


aau.pred.lm = loocv.modeler(model = 'lm',
                                 data = aau)


espn.pred.lm = loocv.modeler(model = 'lm',
                                  data = espn)

full.pred.lm = loocv.modeler(model = 'lm',
                                  data = full)

aau.espn.pred.lm = loocv.modeler(model = 'lm',
                                  data = aau.espn)

prep.espn.pred.lm = loocv.modeler(model = 'lm',
                                  data = prep.espn)


aau.prep.pred.lm = loocv.modeler(model = 'lm',
                                       data = aau.prep)

espn.predictions = data.frame(
  lm = espn.pred.lm)

prep.predictions = data.frame(
                              lm = prep.pred.lm)

aau.predictions = data.frame(
                             lm = aau.pred.lm)

full.predictions = data.frame(
                              lm = full.pred.lm
)


aau.espn.predictions = data.frame(
                                  lm = aau.espn.pred.lm
)

prep.espn.predictions = data.frame(
                                   lm = prep.espn.pred.lm
)


aau.prep.predictions = data.frame(
                                  lm = aau.prep.pred.lm
)


espn.errors = data.frame(
                         lm = espn.win.shares - espn.pred.lm)

prep.errors = data.frame(
                         lm = prep.win.shares - prep.pred.lm)


aau.errors = data.frame(
                        lm = aau.win.shares - aau.pred.lm)

full.errors = data.frame(
                         lm = full.win.shares - full.pred.lm)

aau.espn.errors = data.frame(
                             lm = aau.espn.win.shares - aau.espn.pred.lm)

prep.espn.errors = data.frame(
                              lm = prep.espn.win.shares - prep.espn.pred.lm)



aau.prep.errors = data.frame(
                             lm = aau.prep.win.shares - aau.prep.pred.lm)




espn.rmse = data.frame(
                       lm = sqrt(mean((espn.errors$lm)^2)))

prep.rmse = data.frame(
                       lm = sqrt(mean((prep.errors$lm)^2)))


aau.rmse = data.frame(
                      lm = sqrt(mean((aau.errors$lm)^2)))


full.rmse = data.frame(
                       lm = sqrt(mean((full.errors$lm)^2)))



aau.espn.rmse = data.frame(
                           lm = sqrt(mean((aau.espn.errors$lm)^2)))


prep.espn.rmse = data.frame(
                            lm = sqrt(mean((prep.espn.errors$lm)^2)))


aau.prep.rmse = data.frame(
                           lm = sqrt(mean((aau.prep.errors$lm)^2)))


full.r2=  data.frame(
                     lm = cor(x = full.win.shares, y =full.predictions$lm)^2)

espn.r2=  data.frame(lm = cor(x = full.win.shares, y =espn.predictions$lm)^2)


prep.r2=  data.frame(lm = cor(x = prep.win.shares, y =prep.predictions$lm)^2)


aau.r2=  data.frame( lm = cor(x = aau.win.shares, y =aau.predictions$lm)^2)



aau.espn.r2=  data.frame(lm = cor(x = aau.espn.win.shares, 
                                       y =aau.espn.predictions$lm)^2)


prep.espn.r2=  data.frame(lm = cor(x = prep.espn.win.shares, y =prep.espn.predictions$lm)^2)


aau.prep.r2=  data.frame(lm = cor(x = aau.prep.win.shares, y =aau.prep.predictions$lm)^2)






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



r2.col.names = paste(colnames(final.r2),' ',
                     'n=',n.vec, sep = '')

colnames(final.r2) = r2.col.names
final.r2


write.csv(final.r2,
          file = '~/Honors Thesis/Predictions/All R2 (linear).csv')

save.image("~/Honors Thesis/Model Environments/All Predictions (raw ws linear).RData")
# 
# write.csv(final.rmse,
#           file = '~/Honors Thesis/Predictions/All RMSEs (raw ws 5 folds lm).csv')
# 
# 
