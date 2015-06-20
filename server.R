library(UsingR)
library(shiny)
library(caret)
library(randomForest)

trainingDF <- state.x77;
modFitAll <-train(Murder  ~ Illiteracy , data=trainingDF,method="rf",trainControl=trainControl(method="cv",number=5))


library(rattle)


murder_rate_calc <- function (illiteracy_rate) {
         input_val <- as.data.frame(illiteracy_rate)
         colnames(input_val) <- ("Illiteracy")
         predict(modFitAll,newdata=input_val)

}

shinyServer(
    function(input, output) {
        murder_rate <- reactive({murder_rate_calc(input$illiteracy_rate)})
        output$illiteracy_rate <- renderPrint({input$illiteracy_rate})
        output$murder_rate     <- renderPrint({murder_rate() })

    }
)
