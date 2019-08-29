
setwd('~/Honors Thesis/Raw Data')

# t <- remDr$findElements(using = 'xpath', value = player.tag)
# 
# players1=list()
# players1=sapply(t, function(x){x$getElementText()})
# head(players1)


library(rvest)

#prep.circuit <- 'https://www.prepcircuit.com/stats/league_instance/58521?subseason=412391'

prep <- c("https://www.prepcircuit.com/stats/league_instance/34558?subseason=245525")

prep = c("https://www.prepcircuit.com/stats/league_instance/58521?subseason=412391")

library(RSelenium)
rD <- rsDriver(browser = 'firefox')
remDr <- rD[["client"]]

remDr$navigate(prep)



next.tag <- '.paginationElement:nth-child(1) a:nth-child(14)'




#table.tag = 'td:nth-child(8) , td:nth-child(5) , .statPlayer a'

table.tag = 'td'

t <- remDr$findElements(using = 'css selector', value = table.tag)

players1=c()
players1=sapply(t, function(x){x$getElementText()})
player.stats <- c(players1)

funcer = function(x){

  imp = x[1]

return(imp)
}

init.fixed.stats = sapply(player.stats, FUN = funcer)

init.fixed.stats = init.fixed.stats[which(init.fixed.stats != "")]
init.fixed.stats = as.data.frame(init.fixed.stats)

colnames(init.fixed.stats)[1] = 'x'

  

next.class  <- '.paginationElement:nth-child(1) .current+ a'


for(i in 1:77){
  
print(i*100/77)
  
  #Sys.sleep(time = 2)
  

score <- remDr$findElement(using = 'css selector', value = next.class)

score$clickElement()


Sys.sleep(time = 2)




t <- remDr$findElements(using = 'css selector', value = table.tag)

players1=c()
players1=sapply(t, function(x){x$getElementText()})

player.stats = c(players1)


fixed.stats = sapply(player.stats, FUN = funcer)


fixed.stats = fixed.stats[which(fixed.stats != "")]

fixed.stats = as.data.frame(fixed.stats)
colnames(fixed.stats)[1] = 'x'

init.fixed.stats = rbind(fixed.stats, init.fixed.stats)



}

write.csv(init.fixed.stats, file = 'prep.ppg.16-17.csv', row.names = F)