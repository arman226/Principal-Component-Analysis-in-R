# install pre-requisite packages
install.packages("arules")
install.packages("stats")
install.packages("dplyr")

# load the required libraries 

library(stats)
library(dplyr)


# using Iris Dataset
View(iris)

# Unsupervised Learning - Hence converting iris data to unlabeled data set
mydata = select(iris, c(1,2,3,4)) # Select from the Iris Data Set and then choose the first 4 columns
mydata

# Check the correlation among the variables or predictors
# in other words, we have to check if they are LINEARLY DEPENDENT
# Correlation Matrix can help check whether or not the variables are highly correlated 
# If the average correlation is above 0.3 or below -0.3, then the variables are highly correlated with one another AND
# Eligible for PCA
mydataCor <- cor(mydata)
View(mydataCor)
mean(mydataCor)  # use the mean function the see or calculate the correlation among variables


# Since the data is Eligible for Principal Component Analysis, let's execute the "princomp" function and let's assign it to an object called PCA
PCA <- princomp((mydata))
View(PCA)
