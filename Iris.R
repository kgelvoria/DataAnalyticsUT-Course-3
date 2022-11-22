#Install Packages
install.packages("readr")
library("readr")
#Import Data
IrisDataset<-read.csv("iris.csv") #CSV file has to be in quotes
#Describe data
attributes(IrisDataset) #attributes of dataset
summary(IrisDataset) #make sure calling right dataset name
str(IrisDataset) #Displays structure of dataset
names(IrisDataset)
head(IrisDataset)
#Plot data
hist(IrisDataset$Species)
##Error because x must be numeric - will need to change these characters to numbers
hist(IrisDataset$Sepal.Length)
hist(IrisDataset$Sepal.Width)
hist(IrisDataset$Petal.Length)
hist(IrisDataset$Petal.Width)
plot(IrisDataset$Sepal.Length)
plot(IrisDataset$Sepal.Width)
plot(IrisDataset$Petal.Length)
plot(IrisDataset$Petal.Width)
qqnorm(IrisDataset)
##Error because all species is not numerical - we can still create qqnorm for all other columns
qqnorm(IrisDataset$Sepal.Length)
qqnorm(IrisDataset$Sepal.Width)
qqnorm(IrisDataset$Petal.Length)
qqnorm(IrisDataset$Petal.Width)
#Transform data
IrisDataset$Species<- as.numeric(IrisDataset$Species)
head(IrisDataset) #Species is now messed up - need to re-pull the data
#Import Data
IrisDataset<-read.csv("iris.csv")
head(IrisDataset)
#Define numbers for each species
IrisDataset$SpeciesNum[ IrisDataset ['Species'] == 'setosa'] <- 1
IrisDataset$SpeciesNum[ IrisDataset ['Species'] == 'versicolor'] <- 2
IrisDataset$SpeciesNum[ IrisDataset ['Species'] == 'virginica'] <- 3

head(IrisDataset)
hist(IrisDataset$SpeciesNum)
#Creating Testing & Training Sets
#Set seed 
set.seed(123)
#Split data into training and test sets  - 20% training; 80% testing
##This is an error because training set size must be bigger than test set size
trainSize <- round(nrow(IrisDataset) * 0.2)
testSize <- nrow(IrisDataset) - trainSet
##Error in non-numeric argument fixed by "testSize<-nrow(IrisDataset)-trainSize"
testSize<-nrow(IrisDataset)-trainSize
trainSizes
#Error object not found - change to trainSize
trainSize
testSize
training_indices<-sample(seq_len(nrow(IrisDataset)),size = trainSize)
trainSet <- IrisDataset[training_indices, ]
testSet <- IrisDataset[-training_indices, ]
str(trainSet)
str(testSet)
##Linear model X=IV (Predictor); Y=DV
##We are attempting to predict Petal length so that will be our DV=Y; sepal length will be IV=X
PLModel<-lm(Petal.Length~ Sepal.Length, trainSet)
summary(PLModel) 
##Multiple R Squared was 0.03188 and p-value of 0.3048
##Sepal length has no effect on petal length and there was not a good model fit
#Set Seed to 405
set.seed(405)
#Split data into training and test sets  - 70% training; 30% testing
trainSize<-round(nrow(IrisDataset)*0.7)
testSize<-nrow(IrisDataset)-trainSize
trainSize
testSize
trainSet <- IrisDataset[training_indices, ]
testSet <- IrisDataset[-training_indices, ]

#Linear Regression Model - X=IV (predictor); Y=DV
#We want to predict Petal Width, so that will be our DV=Y; Petal Length is IV=X
#LinearModel<-lm(trainSet$Petal.Width ~ testingSet$Petal.Length)
LinearModel<- lm(trainSet$Petal.Width ~ testingSet$Petal.Length)
##Error in eval structure - fixed below
LinearModel<-lm(Petal.Width~ Petal.Length, trainSet)
summary(LinearModel)
##Multiple R-squared of 0.0895 and p-value of 0.08083
##model not a good fit and petal length has no effect on petal width
prediction<-predict(LinearModeltestSet)
##Error object not found
prediction<-predict(LinearModel,testSet)
predictions
##Shows Predictions object from Cars analysis - must use object prediction instead
Prediction
#add confidence level
predict(LinearModel,testSet,interval='confidence')
#make plot
plot(IrisDataset$Petal.Length, IrisDataset$Petal.Width, xlab="Petal Length", ylab="Petal Width")
abline(IrisDataset$coefficients, col = "red")