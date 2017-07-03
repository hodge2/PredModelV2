
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  person <- reactive({
    tmp <-   skeleton
    tmp[1, "hours"] <- input$hours
    tmp[1, "agegrp_id"] <- input$agegrp_id
    tmp[1, "occupation_id"] <- input$occupation_id
    
    return(tmp)
  })
  
  
  output$Prediction <- renderTable({
    
    # prediction for the given values
    y = suppressWarnings(predict(lmSTEP, newdata = person()))
    return( y)
  })

})
