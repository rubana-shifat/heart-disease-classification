library(dplyr)
library(ggplot2)
library(scales)
library(caret)
library(GGally)
library(randomForest)

#install.packages("randomForest")

# Uncomment the line below to set the appropriate directory
#setwd("F:/Data Analysis/Heart Disease UCI")
data = read.csv("heart.csv")

data$age = data$ï..age
# Split into train and test data
sample = sample(nrow(data), nrow(data)*.7)
train = data[sample, ]
test = data[-sample, ]

# Ensure it's a good split for preparing the model. Half-Half mix of 0/1
barplot(table(train$target))

# Exploratory data analysis on training set
str(train)
ggplot(train, aes(x=age)) + geom_bar() + theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
ggpairs(data=train, columns=1:13, mapping = aes(color = "blue"), axisLabels="show")


#Logistic regression
logitmod = glm(train$target ~ ., family="binomial", data=train)
summary(logitmod)


#Prediction
predictions = predict(logitmod, newdata = test, type="response")
predictionLevelsLR = ifelse(predictions > 0.5, 1, 0)
  
mean(factor(predictionLevelsLR, levels=c(0,1)) == test$target)


#Random Forest
modelRF = randomForest(train$target ~ ., data=train, ntree=500, mtry=6, importance=TRUE)
predictionRF = predict(modelRF, newdata = test, type="class")
predictionLevelsRF = ifelse(predictionRF > 0.5, 1, 0)
mean(factor(predictionLevelsRF, levels=c(0,1)) == test$target)