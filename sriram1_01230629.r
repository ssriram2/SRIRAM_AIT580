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

