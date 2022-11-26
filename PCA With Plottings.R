# PCA is a tool when you have a dataset which is multidimensional
# When there's a bunch of variables, it's very difficult to understand or observe the patterns among data
library("stats")
library("dplyr")
# LOAD DATA ----
data("iris")
summary(iris)

#Execute the Principal Component Analysisto the loaded data (Don't include the Column that contains non-continues variables) in this case, let's exclude the "Species" column
myPR <- prcomp(iris[,-5], scale= TRUE) #set scale = TRUE = divide by standard deviation  (OPTIONAL)
plot(scale(iris$Sepal.Length), scale(iris$Sepal.Width))


myPR

summary(myPR)
plot(myPR, type="l")
biplot(myPR, scale=0)

#EXTRACT THE PC SCROES
str(myPR)
myPR$x
iris2<- cbind(iris, myPR$x[,1:2])
iris2


# PLOT WITH GGPLOT -----
#install.packages("ggplot2")
library(ggplot2)
ggplot(iris2, aes(PC1, PC2, col = Species, fill=Species)) + stat_ellipse(geom="polygon", col ="black", alpha = 0.5) + geom_point(shape=21, col="black")


#CORRELATION BET VARS AND PCS
cor(iris[,-5], iris2[,6:7])
