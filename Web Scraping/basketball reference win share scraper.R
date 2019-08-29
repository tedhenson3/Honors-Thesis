
setwd('~/Honors Thesis/Raw Data')

# thing <- c("https://www.sports-reference.com/cbb/players/gary-trentjr-1.html")

#notes on weird player tags for sports reference url#
#1 Marvin Bagley III = marvin-bagleyiii-1
#2 Gary Trent Jr. = gary-trentjr-1
#3 M.J. Walker = mj-walker-1
#4 Silvio De Sousa = silvio-desousa-1
#5 Shai Gilgeous-Alexander = shai-gilgeous-alexander-1
#6 Nickeil Alexander-Walker = nickeil-alexander-walker-1


wsscraper <- function(data){
  source("~/Honors Thesis/Web Scraping/sports.ref.scraper.R")
  
  fulldata <- data.frame()
  
  bad.links <- 0
  for(i in 1:nrow(data)){
    
    

  url <- as.character(data[i, 'bball.ref.link.espn'])
  
  # url <- gsub("jaren-jackson", "jaren-jacksonjr", url)
  # 
  # url <- gsub("wendell-carter", "wendell-carterjr", url)
  library(tidyverse)
  library(rvest)
  link <- try(readLines(url))
  
  if(class(link) != "try-error"){
    
    bio.data <- sports.ref.scraper(url)
#bio.data$bball.ref.player.id <- data[i, 'player.id']
  }



if(grepl(data[i, 'School'], bio.data$College) != T | class(link) == "try-error"){

  j <- 2
  while(j < 10){
    old.num <- paste(j-1, '.html', sep = "")
    new.num <- paste(j, '.html', sep = "")
    url <- gsub(old.num, new.num, url)
    
    link <- try(readLines(url))
    
    if(class(link) != "try-error"){
      bio.data <- sports.ref.scraper(url)
    }
    
    
    if(grepl(data[i, 'School'], bio.data$College) == T){
    j <- 10   
    }
    if(grepl(data[i, 'School'], bio.data$College) != T){
   
        
      j <- j + 1
    }
    
    
    }
}
  

  
  
  if(grepl(data[i, 'School'], bio.data$College) != T | class(link) == "try-error"){
    
  reset.url <- as.character(data[i, 'bball.ref.link.espn'])
  
  
  if(grepl('jr-1', reset.url) == T){
    
    url <- gsub('jr-', '-', reset.url)
    
      j <- 1
      while(j < 10){
        
        
        old.num <- paste(j-1, '.html', sep = "")
        new.num <- paste(j, '.html', sep = "")
        url <- gsub(old.num, new.num, url)
        
        link <- try(readLines(url))
        
        if(class(link) != "try-error"){
          bio.data <- sports.ref.scraper(url)
        }
        
        
        if(grepl(data[i, 'School'], bio.data$College) == T){
          j <- 10   
        }
        if(grepl(data[i, 'School'], bio.data$College) != T){
          
          
          j <- j + 1
        }
        
        
      }
    }
  }
  
  
  

  if(grepl(data[i, 'School'], bio.data$College) != T | class(link) == "try-error"){
    
  reset.url <- as.character(data[i, 'bball.ref.link.espn'])
  
  if(grepl('jr-1', reset.url) != T){
    
    url <- gsub('-1.html', 'jr-1.html', reset.url)
    
  j <- 1
  while(j < 10){
    
    
    old.num <- paste(j-1, '.html', sep = "")
    new.num <- paste(j, '.html', sep = "")
    url <- gsub(old.num, new.num, url)
    
    link <- try(readLines(url))
    
    if(class(link) != "try-error"){
      bio.data <- sports.ref.scraper(url)
    }
    
    
    if(grepl(data[i, 'School'], bio.data$College) == T){
      j <- 10   
    }
    if(grepl(data[i, 'School'], bio.data$College) != T){
      
      
      j <- j + 1
    }
    
    
  }
}
  }
  
  if(grepl(data[i, 'School'], bio.data$College) == T){
    
    data[i, 'link'] <- url
  }
  
  
  if(grepl(data[i, 'School'], bio.data$College) == T){
    
lastcol <- as.numeric(ncol(bio.data) + length(data[i,]))
full.row <- cbind(data[i,], bio.data)
fulldata <- rbind(fulldata, full.row)

}




  }
  
  return(fulldata)
  }



  