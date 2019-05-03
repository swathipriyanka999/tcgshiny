#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  model1 <- lm(day_of_week ~births , + day_of_week, data=tcgproject)
  model1pred <- reactive({
    birthsInput <- input$SliderBirths
    sampleinput <- input$Slidersample
    
    predict(model1,newdata = data.frame(births = birthsInput,
                                        day_of_week = sampleInput
    ))
  })
  
  births <- reactive({
    birthsInput <- input$SliderBirths
  })
  
  output$plot1 <- renderPlot(
    ggplot(tcgproject, aes(x=births, y= day_of_week))+
      geom_point(colour = "black") + 
      geom_segment(aes(xend = births, yend = 0), alpha =.01) + geom_hline(yintercept = 0)
    + geom_point(aes(x=births(),y=0),colours = "green")
    
  )
  
  output$pred1 <- renderText({
    model1pred()
  })
  
})


