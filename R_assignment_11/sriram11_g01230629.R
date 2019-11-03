###------------------
###Visualization
###------------------

###Students Name: Sriram Sai Sumanth
###GNumber:G-01230629


rm(list=ls())

data <- read.csv("../EmployeeAttrition.csv")

#Create Histogram for Age using R 
#the generic function hist computes a histogram of the given data vales

hist(data$Age, main = "Histogram")

#Create Scatter Plot for Age and Monthly Income using R
#generic function for plotting r objects, here age is the x cordinate and 
#monthlyincome is the y cordinate and the lab is used to label the axis

plot(data$Age, data$MonthlyIncome, main = "scatter plot", xlab = "Age", ylab = "Monthly")
