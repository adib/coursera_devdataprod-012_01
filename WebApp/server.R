library(nnet)
library(caret)
library(shiny)

shinyServer(function(input, output) {
    predModel <- readRDS("model.rds")

    output$predAccuracy <- renderText({sprintf("%d%%",round(predModel$accuracy * 100))})
    output$predMPG <- renderText({
        rowFrame <- data.frame(
            cyl = as.factor(input$cyl),
            disp = as.numeric(input$disp),
            hp = as.numeric(input$hp),
            drat = as.numeric(input$drat),
            wt = as.numeric(input$wt),
            qsec = as.numeric(input$qsec),
            vs = as.factor(input$vs),
            am = as.factor(input$am),
            gear = as.factor(input$gear),
            carb = as.factor(input$carb)
        )
        levels(rowFrame$vs) <- c("S","V")
        levels(rowFrame$cyl) <- c(4,6,8)
        levels(rowFrame$am) <- c("A","M")
        levels(rowFrame$gear) <- c(3,4,5)
        levels(rowFrame$carb) <- c(1,2,3,4,6,8)
        
        predMPG <- predict(predModel$modFit,rowFrame)
        sprintf("%0.2f",predMPG)
    })
})
