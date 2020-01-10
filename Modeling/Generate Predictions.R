

source('~/Honors Thesis/Data Cleaning/Prepping Data for Modeling.R')
source('~/Honors Thesis/Modeling/LOOCV Modeling Function.R')


prep.pred.lm = loocv.modeler(model = 'nnet',
              data = prep,
              cbb.games = prep.games,
              cbb.win.shares =  prep.win.shares)

prep.pred.lm

aau.pred.lm = loocv.modeler(model = 'rf',
              data = aau,
              cbb.games = aau.games,
              cbb.win.shares =  aau.win.shares)


espn.pred.lm = loocv.modeler(model = 'rf',
              data = espn,
              cbb.games = espn.games,
              cbb.win.shares =  espn.win.shares)

full.pred.lm = loocv.modeler(model = 'rf',
                             data = full,
                             cbb.games = full.games,
                             cbb.win.shares =  full.win.shares)


