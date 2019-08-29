
setwd('~/Honors Thesis/Raw Data')


#football url
# url_247 <- c("https://247sports.com/Season/2018-Football/CompositeCompositeRecruitRankings/?InstitutionGroup=highschool")


poslist <- c("PG", "SG", "CG", "SF", "PF", "C")

season.list = c(2015, 2016, 2017, 2018, 2019)

for(q in 1:length(season.list)){
  
  print( q / length(season.list) * 100)

for(r in 1:length(poslist)){
  
  


url_247 <- paste("https://247sports.com/Season/", season.list[q], "-Basketball/RecruitRankings/?InstitutionGroup=highschool&Position=", 
                 poslist[r], sep = "")



#url_247 <- c("https://247sports.com/Season/2017-Basketball/CompositeRecruitRankings/?InstitutionGroup=highschool")


library(tidyverse)
library(rvest)

css_tags <- '.score , .other , .position , .rank , .sttrank , .posrank , .natrank , .hw , .rankings-page__name-link , .meta , .metrics , .pos , .name'
rankings_2018 = url_247 %>%
  read_html() %>%
  html_nodes(css=css_tags) %>% html_text()

#View(rankings_2018)

#mycolnames <- rankings_2018[1:5]


rankings_2018 <- rankings_2018[6:length(rankings_2018)]


indices <- seq(from = 1, to = length(rankings_2018), by = 10)



clean.data <- data.frame(matrix(ncol = 10, nrow = 0))


for(i in 1:c(length(indices)-1)){
  
  start <- indices[i]
  

  end <- indices[i+1] - 1
  
  if(is.na(end)){
    
    end = 10
    start = 1
  }
  
  if(end == 0){
end = 10
start = 10
    
  }
  
  
#print(rankings_2018)
  row <- rankings_2018[start:end]
  
  
  
  clean.data[i,] <- row
  
}


colnames(clean.data) <- c("Previous.National.Ranking", "Name", "Hometown", "Position", 
                          "Height.Weight", "Rating", "All Ratings", "National.Ranking",
                          "Position.Ranking", "State.Ranking")




for(i in 1:length(clean.data$Name)){
  
player <- clean.data[i, 'Name']

lower.player <- tolower(player)

lower.player <- gsub(" jr.", "jr", lower.player, fixed = T)
lower.player <- gsub(" sr.", "sr", lower.player, fixed = T)

lower.player <- gsub(" iii", "iii", lower.player, fixed = T)
lower.player <- gsub(" ii", "ii", lower.player, fixed = T)
lower.player <- gsub(" iv", "iv", lower.player, fixed = T)


lower.player <- gsub(".", "", lower.player, fixed = T)
first.last <- strsplit(lower.player, ' ')

#print(first.last)

clean.data[i, 'player.id'] <- paste(first.last[[1]][1:length(first.last[[1]])], collapse = "-")


}

clean.data$Season = season.list[q]

if(r == 1 & q == 1){
  rankings.247 <- clean.data
  
  
}

else{
library(plyr)
  
  rankings.247 = rbind.fill(rankings.247, clean.data)
}

}
}


View(rankings.247)



write.csv(rankings.247, file = 'rankings.247.raw.csv', row.names = F)


# team.tag = '.png" title="'
# 
# 
# teams = readLines(pg_url_247)
# 
# top.50.pos = grep('ViewPath=', teams)
# 
# teams <- teams[1:top.50.pos]
#View(teams)



