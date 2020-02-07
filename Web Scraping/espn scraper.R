#espn <- c('http://www.espn.com/college-sports/basketball/recruiting/playerrankings/_/class/2017/order/true')
setwd('~/Honors Thesis/Raw Data')


# css_tags <- 'td'
# rankings_2018 = espn %>%
#   read_html() %>%
#   html_nodes(css=css_tags) %>% html_text()

#View(rankings_2018)

my.states <- tolower(state.name)

my.states <- gsub(" ", "-", my.states, fixed = T)

library(rvest)
library(tidyverse)

library(tidyverse)
library(rvest)

r <- 1
while(r <  length(my.states)){

  state <- my.states[r]
  
espn <- paste('http://www.espn.com/college-sports/basketball/recruiting/playerrankings/_/class/2019/view/state/order/true/state/', 
              state, sep = "")
  
css_tags.2 = 'td:nth-child(1) , .colhead td , .school-name , td:nth-child(8) , td:nth-child(6) , td:nth-child(5) , b , td:nth-child(4) , strong'
rankings_2018 = espn %>%
  read_html() %>%
  html_nodes(css=css_tags.2) %>% html_text()
#View(rankings_2018)

print(state)
print(r / 50 * 100)
if(length(rankings_2018) < 18 | length(rankings_2018) == 0){
  

}

else{
  
  
  
 


rankings_2018 <- rankings_2018[10:length(rankings_2018)]

# 
# my.names = as.numeric(rankings_2018)
# 
# my.starts = which(!is.na(my.names))
# 
# 
# indices <- seq(from = 1, to = length(my.starts), by = 4)

indices <- seq(from = 1, to = length(rankings_2018), by = 8)


clean.data <- data.frame(matrix(ncol = 8, nrow = 0))

colnames(clean.data) <- c("National.Ranking", "Name", "Position",
                          "Hometown.High.School", "Height",
                          "Weight", "Rating", "School")


for(i in 1:c(length(indices)-1)){
  
  start <- indices[i]
  

  
  end <- indices[i+1] - 1
  

    
  
  row <- rankings_2018[start:end]
  
  if(!is.na(as.numeric(row[[8]]))){
    
    row[8] <- 'unknown'
    indices[i+1:c(length(indices)-1)] <- indices[i+1:c(length(indices)-1)] - 1
  }

  
  
  
  
  clean.data[i,] <- row
  


}

espn.data <- clean.data

library(stringr)
espn.data$School <- str_trim(espn.data$School)

for(i in 1:length(espn.data$Name)){
  
lower.player <- tolower(espn.data[i, 'Name'])

lower.player <- gsub(" jr.", "jr", lower.player, fixed = T)
lower.player <- gsub(" sr.", "sr", lower.player, fixed = T)

lower.player <- gsub(" iii", "iii", lower.player, fixed = T)
lower.player <- gsub(" ii", "ii", lower.player, fixed = T)
lower.player <- gsub(" iv", "iv", lower.player, fixed = T)



lower.player <- gsub(".", "", lower.player, fixed = T)

lower.player <- gsub(",iii", "iii", lower.player, fixed = T)
lower.player <- gsub("'", "", lower.player, fixed = T)


first.last <- strsplit(lower.player, ' ')

#print(first.last)

player.id <- paste(first.last[[1]][1:length(first.last[[1]])], collapse = "-")

espn.data[i, 'player.id'] <- player.id
}

espn.data$bball.ref.link = paste("https://www.sports-reference.com/cbb/players/", espn.data$player.id, "-1.html",
                                  sep = "")


if(r == 1){
  
  

rankings.espn <- espn.data

}

if(r > 1) {
  
  rankings.espn <- rbind(rankings.espn, espn.data)
}

}
r <- r + 1



}

View(rankings.espn)

espn = rankings.espn

# 
# espn.247$Name = gsub("Ray Robinson", "Raynard Robinson", espn.247$Name)
# 
# espn.247$Name = gsub("Jagan Mosley", "Jagan Mosely", espn.247$Name)
# 
# 
# espn.247$Name = gsub("Jeremy Carter-Sheppard", "Jeremy Sheppard", espn.247$Name)
# 
# espn.247$Name = gsub("Ryan Swan", "Ryan Swan-Ford", espn.247$Name)
# 
# espn.247$Name = gsub("Jaekwon Carlisle", "Jaekwon Carliyle", espn.247$Name)
# 



write.csv(espn, file = 'espn.2019.csv', row.names = F)
