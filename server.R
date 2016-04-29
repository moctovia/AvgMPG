
library(UsingR)
data("mtcars")
library(shiny)
library(ggplot2)
library(dplyr)
library(devtools)
library(shinyapps)


calcAvgMPG<-function(cylinder) (mean(mtcars[mtcars$cyl==cylinder,]$mpg))


shinyServer(function(input, output) {
  
  #print inputs
  output$inputValue<-renderPrint({input$cylinder})
  output$avgmpg<-renderPrint({calcAvgMPG(input$cylinder)})
  #create output labelled newHist
  output$newPlot <-renderPlot({
    ds <- plyr::ddply(mtcars, "cyl", plyr::summarise, mean = mean(mpg))
    ggplot(data = mtcars, aes(x = mtcars$cyl, y = mtcars$mpg)) + geom_point() +
      geom_point(data = ds, aes(x = cyl,y = mean),
                 colour = 'red', size = 3) + 
      labs(title = "Plot of mpg by cylinder from mtcars", x = "cylinder", y = "mpg")
  })

})
