
library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Understanding Midwestern US Demographics"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        helpText("Get demographic info on the Midwest"),
        
        selectInput("state", "Select State:", choices=c("IL", "IN", "MI", "OH", "WI")),
        
        sliderInput("countyPop",
                   "Show Counties with Population Above ('000s):",
                   min = 0,
                   max = 1000,
                   value = 200,
                   step = 100)
    ),
    
    # confirm data selection and show associated data
    mainPanel(
        h4("Documentation / Instructions:"),
        p("From the", em(" left "),"panel, please select (a) state and (b) county-population above which to display data"),
        br(),
        h4("Selection:"),
        textOutput("selectedVar"),
        br(),
        plotOutput("plotPop"),
        plotOutput("plotDemo")
       )
  )
))
