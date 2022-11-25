# install pre-requisite packages
install.packages("stats") #has functionalities that will help us execute Principal Components Analysis
install.packages("dplyr") #helps us with data manipulation

# load the required libraries 

library(stats)
library(dplyr)


# using Iris Dataset let's inspect the data using the View function
View(iris)
# There are 5 columns in the Iris data set namely Sepal.length Sepal Width Petal Length and PEtal Width, and Species, but since PCA is a branch of
# Unsupervised Learning, we need unlabeled data, thus we need to ignore the Species column
# Unsupervised Learning - Hence converting iris data to unlabeled data set
mydata = select(iris, c(1,2,3,4)) # Select from the Iris Data Set and then choose the first 4 columns (Ignore the Fifth Column)
View(mydata)

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

# Evaluate the Result of PCA
# 1. Check if the PC capture the essence of the original variable
# 2. Check if the PCs are independent


#PC Loadings  
PCA$loadings #the loading matrix will help us evaluate how the principal components capture the ESSENCE of the original variables


#Take note that the number of the components built will ALWAYS be EQUAL to the number of VARIABLES

# Princiapl Components $
# ths scores matrix will help us evaluate if the PCs are independent
# if the PCs are independent, then the correlation must be 0 or must be nearly 0
PC <- PCA$scores
View(PC)
cor(PC)


