###--------------------------------------
#Student Name:SRIRAM SAI SUMANTH
#GNumber:G-01230629
###--------------------------------------


## Part 2 acme.csv file
rm(list=ls())

data <- read.csv("~/Desktop/Acme.csv")

# Question: Use Acme.csv and write R code to find the following: 

# Question 1: Identify data types for each attribute in the dataset (5 points) 
lapply(data,class)

# Question 2: Produce a summary statistics for each attribute in the dataset (5 points)
summary(data)

# Question 3:Produce visualizations for each attribute
hist(data$Years, col='red', main='Histogram for Years')
hist(data$StSalary, col='red',main='Histogram for Salary')
plot(data$Gender, col='orange',main='Histogram for Gender')
plot(data$Degree, col='orange',main = 'Histogram for Degree')

## Question 4: Display the relationship between:

#a. Years of Experience and Starting Salary for all employees (5 points)
ggplot(data, aes(x=Years,y=StSalary))+geom_point()+
  ggtitle(' Experience and Starting Salary for all employees')

#b. Years of Experience and Starting Salary for each gender
ggplot(data, aes(x=Years, y=StSalary,color=Gender))+
  ggtitle(' Experience and Starting Salary for each gender')+geom_point()

#c. Years of Experience and Starting Salary for each degree
ggplot(data,aes(x=Years,y=StSalary,color=Degree))+
  geom_point()+ggtitle('Experience and Starting Salary for each degree')
## Question 5: Find the correlation between Starting Salary and Years of Experience? 
#a.Is the correlation different for each gender?  
with(data[data$Gender == 'M',], cor(Years,StSalary))
with(data[data$Gender == 'F',], cor(Years,StSalary))
#b. Is the correlation different for each degree? 
with(data[data$Degree == 'BS',],cor(Years,StSalary))
with(data[data$Degree == 'MS',],cor(Years,StSalary))
with(data[data$Degree == 'PhD',],cor(Years,StSalary))

## Question 6:What can you conclude about Acme with respect to gender bias after your overall analysis?
## According to the dataset given by the Acme corporation, we can easily make out that there is huge gender bias in setting salaries for newly hired workers.
## In the dataset, it is clearly evident that a male who has 2 years of experience with BS degree and a female who 
## has 3 years of experience with  BS Degree were given the same saleries. BUt when it comes to PHD Degree Background,
## a male with 10 years of experience is paid 50 intitally, where as a female with 10 years of experience is paid 55.
## To conclude,there is gender bias for both the gendersdepending on their Degrees.



