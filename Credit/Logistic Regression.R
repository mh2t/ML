# importing required libraries
library(glmnet)
library(tidyverse)
library(caret)

# read data sets
train.data  <- read.csv("newTrain_C.csv", header = T)
test.data <- read.csv("newTest_C.csv", header = T)

# helper function for scaling the numerical features
range01 <- function(x){(x-min(x))/(max(x)-min(x))}

# build the training set
drops <- c("Def_ind")
mat.train <- as.matrix(train.data[ , !(names(train.data) %in% drops)])
x = apply(mat.train[,-c(14:17)],2,range01)
x = cbind(x,train.data[,c(14:17)])
y <- as.matrix(train.data[,c("Def_ind")])

# build the test set
mat.test <- as.matrix(test.data[ , !(names(test.data) %in% drops)])
x.test = apply(mat.test[,-c(14:17)],2,range01)
x.test = cbind(x.test,test.data[,c(14:17)])
y.test <- as.matrix(test.data[,c("Def_ind")])

set.seed(123) 
########################
# estimate by lambda min
########################

# train Lasso Logisitc Regression
cv.lasso <- cv.glmnet(as.matrix(x), as.factor(y), alpha = 1, family = "binomial")
# Fit the final model on the training data using minimum lambda
model <- glmnet(as.matrix(x), as.factor(y), alpha = 1, family = "binomial",
                lambda = cv.lasso$lambda.min)
# Display regression coefficients
coef(model)
# Make predictions on the test data
probabilities <- model %>% predict(newx = as.matrix(x.test))
# Determine the class of 1 or 0 by probability
predicted.classes <- ifelse(probabilities > 0.5, 1, 0)
# Model accuracy
observed.classes <- test.data$Def_ind
mean(predicted.classes == observed.classes)
plot(cv.lasso)
plot(model)

########################
# estimate by lambda 1st
########################
# Fit the final model on the training data using 1se lambda
model2 <- glmnet(as.matrix(x), as.factor(y), alpha = 1, family = "binomial",
                lambda = cv.lasso$lambda.1se)
# Display regression coefficients
coef(model2)
# Make predictions on the test data
probabilities2 <- model2 %>% predict(newx = as.matrix(x.test))
predicted.classes2 <- ifelse(probabilities2 > 0.5, 1, 0)
# Model accuracy
observed.classes <- test.data$Def_ind
mean(predicted.classes2 == observed.classes)

plot(model2)

########################
# confusion matrix
########################
pdata <- predict(model2, newx = as.matrix(x.test), type = "response")

# use caret and compute a confusion matrix
confusionMatrix(data = as.factor(predicted.classes2), 
                reference = as.factor(observed.classes))



