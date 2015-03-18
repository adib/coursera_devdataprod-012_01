library(dplyr)
library(caret)
library(doMC)
library(ggplot2)
registerDoMC(cores = 4)

data(mtcars)
engineType <- c("V","S")
transmissionType <- c("A","M")
inputData <- mtcars %>% mutate(
    vs = as.factor(engineType[vs+1]),
    am = as.factor(transmissionType[am+1]),
    gear = as.factor(gear),
    cyl = as.factor(cyl),
    carb = as.factor(carb)
    )

set.seed(42)
indexTraining <- createDataPartition(inputData$mpg,p=0.7,list=TRUE)$Resample1
trainingSet <- inputData[indexTraining,] 
testingSet <- inputData[-indexTraining,] 

modFit <- train(form=mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb,
                method="rf",trControl=trainControl(method="cv"), data=trainingSet)
testPrediction <- predict(modFit,testingSet)

coeffDetermination <- function(observed,expected) {
    meanObserved <- mean(observed)
    1 - sum((expected - meanObserved) ^ 2) / sum((observed - meanObserved) ^ 2)
}

avgError <- function(observed,expected) {
    mean(abs(observed-expected) / observed)
}

model <- list(modFit = modFit,accuracy = 1 - avgError(testingSet$mpg,testPrediction))
saveRDS(model,"model.rds")

model$accuracy

resid <- testingSet$mpg - testPrediction
qplot(testingSet$mpg,resid,xlab="Test Set (mpg)", ylab="Residual") + geom_point() + geom_abline(intercept=0,slope=0)

qplot(testingSet$mpg,resid,xlab="Test Set (mpg)", ylab="Residual") + geom_abline(intercept=0,slope=0)

residPct <- (testingSet$mpg - testPrediction) / testingSet$mpg * 100

qplot(testingSet$mpg,residPct,xlab="Test Set (mpg)", ylab="Prediction Error (Percent)") + geom_abline(intercept=0,slope=0) + ylim(-25,25)

# todo: show this plot in the presentation  -- maybe even re-run the model in the presentation.
qplot(testingSet$mpg,residPct,xlab="Test Observations (mpg)", ylab="Prediction Error (Percent)") + geom_abline(intercept=0,slope=0) + ylim(-25,25)

