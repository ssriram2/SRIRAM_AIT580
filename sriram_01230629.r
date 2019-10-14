###--------------------------------------
#Student Name:SRIRAM SAI SUMANTH
#GNumber:G-01230629
###--------------------------------------

rm(list=ls())

data <- read.csv("~/Desktop/EmployeeAttrition.csv")

# this is just for testing to use "print" statement.
print(data[1,])



# a. Find the number of rows and columns in the dataset (5 points)

print(nrow(data))
print(ncol(data))
# b. Find the maximum Age in the dataset (5 points)
print(max(data$Age ,na.rm = TRUE))

# c. Find the minimum DailyRate in the dataset (5 points)
print(min(data$DailyRate,na.rm = TRUE))

# d. Find the average/mean MontlyIncome in the dataset (5 points)

print(mean(data$MonthlyIncome,na.rm = TRUE))
# e. How many employees rated WorkLifeBalance as 1 (5 points)
print(length(which(data$WorkLifeBalance == 1)))
# f. What percent of total employees have TotalWorkingYears less than equal to 5? Also calculate the percentage for TotalWorkingYears greater than 5 (5 points)
less=length(which(data$TotalWorkingYears <= 5))
total=length(data$TotalWorkingYears)
percent_less=(less/total)*100
print(percent_less)
greater=length(which(data$TotalWorkingYears > 5))
percent_greater=(greater/total)*100
print(percent_greater)

# g. Print EmployeeNumber, Department and MaritalStatus for those employees whose Attrition is Yes and RelationshipSatisfaction is 1 and YearsSinceLastPromotion is greater than 3 (10 points)
employee = data[data$Attrition == 'Yes' & data$RelationshipSatisfaction == '1' & data$YearsSinceLastPromotion >= 3, c("EmployeeNumber", "Department", "MaritalStatus")]
print(employee)

# h. Find the mean, median, mode, standard deviation and frequency distribution of EnvironmentSatisfaction for males and females separately. (Hint: For frequency distribution use table() function (10 points)
x = data[ data$Gender== 'Male' , "EnvironmentSatisfaction"]
print(mean(x))
print(median(x))
mode_male=function(x){
  n=unique(x)
  n[which.max(tabulate(match(x,n)))]}
print(mode_male(x))
sd(x)
x.freq  = table(x)
print(x.freq)
# For Female
y = data[ data$Gender== 'Female' , "EnvironmentSatisfaction"]
mean(y)
median(y)
mode_female=function(y){
  o=unique(y)
  o[which.max(tabulate(match(y,o)))]
}
print(mode_female(y))
sd(y)
y.freq  = table(y)
print(y.freq)


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



