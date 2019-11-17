###------------------
###Regression and Clustering
###------------------

###Students Name: Sriram Sai Sumanth
###GNumber: G01230629


rm(list=ls())

library(ggplot2)

data <- read.csv("./EmployeeAttrition.csv")

#1.a Show the scatter plot with relationship curve between TotalWorkingYears and MonthlyIncome. Briefly explain your observation in the plot 
scatter.smooth(x = data$TotalWorkingYears,y = data$MonthlyIncome,main = "Scatter Plot",xlab = "Total Working Years",ylab = "Monthly Income")
#Here we can see that with increase in TotalWorkingYears the MonthlyIncome of the employee is also increased.

#1.b Show the scatter plot with relationship curve between Age and DistanceFromHome. Briefly explain your observation in the plot
scatter.smooth(x = data$Age,y = data$DistanceFromHome,main = "Scatter Plot",xlab = "Age",ylab = "Distance From Home")
#Here we can see that the Age and DistanceFromHome negligibly related.

#1.c Calculate Correlation for (a) and (b) and explain the values to support your answer in (a) and (b)
cor(x = data$TotalWorkingYears,y = data$MonthlyIncome,method = ("pearson"))
cor.test(x = data$TotalWorkingYears,y = data$MonthlyIncome,method = ('pearson'))

cor(x = data$Age,y = data$DistanceFromHome,method = ("pearson"))
cor.test(x = data$Age,y = data$DistanceFromHome,method=("pearson"))
#When the correlation coefficient value is close to  zero there is no or negligible relationship
#between the attributes. Therefore the correlation coefficient of a is 0.7728932 showing that the attributes are related, 
#whereas the correlation coefficient of b is -0.00168612 showing that the attribues are negligibly related. 

#1.d Using Linear Regression, find details of the relationship between TotalWorkingYears and 
#MonthlyIncome. Explain results in terms of p-value at 95% confidence interval and determine 
#whether the relationship is significant or not
a <- data$TotalWorkingYears
b <- data$MonthlyIncome
LinearMod <- lm(a~b)
print(LinearMod)
summary(LinearMod)
#Since the p-value(2.2e-16) is less than the significant level(0.05) both the attributes TotalWorkingYears and MonthlyIncome
#are positively related.

## 2. Clustering 
library(cluster) 
cl <- data.frame(data$TotalWorkingYears,data$HourlyRate)
set.seed(100)
kmeans1 <- kmeans(cl,3,iter.max=300,nstart = 10)

plot(cl,col=kmeans1$cluster)
#visualize 3-clusters
library(ggplot2)
ggplot(cl)+
  geom_point(aes(x=data$TotalWorkingYears,y=data$HourlyRate,color=kmeans1$cluster),size=1)+
  stat_ellipse(aes(x=data$TotalWorkingYears,y=data$HourlyRate,group=kmeans1$cluster,type="norm"))+
  theme(legend.position='top')
#The employees are grouped with respect to total working years into 3 clusters, but the 3-clustering is not good enough to cluster the employees.
#visualize 5 clusters
kmeans1 <- kmeans(cl,5,iter.max=300,nstart = 10)
plot(cl,col=kmeans1$cluster)
ggplot(cl)+
  geom_point(aes(y=data$TotalWorkingYears,x=data$HourlyRate,color=kmeans1$cluster),size=1)+
  stat_ellipse(aes(y=data$TotalWorkingYears,x=data$HourlyRate,group=kmeans1$cluster,color=kmeans1$cluster))
#The employees are grouped with respect to total working years into 5 clusters, making it a good division.