


setwd('~/Honors Thesis/Clean Data')

library(readr)
library(tidyverse)
library(stringr)

aau.data.clean = read_csv(file = 'aau.data.clean.csv')

# aau.data.clean = aau.data.clean %>% dplyr::filter(Player != 'Total')
#
#
# lower.player <- str_to_lower(aau.data.clean$Player, locale = "en")
#
# lower.player <- str_replace(" jr.", "jr", lower.player)
# lower.player <- str_replace(" sr.", "sr", lower.player)
#
# lower.player <- str_replace(" iii", "iii", lower.player)
# lower.player <- str_replace(" ii", "ii", lower.player)
# lower.player <- str_replace(" iv", "iv", lower.player)
#
#
#
# lower.player <- gsub(".", "", lower.player, fixed = T)
#
# lower.player <- gsub(",iii", "iii", lower.player)
# lower.player <- gsub("'", "", lower.player, fixed  = T)
# lower.player = trimws(lower.player, which = c('both'))
#
# lower.player = gsub("\\s+", "-", lower.player)
#
# aau.data.clean$player.id = lower.player
#
# write.csv(aau.data.clean, 'aau.data.clean.csv', row.names = F)

aau.data.clean$player.id = gsub('-jr', 'jr', aau.data.clean$player.id)
aau.data.clean$player.id = gsub('-ii', 'ii', aau.data.clean$player.id)
aau.data.clean$player.id = gsub('-iii', 'iii', aau.data.clean$player.id)
aau.data.clean$player.id = gsub('-iv', 'iv', aau.data.clean$player.id)




aau.data.clean = aau.data.clean %>% dplyr::select(-c(Stat.Team,
                                                     Home.Team,
                                                     Away.Team,
                                                     Circuit))


aau.data.clean = aau.data.clean %>% 
  dplyr::group_by(player.id) %>% mutate(Season = max(Season))


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
)) + (3 * as.numeric(word(
  aau.data.clean$`3P`,
  start = 1,
  end = 1,
  sep = '-'
))) + aau.data.clean$twos * 2


aau.data.clean = aau.data.clean[-c(which(aau.data.clean$actual.pts == 159)), ]





season.avgs = aau.data.clean %>% group_by(player.id, Season) %>%
  summarise(
    mp.aau = mean(MP),
    reb.aau = mean(REB),
    blk.aau = mean(BLK),
    stl.aau = mean(STL),
    to.aau = mean(TO),
    pf.aau = mean(PF),
    given.pts.aau = mean(PTS),
    pts.aau = mean(actual.pts),
    max.pts.aau = max(actual.pts),
    ft.made.aau = mean(as.numeric(word(
      FT,
      start = 1,
      end = 1,
      sep = '-'
    ))),
    fg.made.aau  = mean(as.numeric(word(
      FG,
      start = 1,
      end = 1,
      sep = '-'
    ))),
    threep.made.aau  = mean(as.numeric(word(
      `3P`,
      start = 1,
      end = 1,
      sep = '-'
    )))
  )


season.totals = aau.data.clean %>% group_by(player.id, Season) %>%
  summarise(
    total.games.aau = n(),
    total.mp.aau = sum(MP),
    total.reb.aau = sum(REB),
    total.blk.aau = sum(BLK),
    total.stl.aau = sum(STL),
    total.to.aau = sum(TO),
    total.pf.aau = sum(PF),
    total.given.pts.aau = sum(PTS),
    total.pts.aau = sum(actual.pts),
    total.ft.made.aau = sum(as.numeric(word(
      FT,
      start = 1,
      end = 1,
      sep = '-'
    ))),
    total.fg.made.aau  = sum(as.numeric(word(
      FG,
      start = 1,
      end = 1,
      sep = '-'
    ))),
    total.threep.made.aau  = sum(as.numeric(word(
      `3P`,
      start = 1,
      end = 1,
      sep = '-'
    )))
  )

season.summary = inner_join(season.avgs, season.totals)

season.summary = season.summary %>% arrange(player.id)

season.summary = season.summary %>%
  group_by(player.id) %>%
  filter(row_number() == 1)



season.summary$Season = season.summary$Season + 2002

season.summary[is.na(season.summary)] <- 0

# season.summary.2 = season.summary %>% arrange(player.id, desc(Season), desc(pts.aau))
# season.summary.2 = season.summary.2 %>%
#   group_by(player.id, Season,
#            pts.aau) %>%
#   filter(row_number() == 1)

write.csv(season.summary, file = 'aau.career.summaries.csv', row.names = F)
