#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  fit <- lm(hwy ~ displ, data = mpg)
  a<-  reactive({
    fittedValue <-
      predict(fit, newdata = data.frame(displ = input$displ))
  })
  output$res <- renderText({
    a()
  })
  output$predPlot <- renderPlot({
    p <-
      ggplot(data = mpg , aes(x = displ, y = hwy)) + geom_point() + geom_smooth(method = lm)  + geom_point(aes(x = input$displ, y = a()), colour = "red")
    print(p)
  })
})
