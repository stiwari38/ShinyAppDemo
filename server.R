
library(ggplot2)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

server <- function(input, output) {
   output$mpgPlot <- renderPlot({
    p <- ggplot() + geom_point(data = mpgData, aes_string(x= input$Xvar, y = input$Yvar, color = input$colorVar, size = input$sizeVar)) + 
        scale_size(range = c(4,10)) +
      labs(caption="Mtcars data plot") +
        theme(plot.caption = element_text(hjust=0.5, size=16))
      
    p
  })
  
}