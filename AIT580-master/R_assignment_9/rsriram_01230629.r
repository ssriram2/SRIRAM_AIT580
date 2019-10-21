###------------------
###Hypothesis Testing
###------------------

###Students Name:SRIRAM SAI SUMANTH
###GNumber:g-01230629



rm(list=ls())

data <- read.csv(file ="~/Desktop/EmployeeAttrition.csv")

males <- which(data$Gender=='Male')
females <- which(data$Gender=='Female')
single <- which(data$MaritalStatus=='Single')
married <- which(data$MaritalStatus=='Married')
yes <- which(data$Attrition=='Yes')
no <- which(data$Attrition=='No')
manager <-which(data$JobRole=='Manager')
laboratory_technician <- which(data$JobRole=='Laboratory Technician')

##a.If the MonthlyIncome of Males is greater than Females 
# Since the p-value(0.8891) is greater than the significant level(0.05) we consider null hypothesis is true i.e monthly
#income of males is not greater than feamles
print(t.test(data$MonthlyIncome[males],data$MonthlyIncome[females], alternative="greater", conf.level = 0.95))

##b.If the WorkLifeBalance of Males is less than Females 
# Since the p-value(0.4577) is greater than the significant level(0.05) we consider null hypothesis is true i.e work 
#life balance of males is not less than females
print(t.test(data$WorkLifeBalance[males],data$WorkLifeBalance[females], alternative="less", conf.level = 0.95))

##c.If the YearsAtCompany of Single is less than Married
# Since the p-value(0.004973) is less than the significant level(0.05) we consider alternate hypothesis is true
#i.e years at company of single is less than married
print(t.test(data$YearsAtCompany[single],data$YearsAtCompany[married], alternative="less", conf.level = 0.95))

##d.If the EnvironmentalSatisfaction of Attrition=Yes is less than Attrition=No
# Since the p-value(0.0001046) is less than the significant level(0.05) we consider alternate hypothesis is true
#i.e environmental satisfaction of attrition =yes is less than attrition = no
print(t.test(data$EnvironmentSatisfaction[yes],data$EnvironmentSatisfaction[no], alternative="less", conf.level = 0.95))

##e.If the MonthlyIncome of Manager is greater than Laboratory Technician (Hint: Use JobRole to find Manager and Laboratory Technician) 
# Since the p-value(2.2e-16) is less than the significant level(0.05) we consider alternate hypothesis is true
#i.e monthly income of manager is greater than laboratory technician
print(t.test(data$MonthlyIncome[manager],data$MonthlyIncome[laboratory_technician], alternative="greater", conf.level = 0.95))

##f.If YearsAtCompany and DailyRate are correlated with each other
#Since the p value(0.1919)  is greater than siginificant level(0.05)  we consider null hypothesis is true,so there is no correlation between years at company and daily rate 
a<-cor.test(data$YearsAtCompany,data$DailyRate,alternative = "two.sided",conf.level = 0.95)
print(a)

a_Regression<-summary(lm(YearsAtCompany ~ DailyRate,dat = data))
library(ggplot2)
plot(data$YearsAtCompany,data$DailyRate)
print(a_Regression)
##g.If YearsAtCompany and MonthlyIncome are correlated with each other 
#Since the  p value(2.2e -16) is less than significant level(0.05)  we consider alternate hypothesis is true, so there is correlation between years at company and monthly income
b<-cor.test(data$YearsAtCompany,data$MonthlyIncome,alternative = "two.sided",conf.level = 0.95)
print(b)

b_Regression<-summary(lm(YearsAtCompany ~ MonthlyIncome,dat = data))
library(ggplot2)
plot(data$YearsAtCompany,data$MonthlyIncome)
print(b_Regression)

##h.If YearsAtCompany varies depending on individual’s MaritalStatus
#Since the p-value(0.0247) is less than the significant level(0.05) we consider alternate hypothesis is true ,so years at company varies depending on 
# individuals marital status
c<-summary(aov(YearsAtCompany ~ MaritalStatus,dat = data,conf.level = 0.95))
print(c)
##i.If MonthlyIncome varies depending on individual’s PerformanceRating 
#Since the p-value(0.512) is greater than the significant level(0.05) we consider null hypothesis is true ,so monthly incomne does not
#vary depending on individuals performance
d<-summary(aov(MonthlyIncome ~ PerformanceRating,dat = data,conf.level = 0.95))
print(d)

##j.If MonthlyIncome varies depending on individual’s WorkLifeBalance
# Since the p-value(0.24) is greater than the significant level(0.05) we consider null hypothesis is true ,so monthly income does not vary depending 
#on individuals work life balance
e<-summary(aov(MonthlyIncome ~ WorkLifeBalance,dat = data,conf.level = 0.95))
print(e)


