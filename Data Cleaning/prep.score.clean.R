
setwd("~/Honors Thesis/Raw Data")
library(readr)
library(plyr)
library(stringi)
library(stringr)

prep.min.15.16 <- read_csv("prep.ppg.15-16.csv")
prep.min.16.17 <- read_csv("prep.ppg.16-17.csv")
prep.min.17.18 <- read_csv("prep.ppg.17-18.csv")


ted = function(f){
  
  ff =   as.numeric(f)
  
  if(is.na(ff)){
    
    truth = T
  }
  
  else{
    
    truth = F
  }
  return(truth)
  
  
}

t = apply(prep.min.15.16, FUN = ted, MARGIN = 1)

start = prep.min.15.16[t,]


players = start[seq( 1, nrow(start), by = 2),]


for(i in 1:nrow(prep.min.15.16)){
  
  if(prep.min.15.16$x[i] %in% players$x){
    
    if(i == 1){
      
      
      
      begin = i
      end = i + 14
      test = prep.min.15.16[begin:end,]
      min.15 = as.data.frame(t(test))
      
    }
    
    
    
    if(i > 1){
      
      begin = i
      end = i + 14
      test = prep.min.15.16[begin:end,]
      best = as.data.frame(t(test))
      
      
      min.15 = rbind.fill(min.15, best)
      
    }
  }
  
}




min.15$Season = 2016

t = apply(prep.min.16.17, FUN = ted, MARGIN = 1)

start = prep.min.16.17[t,]


players = start[seq( 1, nrow(start), by = 2),]


for(i in 1:nrow(prep.min.16.17)){
  
  if(prep.min.16.17$x[i] %in% players$x){
    
    if(i == 1){
      
      
      
      begin = i
      end = i + 14
      test = prep.min.16.17[begin:end,]
      min.16 = as.data.frame(t(test))
      
    }
    
    
    
    if(i > 2){
      
      begin = i
      end = i + 14
      test = prep.min.16.17[begin:end,]
      best = as.data.frame(t(test))
      
      
      min.16 = rbind.fill(min.16, best)
      
    }
  }
  
}

View(min.16)

min.16$Season = 2017


t = apply(prep.min.17.18, FUN = ted, MARGIN = 1)

start = prep.min.17.18[t,]


players = start[seq( 1, nrow(start), by = 2),]


for(i in 1:nrow(prep.min.17.18)){
  
  if(prep.min.17.18$x[i] %in% players$x){
    
    if(i == 1){
      
      
      
      begin = i
      end = i + 14
      test = prep.min.17.18[begin:end,]
      min.17 = as.data.frame(t(test))
      
    }
    
    
    
    if(i > 1){
      
      begin = i
      end = i + 14
      test = prep.min.17.18[begin:end,]
      best = as.data.frame(t(test))
      
      
      min.17 = rbind.fill(min.17, best)
      
    }
  }
  
}

min.17$Season = 2018


minutes.data = rbind.fill(min.16, min.15, min.17)


lower.player <- str_to_lower(minutes.data$V1, locale = "en")

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

minutes.data$player.id = lower.player



write.csv(minutes.data, file = 'prep.score.csv', row.names =  F)