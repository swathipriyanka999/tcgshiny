#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("residual Plot"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("Sliderday_of_week","weeks",1,7, value = 1),
      sliderInput("SliderBirths","number of births", 0,15000, value = 100),
      checkboxInput("showModel1", "show/Hide Model1", value = TRUE)
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot1"),
      h3("predicted apporval percentage from model 1 :"),
      textOutput("pred1")
    )
  )
))