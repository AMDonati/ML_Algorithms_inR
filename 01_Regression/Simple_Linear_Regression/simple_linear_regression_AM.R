# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Salary_Data.csv')
# dataset=dataset[,2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#Fitting Simple Linear Regression to the Training Set
regressor=lm(formula=Salary~YearsExperience,data=training_set)
#in summary(regressor), "***" means that the relation between Salary & YearsExperience has high Statistical Experience

# Predicting the Test set results 
y_pred=predict(regressor,newdata=test_set)

#Visualizing the Training Set results with ggplot2
# install.packages("ggplot2")
library(ggplot2)
ggplot()+geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),
                    color="red")+
        geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata=training_set)),
                  color="blue")+
ggtitle("Salary vs Experience (Training Set)")+
xlab("Years of experience")+
ylab("Salary")

#Visualizing the Test Set results with ggplot2
# install.packages("ggplot2")
library(ggplot2)
ggplot()+geom_point(aes(x=test_set$YearsExperience,y=test_set$Salary),
                    color="red")+
        geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata=training_set)), # the regression line does not change - based on training_set
                  color="blue")+
        ggtitle("Salary vs Experience (Test Set)")+
        xlab("Years of experience")+
        ylab("Salary")