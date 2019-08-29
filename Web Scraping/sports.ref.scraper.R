
setwd('~/Honors Thesis/Raw Data')


library(tidyverse)
library(rvest)
sports.ref.scraper <- function(player.ref){
  
  
  
  
  library(tidyverse)
  library(rvest)
  

  
  
  
  css_tags <- 'p , h1'
  stats = player.ref %>%
    read_html() %>%
    html_nodes(css=css_tags) %>% html_text()
  
  end <- grepl('School:', stats)
  
  real.end <- which(end == T)
  bio.end <- real.end[2]
  
  if(is.na(bio.end)){
    
    end <- grepl('Schools:', stats)
    
    real.end <- which(end == T)
    bio.end <- real.end[1]
    
  }
  if(is.na(bio.end)){
    
    player.data <- data.frame("College" = c(0))
    player.data$College <- 'miss'
    print('yes')
   
  }
  
  
  if(!is.na(bio.end)){
    
  
    
    
    bio <- stats[1:bio.end]
    
    bio <- gsub("\n", "", bio, fixed = T)
    
    
    end <- grepl('Position:', bio)
    
    real.end <- which(end == T)
    bio.end <- real.end[2]
    

    player.data <- data.frame("Name" = bio[1], "Position" = bio[2], "Height.Weight" = bio[3],
                              "Hometown" = bio[4], "High.School" = bio[5],
                              "College" = bio[length(bio)])
    
    player.data$Position = gsub("Position:", "", player.data$Position)
    player.data$Hometown = gsub("Hometown:", "", player.data$Hometown)
    player.data$High.School = gsub("High School:", "", player.data$High.School)
    
    player.data$College = gsub("School:", "", player.data$College)
    #player.data$RSCI.Rating = gsub("School:", "", player.data$College)
    
    
    player.data$College <- str_trim(player.data$College)
    
  }
  
  #colnames(player.data) <- paste("bball.ref.", colnames(player.data), sep = "")
  #print(player.data)
  print(player.data)
  return(player.data)
  
}
    
# url <- c("https://www.sports-reference.com/cbb/players/blake-harris-1.html")
# 
# sports.ref.scraper(url)
