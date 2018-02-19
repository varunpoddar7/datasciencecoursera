
library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage("Car for the Par", 
                   
        tabPanel("Data",
        
        
            fluidPage(
            
                # Application title
                titlePanel("Get that dream car!"),
                
                # Sidebar with a slider input for number of bins 
                sidebarLayout(
                    sidebarPanel(

                        helpText("Setup your car preferences"),
                        
                        selectInput("cyl", "Select Cylinders:", choices=c(4,6,8)),
                        
                        sliderInput("hp",
                                    "Select horsepower range:",
                                    min = 0,
                                    max = 350,
                                    value = 0,
                                    step = 50),
                        radioButtons("transmission", "Select transmission type:", choices=c("Automatic"=0, "Manual"=1), selected=1)
                    ),
                
                    # Show data and graphs
                    mainPanel(
                        h4("Documentation / Instructions:"),
                        p("From the", em(" left "),"panel, please set preferences for (a) cylinders, (b) horsepower and (c) transmission type. Please see the", em(" About "), "tab from the navigation bar for source code and presentation links."),
                        br(),
                        h4("Selection:"),
                        textOutput("selectedVar"),
                        br(),
                        dataTableOutput("tableCars"),
                        plotOutput("plotMpg")
                    )
                )
            )
    
        ), 
        
        tabPanel("About", 
                 mainPanel(includeMarkdown("about.Rmd"))
                 )

    )
)