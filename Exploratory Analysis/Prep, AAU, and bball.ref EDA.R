

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
  ppg.actual.prep = c(PTS.prep / gp.max.prep),
  mpg.actual.prep = c(MIN.prep / gp.max.prep),
  blkg.actual.prep = c(BLK.prep / gp.max.prep),
  stlg.actual.prep = c(STL.prep / gp.max.prep),
  astg.actual.prep = c(AST.prep / gp.max.prep),
  tov.actual.prep = c(TO.prep / gp.max.prep),
  rebg.actual.prep = c(REB.prep / gp.max.prep),
  `3pmg.actual.prep` = c(`3PM.prep` / gp.max.prep),
  fgmg.actual.prep = c(FGM.prep / gp.max.prep),
  ftmg.actual.prep = c(FTM.prep / gp.max.prep),
  `3pm.actual.prep` = c(`3PM.prep` * `3P%.prep`),
  fgm.actual.prep = c(FGM.prep * fg.prep),
  ftm.actual.prep = c(FTM.prep * `FT%.prep`)
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


# ggplot(
#   train,
#   aes(
#     x = ppg.actual.prep,
#     y = aau.pts,
#    # colour = ows,
#     label = ows)) +
#   #geom_image(aes(image = image), size = .02) + 
#   theme_classic() + 
#   #geom_point() + 
#   geom_text(nudge_y = 2, size = 3.5) + 
#   ggtitle('AAU Points versus Prep Points (OWS Label)')


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

train = train %>% dplyr::filter(Season != 2014)


train = train %>% group_by(Season, group) %>% mutate(group.num = n())


# ggplot(boxplots, aes(y = ws, x = group)) + 
#   geom_boxplot(aes(group = group),
#                colour = 'skyblue') + 
#   theme_bw() + 
#   facet_grid(rows = vars(Season)) + ggtitle('WS by Amount of Data')


ggplot(train, aes(y = ws)) + 
  geom_violin(aes(x = group),
              colour = 'skyblue') + 
  theme_bw() + 
  facet_grid(rows = vars(Season)) + ggtitle('WS by Amount of Data')

group.freq = unique(train[, c('Season', 'group', 'group.num')])
colnames(group.freq) = c('Season', 'Partition', 'Freq')
group.freq = group.freq[order(-group.freq$Freq),]
group.freq


ggplot(train, aes(y = ows)) + 
  geom_violin(aes(x = group),
              colour = 'skyblue') + 
  theme_bw() + 
  facet_grid(rows = vars(Season)) + ggtitle('OWS by Amount of Data')
