
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
load("dimensions.rda")

shinyUI(fluidPage(

  # Application title
  titlePanel("Model Display"),
  # Sidebar with a slider input for number of hours
  sidebarLayout(
    sidebarPanel(
      sliderInput("hours",
                  "Hours of work:",
                  min = 0,
                  max = 60,
                  value = 37),
      selectInput("agegrp_id", 
                  "Age group",
                  choices = d_agegrp,
                  selected = sample(d_agegrp, 1)),
      selectInput("occupation_id", 
                  "Current or most recent occupation",
                  choices = d_occupation,
                  selected = sample(d_occupation, 1))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tableOutput("Prediction")
    )
  )
))
