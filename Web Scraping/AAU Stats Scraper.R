
setwd("~/Honors Thesis/Raw Data")
library(rvest)

#aau.circuit <- 'https://www.aaucircuit.com/stats/league_instance/58521?subseason=412391'


aau = c("http://aaustats.com/seasons/50")

library(RSelenium)
rD <- rsDriver(browser = 'firefox')
remDr <- rD[["client"]]

remDr$navigate(aau)


# away.team.stats.data.frame = data.frame(stats = c(0), Team = c(0))
# home.team.stats.data.frame = data.frame(stats = c(0), Team = c(0))

i = 1
aau.stats = data.frame()

#set manually to number of games in season
while(i <= 235){
  
  print(i / 235 * 100)



game.tag <- paste('tr:nth-child(', i, ') .pure-button', sep = '')




  Sys.sleep(time = 2)
  
  
  game.select <- remDr$findElement(using = 'css selector', value = game.tag)
  
  game.select$clickElement()
  
  
  Sys.sleep(time = 2)
  
  
  table.tag = 'td'
  
  table.grab <- remDr$findElements(using = 'css selector', value = table.tag)
  
  players1=c()
  players1=sapply(table.grab, function(x){x$getElementText()})
  
  player.stats = c(players1)
  
  funcer = function(x){
    
    imp = x[1]
    
    return(imp)
  }
  
  stats.list = sapply(player.stats, FUN = funcer)
  
  stats.list = stats.list[which(stats.list != "")]
  stats.list = as.data.frame(stats.list)
  
  colnames(stats.list)[1] = 'x'
  
  totals = which(stats.list == 'Total')
  
  

  home.team.stats = stats.list[c(1):c(totals[1]+11), 'x']
  
  home.team.stats = as.vector(home.team.stats)
  
  away.team.stats = stats.list[c(totals[1]+12):nrow(stats.list), 'x']
  
  away.team.stats = as.vector(away.team.stats)
  
  
  home.team.tag = 'ul+ h2'
  
  
  
  home.team.grab <- remDr$findElements(using = 'css selector', value = home.team.tag)
  
  home.team.name=c()
  home.team.name=sapply(home.team.grab, function(x){x$getElementText()})
  
  home.team.name = home.team.name[[1]][1]
  
  

  
  away.team.tag = '.min-table+ h2'
  
  
  
  away.team.grab <- remDr$findElements(using = 'css selector', value = away.team.tag)
  
  away.team.name=c()
  away.team.name=sapply(away.team.grab, function(x){x$getElementText()})

  away.team.name = away.team.name[[1]][1]
  
  away.team.stats.data.frame = data.frame(Stats = away.team.stats, 
                                          Stat.Team = away.team.name,
                                          Home.Team = home.team.name,
                                          Away.Team = away.team.name,
                                          Season = 19)
  
  home.team.stats.data.frame = data.frame(Stats = home.team.stats, 
                                          Stat.Team = home.team.name,
                                          Home.Team = home.team.name,
                                          Away.Team = away.team.name,
                                          Season = 19)

  aau.stats = rbind(aau.stats, home.team.stats.data.frame, away.team.stats.data.frame)

  back.button = '.back-button'
  
  
  
  
  back.select <- remDr$findElement(using = 'css selector', value = back.button)
  
  back.select$clickElement()
  i = i + 1
}
  

write.csv(aau.stats, file = 'aau.stats.under.armour.19.csv', row.names = F)