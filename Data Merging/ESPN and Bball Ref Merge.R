#ESPN to bball.ref merge#

library(readr)
setwd("~/Honors Thesis/Raw Data")
bball.ref.15 <- read_csv("bball.ref.data.15.csv")

bball.ref.16 <- read_csv("bball.ref.data.16.csv")

bball.ref.17 <- read_csv("bball.ref.data.17.csv")

bball.2018 = read_csv(file = 'bball.ref.18(updated).csv')


library(plyr)
bball.ref.total  = rbind.fill(bball.ref.15, bball.ref.16, bball.ref.17, bball.2018)

espn.15 <- read_csv("successfull.scrapes.15.csv")

espn.16 <- read_csv("successfull.scrapes.16.csv")

colnames(espn.16) = colnames(espn.15)



espn.17 <- read_csv("successfull.scrapes.17.csv")


espn.18 = read_csv("espn.success.2018(updated).csv")

colnames(espn.18) = colnames(espn.15)



colnames(espn.17) = colnames(espn.15)

espn.18[,2] = espn.18$Name_1
# colnames(espn.18)[2] = 'holder'
# colnames(espn.18)[2] = 'School'
# 
# colnames(espn.18)[12] = 'Name'

# espn.18 = espn.18 %>% dplyr::select(National.Ranking, Name, everything())



espn.total  = rbind.fill(espn.15, espn.16, espn.17, espn.18)

id.fix = function(sexton){
  
  

player.id = strsplit(sexton, ".html")

player.id = strsplit(player.id[[1]][1], '/', fixed = T)

player= player.id[[1]][6]
return(player)

}

espn.total$player.id = sapply(espn.total$link, FUN = id.fix)

bball.ref.total$player.id = sapply(bball.ref.total$link, FUN = id.fix)


library(tidyverse)
espn.total = espn.total %>% dplyr::select(-Name)


total.data = left_join(bball.ref.total, espn.total, by = 'player.id')


#total.data = total.data[sort(total.data$Rating, decreasing = F),]

total.data = total.data %>% dplyr::arrange(desc(Rating))

total.data = total.data %>% dplyr::select(Name, Rating, ws, ws.conf, ws_per_40, ws_per_40.conf,
                                   everything())

setwd("~/Honors Thesis/Clean Data")

write.csv(total.data, file = 'recruit.college.15-18(updated).csv', row.names = F)


# preview = total.data[1:30,]
# 
# View(preview)



length(unique(total.data$Name.x))

length(unique(espn.total$Name))

setwd("~/Honors Thesis/Raw Data")


all.espn.15 <- read_csv("espn.top.state.2015.csv")

all.espn.16 <- read_csv("espn.top.state.2016.csv")

colnames(all.espn.16) = colnames(all.espn.15)



all.espn.17 <- read_csv("espn.top.state.2017.csv")


colnames(all.espn.17) = colnames(all.espn.15)
all.espn.total  = rbind.fill(all.espn.15, all.espn.16, all.espn.17)

all.espn.total = all.espn.total %>% dplyr::filter(School != 'unknown')
length(unique(all.espn.total$Name))

total.conversion = length(unique(total.data$Name.x)) /  length(unique(all.espn.total$Name))

total.conversion