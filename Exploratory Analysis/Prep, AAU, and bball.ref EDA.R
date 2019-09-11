

setwd('~/Honors Thesis/Clean Data')
library(readr)
library(tidyverse)
library(caret)
library(caretEnsemble)


# #note to self: do not forget to add in recreated per game prep stats
# # as given stats are inaccurate
# # predict offense and defense seperate


data = read_csv('espn.bball-ref.aau.prep.csv')

data = data %>% dplyr::filter(!is.na(ws))


data = data %>% mutate(
  prep.ppg.actual = I(PTS / gp.max),
  prep.mpg.actual = I(MIN / gp.max),
  prep.blkg.actual = I(BLK / gp.max),
  prep.stlg.actual = I(STL / gp.max),
  prep.astg.actual = I(AST / gp.max),
  prep.tov.actual = I(TO / gp.max),
  prep.rebg.actual = I(REB / gp.max),
  prep.3pmg.actual = I(`3PM` / gp.max),
  prep.fgmg.actual = I(FGM / gp.max),
  prep.ftmg.actual = I(FTM / gp.max),
  prep.3pm.actual = I(`3PM` * `3P%`),
  prep.fgm.actual = I(FGM * fg.prep),
  prep.ftm.actual = I(FTM * `FT%`)
)



train_ind <-
  createDataPartition(y = data$ws,
                      p = .8,
                      list = F)

train <- data[train_ind,]


library(ggimage)
train$image = c("http://images.clipartpanda.com/ball-20clip-20art-basketball_clipart_1.png")

#train$ws.character = as.character(train$ws)

# ggplot(
#   train,
#   aes(
#     x = ppg.prep,
#     y = aau.pts,
#     label = ws)) +
#   geom_image(aes(image = image), size = .02) + theme_classic() + 
#   geom_text(nudge_y = 2) + ggtitle('AAU Points versus Prep Points (WS Label)')


ggplot(
  train,
  aes(
    x = ppg.prep,
    y = aau.pts,
   # colour = ows,
    label = ows)) +
  #geom_image(aes(image = image), size = .02) + 
  theme_classic() + 
  #geom_point() + 
  geom_text(nudge_y = 2, size = 3.5) + 
  ggtitle('AAU Points versus Prep Points (OWS Label)')


train$group <- ifelse(is.na(train$ppg.prep) & !is.na(train$aau.given.pts),
                      'Only AAU', NA)


train$group <- ifelse(!is.na(train$ppg.prep) & is.na(train$aau.given.pts),
                      'Only Prep',
                      train$group)


train$group <- ifelse(!is.na(train$ppg.prep) & !is.na(train$aau.given.pts),
                      'Prep and AAU',
                      train$group)


train$group <- ifelse(is.na(train$group),
                      'Neither',
                      train$group)

boxplots = train %>% dplyr::filter(Season != 2014)

ggplot(boxplots, aes(y = ws, x = group)) + 
  geom_boxplot(aes(group = group),
               colour = 'skyblue') + 
  theme_bw() + 
  facet_grid(rows = vars(Season)) + ggtitle('WS by Amount of Data')


ggplot(boxplots, aes(y = ws)) + 
  geom_violin(aes(x = group),
              colour = 'skyblue') + 
  theme_bw() + 
  facet_grid(rows = vars(Season)) + ggtitle('WS by Amount of Data')


ggplot(boxplots, aes(y = ows)) + 
  geom_violin(aes(x = group),
              colour = 'skyblue') + 
  theme_bw() + 
  facet_grid(rows = vars(Season)) + ggtitle('OWS by Amount of Data')

ggplot(boxplots, aes(y = dws)) + 
  geom_violin(aes(x = group),
              colour = 'skyblue') + 
  theme_bw() + 
  facet_grid(rows = vars(Season)) + ggtitle('DWS by Amount of Data')

# train = train %>% dplyr::select(-player.id,-Season,-TEAM,-Name)
# 
# 
# correlation.matrix = cor(train)
# 
# test <- data[-train_ind,]
