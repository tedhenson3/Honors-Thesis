

setwd('~/Honors Thesis/Clean Data')

library(readr)
library(tidyverse)

aau.data.clean = read_csv(file = 'aau.data.clean.csv')

aau.data.clean = aau.data.clean %>% dplyr::filter(Player != 'Total')


aau.data.clean = aau.data.clean %>% dplyr::select(-c(Stat.Team,
                                                     Home.Team,
                                                     Away.Team,
                                                     Circuit))

aau.data.clean$twos = as.numeric(word(
  aau.data.clean$FG,
  start = 1,
  end = 1,
  sep = '-'
)) - as.numeric(word(
  aau.data.clean$`3P`,
  start = 1,
  end = 1,
  sep = '-'
))

aau.data.clean$actual.pts = as.numeric(word(
  aau.data.clean$FT,
  start = 1,
  end = 1,
  sep = '-'
)) + (3*as.numeric(word(
  aau.data.clean$`3P`,
  start = 1,
  end = 1,
  sep = '-'
))) + aau.data.clean$twos * 2
  
  
  
  
  season.avgs = aau.data.clean %>% group_by(Player, Season) %>%
  summarise(
    aau.mp = mean(MP),
    aau.reb = mean(REB),
    aau.blk  = mean(BLK),
    aau.stl  = mean(STL),
    aau.to = mean(TO),
    aau.pf = mean(PF),
    aau.given.pts = mean(PTS),
    aau.pts = mean(actual.pts),
    aau.max.pts = max(actual.pts),
    aau.ft.made  = mean(as.numeric(word(
      FT,
      start = 1,
      end = 1,
      sep = '-'
    ))),
    aau.fg.made  = mean(as.numeric(word(
      FG,
      start = 1,
      end = 1,
      sep = '-'
    ))),
    aau.threep.made  = mean(as.numeric(word(
      `3P`,
      start = 1,
      end = 1,
      sep = '-'
    )))
  )


season.totals = aau.data.clean %>% group_by(Player, Season) %>%
  summarise(
    aau.sum.mp = sum(MP),
    aau.sum.reb = sum(REB),
    aau.sum.blk  = sum(BLK),
    aau.sum.stl  = sum(STL),
    aau.sum.to = sum(TO),
    aau.sum.pf = sum(PF),
    aau.sum.given.pts = sum(PTS),
    aau.sum.pts = sum(actual.pts),
    aau.sum.ft.made  = sum(as.numeric(word(
      FT,
      start = 1,
      end = 1,
      sep = '-'
    ))),
    aau.sum.fg.made  = sum(as.numeric(word(
      FG,
      start = 1,
      end = 1,
      sep = '-'
    ))),
    aau.sum.threep.made  = sum(as.numeric(word(
      `3P`,
      start = 1,
      end = 1,
      sep = '-'
    )))
  )

season.summary = inner_join(season.avgs, season.totals)

season.summary = season.summary %>% arrange(Player, desc(Season))

season.summary = season.summary %>%
  group_by(Player) %>%
  filter(row_number() == 1)



lower.player <- str_to_lower(season.summary$Player, locale = "en")

lower.player <- str_replace(" jr.", "jr", lower.player)
lower.player <- str_replace(" sr.", "sr", lower.player)

lower.player <- str_replace(" iii", "iii", lower.player)
lower.player <- str_replace(" ii", "ii", lower.player)
lower.player <- str_replace(" iv", "iv", lower.player)



lower.player <- gsub(".", "", lower.player, fixed = T)

lower.player <- gsub(",iii", "iii", lower.player)
lower.player <- gsub("'", "", lower.player, fixed  = T)
lower.player = trimws(lower.player, which = c('both'))

lower.player = gsub("\\s+", "-", lower.player)

season.summary$player.id = lower.player


season.summary$player.id = gsub('-jr', 'jr', season.summary$player.id)
season.summary$player.id = gsub('-ii', 'ii', season.summary$player.id)
season.summary$player.id = gsub('-iii', 'iii', season.summary$player.id)
season.summary$player.id = gsub('-iv', 'iv', season.summary$player.id)

season.summary$Season = season.summary$Season + 2002

write.csv(season.summary, file = 'aau.season.summaries.csv', row.names = F)
