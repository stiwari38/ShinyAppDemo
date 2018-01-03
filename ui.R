
library(shiny)

# Define UI 
ui <- pageWithSidebar(
  
  # App title ----
  headerPanel("Miles Per Gallon dataset interactive plot"),

  
  # Sidebar panel for inputs ----
  sidebarPanel(
    helpText("This app provides a demonstration of interactive plot in shiny.",
             "We will be using mtcars dataset.",
             "We will plot four variables using x axis, y axis,",
             "colour and size as dimensions."),
    # Input: selector for choosing predictor for modelling and plot----
    selectInput("Xvar", "Choose predictor plotted on x axis:",
                names(mtcars), selected = "wt"),
    selectInput("Yvar", "Choose predictor plotted on Y axis:",
                names(mtcars), selected = "mpg"),
    selectInput("colorVar","Choose variable used as color in plot:",
                names(mtcars),selected = "am"),
    selectInput("sizeVar","Choose variable used as size in plot:",
                names(mtcars),selected = "cyl"),
    helpText("Source code can be found:",
             a("here", 
               href = "https://github.com/stiwari38/ShinyAppDemo/tree/master"
               , target="_blank")),
    helpText(a("Author: Shobhit Tiwari", href = "https://www.linkedin.com/in/shobhit-tiwari-a02b534b/"
               , target="_blank"))
  
  ),
  
  # Main panel for displaying outputs ----
  mainPanel(
    plotOutput("mpgPlot")
  )
)