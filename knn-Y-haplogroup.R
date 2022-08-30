rm(list=ls())#**********
setwd("D:/R-WD")#**********

# Read the data
pop <- read.csv("sample_input.csv") #**********
str(pop)
as.factor(pop$Haplogroups)

# Division of `Haplogroups`
table(pop$Haplogroups) #**********check the sum of each haplogroup, and omit the one less than 9.

# Percentual division of `Haplogroups`
round(prop.table(table(pop$Haplogroups)) * 100, digits = 1)#**********

# Summary overview of `pop`
summary(pop) 

install.packages("caret")
library(class)#**********
library(ggplot2)#**********
library(lattice)#**********
library(caret)#**********

# Build your own `normalize()` function
normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}
#**********

# Normalize the `pop` data
pop_norm <- as.data.frame(lapply(pop[1:23], normalize))#**********

# Summarize `pop_norm`
summary(pop_norm)#**********

# Merge `pop_pred` and `pop.testLabels` 
pop_merge <- data.frame(pop_norm, pop[, 24])#**********

head(pop_merge)

# Specify column names for `merge`
names(pop_merge) <- c("DYS19", "DYS389I", "DYS389II", "DYS390", "DYS391", "DYS392", "DYS393", 
"DYS437", "DYS438", "DYS439", "DYS448", "DYS449", "DYS456", "DYS458", "DYS460", "DYS481", 
"DYS518", "DYS533", "DYS570", "DYS576", "DYS627", "DYS635", "YGATAH4", "Haplogroups")#**********
# Inspect pop_merge
pop_merge#**********

set.seed(1234)#**********

# Create index to split based on labels  
index <- createDataPartition(pop_merge$Haplogroups, p=0.75, list=FALSE)#**********

# Subset training set with index
pop.training <- pop_merge[index,]#**********

# Subset test set with index
pop.test <- pop_merge[index,]#**********

# Overview of algos supported by caret
names(getModelInfo())

# Train a model
model_knn <- train(pop.training[, 1:23], pop.training[, 24], method='knn')#**********

# Predict the labels of the test set
predictions<-predict.train(object=model_knn,pop.test[,1:23], type="raw")#**********

# Evaluate the predictions
table(predictions)#**********

# Confusion matrix 
confusionMatrix(predictions,as.factor(pop.test[,24]))

# Compose `pop` test labels
pop.testLabels <- pop.test[, 24]#**********
# Merge `pop_pred` and `pop.testLabels` 
merge <- data.frame(predictions, pop.testLabels)#**********
# Specify column names for `merge`
names(merge) <- c("Predicted Haplogroups", "Observed Haplogroups")#**********
# Inspect `merge` 
merge#**********
write.table(merge,"Y-haplogroup comparison.csv",sep=",")

#deeper indication of performance of your model
install.packages("gmodels")
library(gmodels)#**********

#make a cross tabulation or a contingency table
CrossTable(x = pop.testLabels, y = predictions, prop.chisq=FALSE)#**********
#the last argument prop.chisq indicates whether or not the chi-square contribution of each cell is included. 
#The chi-square statistic is the sum of the contributions from each of the individual cells and is used to decide 
#whether the difference between the observed and the expected values is significant.
CrossTable(x = pop.testLabels, y = pop_pred, prop.chisq=TRUE)