# Polynomial regression 

# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

# Splitting the dataset into the Training set and Test set - not done this time car small sample 
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Linear Regression to the dataset 
lin_reg=lm(formula=Salary~.,data=dataset)

#Fitting Polynomial Regression to the dataset 
# A polynomial regression model is a multiple regression model with one ind varibale + polynomial terms= independant variables of level^n
dataset$Level2=dataset$Level^2 # add the polynomial terms - Level 2
dataset$Level3=dataset$Level^3 # add the polynomial terms - Level 3
dataset$Level4=dataset$Level^4# add the polynomial terms - Level 4

poly_reg=lm(formula=Salary~.,data=dataset)

# Visualising the Linear Regression results 
ggplot()+
        geom_point(aes(x=dataset$Level,y=dataset$Salary),
                   color="red")+
        geom_line(aes(x=dataset$Level,y=predict(lin_reg,newdata=dataset)),
                  color="blue")+
        ggtitle("Truth or Bluff (Linear Regression)")+
        xlab("Level")+
        ylab("Salary")

# Visualising the Polynomial Regression results 
ggplot()+
        geom_point(aes(x=dataset$Level,y=dataset$Salary),
                   color="red")+
        geom_line(aes(x=dataset$Level,y=predict(poly_reg,newdata=dataset)),
                  color="blue")+
        ggtitle("Truth or Bluff (Polynomial Regression)")+
        xlab("Level")+
        ylab("Salary")

# Predicting a new result with Linear Regression
y_pred=predict(lin_reg,data.frame(Level=6.5))

# Predicting a new result with Polynomial Regression 
 # we indicate all the levels of the data point we want to predict
