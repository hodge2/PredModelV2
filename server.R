
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
load("simulated_pop.rda")

shinyServer(function(input, output) {

  person <- reactive({
    tmp <-   skeleton
    tmp[1, "hours"] <- input$hours
    tmp[1, "agegrp_id"] <- input$agegrp_id
    tmp[1, "occupation_id"] <- input$occupation_id
    
    return(tmp)
  })
  

  output$Prediction <- renderPlot({
    # prediction for the given values
    model_pred = suppressWarnings(predict(lmSTEP, newdata = person()))
    n = 10000
    #draw random residuals
    res = sample(lmSTEP$residuals,n,replace=TRUE)
    res = tibble(res)
    y = mutate(res,model_PI = exp(model_pred + res))
    dens = (density(y$model_PI))
    plot(pop_density, main="Income Density", xlim=c(0,5000), ylim=c(0,0.002))
    lines(dens, col = "blue")
  })

})
