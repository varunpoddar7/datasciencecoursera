pkgs = c("shiny", "data.table", "ggplot2", "tidyr")
lapply(pkgs, require, character.only=TRUE)

# Define server logic 
shinyServer(function(input, output) {
  
    output$selectedVar <- renderText({ 
        paste("You have chosen to view data for counties with population greater than", input$countyPop, ",000 in ", input$state)
    })    
    
    
    mwState <- reactive({
        setDT(midwest)
        midwest[state==input$state & poptotal > input$countyPop*1000, .(state, county, area, poptotal, percwhite, percblack, percamerindan, percasian, percother)]
    })
    
    
    output$plotPop <- renderPlot({
        
        # graph county data for specified state and county population
        ggplot(mwState(), aes(x=county, y=poptotal/1000)) +
            geom_point(aes(size=area), na.rm=TRUE) +
            labs(x="County", y="Population ('000s)", title="Population by County") +
            theme(axis.text.x = element_text(angle = 90, hjust = 1))
        
    })
    
    output$plotDemo <- renderPlot({
        
        mwStateDemo <- gather(mwState(), demo_race, percent, percwhite, percblack, percamerindan, percasian, percother, factor_key = TRUE)

        #graph county data for specified state and county population
        ggplot(mwStateDemo, aes(x=county, y=percent, fill=demo_race)) +
            geom_bar(position="fill", stat="identity") +
            labs(x="County", y="Percent of Population", title="Demographic Info by County") +
            theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
        
    })  
})
