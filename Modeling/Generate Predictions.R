
source('~/Honors Thesis/Modeling/LOOCV Modeling Function.R')
loocv.modeler(model = 'earth',
                     data = full,
                     cbb.games = full.games,
                     cbb.win.shares =  full.win.shares)




loocv.modeler(model = 'lasso',
              data = prep,
              cbb.games = prep.games,
              cbb.win.shares =  prep.win.shares)



loocv.modeler(model = 'ridge',
              data = aau,
              cbb.games = aau.games,
              cbb.win.shares =  aau.win.shares)


loocv.modeler(model = 'ridge',
              data = espn,
              cbb.games = espn.games,
              cbb.win.shares =  espn.win.shares)