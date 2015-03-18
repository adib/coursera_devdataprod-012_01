library(dplyr)
library(caret)
library(doMC)
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

modFit <- lm(formula = mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb,data=inputData)

coeffs <- modFit$coefficients
factorWeights <- abs(coeffs) / sum(coeffs)

              
                