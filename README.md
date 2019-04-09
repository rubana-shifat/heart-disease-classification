# Heart Disease Classification
Classification of presence of heart disease based on certain cardiovascular events and health.

The dataset was taken from Kaggle: https://www.kaggle.com/ronitf/heart-disease-uci

The data is split into train and test data using sampling. Two different models are trained to compare the accuracy of the prediction.
1. Logistic Regression
2. Random Forest

The predictions were carried out on the test sub-set and the accuracy is calculated using an average of the number of times the predicted value (0 or 1) matched the actual target value of the test sub-set.
