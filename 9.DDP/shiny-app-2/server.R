library(shiny)
library(datasets)
data("mtcars")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    mtcars$Car <- rownames(mtcars)
    names(mtcars) <- c("MPG", "Cylinders", "Displacement", "HP", "Drat", "Weight", "Qsec", "VS", "AM", "Gears", "Carburetors", "Car")
    
    mtcarsSub <- reactive({
        subset(mtcars, Cylinders==input$cyl & HP>=input$hp & AM==input$transmission, c(12, 1:4, 6, 10))
    })
    
    output$selectedVar <- renderText({ 
        paste("You have chosen to view ", input$cyl, " cylinder cars that have ", "horsepower above ", input$hp)
    })  
    
    
    output$plotMpg <- renderPlot({
        
        if (nrow(mtcarsSub())>0) {
            plot(mtcarsSub()$MPG, mtcarsSub()$Weight, type="n", xlab="", ylab="")
            text(mtcarsSub()$MPG, mtcarsSub()$Weight, mtcarsSub()$Car) 
            title(main="Cars - MPG vs. Weight", xlab="MPG", ylab="Weight (1000 lbs)")
        }
    })
  
    output$tableCars <- renderDataTable({
        
        mtcarsSub()
          
    }, options = list(lengthMenu = c(5, 10), pageLength = 10))
  
})
