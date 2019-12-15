library(tidyverse)
library(ggplot2)
library(caTools)
library(rpart)
library(rpart.plot)

data<-read.csv("~/Desktop/stormn_1998.csv")

set.seed(100)

summary(data)
head(value)
#hypothesis Testing
winter_storm <- which(data$EVENT_TYPE == 'Winter Storm')
flood <- which(data$EVENT_TYPE == 'Flood')
snow<-which(data$EVENT_TYPE == 'Heavy Snow')
lightning<-which(data$EVENT_TYPE == 'Lightning')
t.test(data$DEATHS_DIRECT[winter_storm],data$DEATHS_DIRECT[flood], alternative="greater", conf.level = 0.95)
t.test(data$MAGNITUDE[winter_storm],data$MAGNITUDE[flood], alternative="greater", conf.level = 0.95)
t.test(data$DEATHS_DIRECT[snow],data$DEATHS_DIRECT[flood], alternative="greater", conf.level = 0.95)
t.test(data$DEATHS_DIRECT[winter_storm],data$DEATHS_DIRECT[lightning], alternative="less", conf.level = 0.95)

set.seed(123)
# desicion trees 


split = sample.split(data, SplitRatio = 0.8)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)


#Regression Trees

library(rpart)
library(rpart.plot)

# Visualizing the Training set results
regressor = rpart(formula =  TOR_WIDTH~INJURIES_DIRECT,
                  data = training_set)

prp(regressor, main="Desicion Tree Regression (Training Set)")


# Visualizing the Test set results
regressor_test = rpart(formula =  TOR_WIDTH~INJURIES_DIRECT,
                       data = test_set)
prp(regressor_test, main= "Desicion Tree Regression (Test Set)")

