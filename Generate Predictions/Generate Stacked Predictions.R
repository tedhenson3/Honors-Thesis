

load("~/Honors Thesis/Predictions/All Predictions (espn.rating 80 filtered raw ws).RData")
source('~/Honors Thesis/Modeling/LOOCV Modeling Function (Stacked).R')


prep.pred.stacked  = loocv.stacked.modeler(preds = prep.predictions,
                                        ws = prep.win.shares)


aau.pred.stacked = loocv.stacked.modeler(preds = aau.predictions,
                                       ws = aau.win.shares)


espn.pred.stacked = loocv.stacked.modeler(preds = espn.predictions,
                                        ws = espn.win.shares)

full.pred.stacked = loocv.stacked.modeler(preds = full.predictions,
                                        ws = full.win.shares)


aau.espn.stacked = loocv.stacked.modeler(preds = aau.espn.predictions,
                                        ws = aau.espn.win.shares)

prep.espn.stacked = loocv.stacked.modeler(preds = prep.espn.predictions,
                                       ws = prep.espn.win.shares)

aau.prep.stacked = loocv.stacked.modeler(preds = aau.prep.predictions,
                                        ws = aau.prep.win.shares)

