library(brms)

brms.mod.aau = brm(ws.per.game ~ .,
                data = aau)

summary(brms.mod.aau)