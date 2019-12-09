library("selectr")
library("xml2")
library("rvest")
library(dplyr)
library(readr)

url <- "https://nytimes.com"
webpage <- read_html(url)

# Just sample code. 
titles <- html_nodes(webpage, "div h2")
without_tags <- gsub("<.*?>", "", titles) 
print(without_tags)

# Assignment 15 Task 1: write scripts that extract "titles" and "news summary" of articles out of the scrapped data. 
# Then, print them out using "print()" statement. 
Titles <- html_nodes(webpage, "div h2")
title_tags <- gsub("<.*?>", "", Titles) 
print(title_tags)
news_summary <- html_nodes(webpage, "div p")
newssummary_tags <- gsub("<.*?>", "", news_summary) 
print(newssummary_tags)


# Assignment 15 Task 2: write scripts that oraganize your data as dataframe with column names, "title" and "news summary", respectively.
# Then, save this dataframe as a CSV file. Name it as "NYT_titles.csv". 

max.length <- max(length(title_tags),length(newssummary_tags))
Titles = c(title_tags, rep(0, max.length - length(title_tags)))
news_summary = c(newssummary_tags, rep(0, max.length - length(newssummary_tags)))
nytimes<-data.frame(Titles = Titles , news_summary = news_summary)
str(nytimes)
write_csv(nytimes,"NYT_TITLES.csv")

# Assignment 15 Task 3: once you save the CSV file, commit and push it back to your repository (no R scripts involved for Task 3). 

