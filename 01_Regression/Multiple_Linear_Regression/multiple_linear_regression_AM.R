# Fitting the mutliple linear Regression to the Training set
# regressor=lm(formula=Profit~R.D.Spend+Administration+Marketing.Spend+State,data=training_set) # long way
regressor=lm(formula=Profit~.,data=training_set) #trick 

# Predicting the test set results 
y_pred=predict(regressor,newdata = test_set)