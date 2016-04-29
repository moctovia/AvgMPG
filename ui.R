library(shiny)
shinyUI(fluidPage(
  headerPanel("Calculate the average mpg of cars in the mtcars data set by their cylinders"),
  sidebarLayout(
  sidebarPanel(
    #numericInput('cylinder','Input car cylinder value',4,min=4,max=8,step = 2)
    selectInput("cylinder", label = h3("Select car cylinder value"), 
                choices = list("4" = 4, "6" = 6, "8" = 8), 
                selected = 1),
    h4('Documentation: '),
    h4('1. Select the cylinder from the drop down to calculate its average MPG. 
        Your selected input will be shown under "You entered:".'),
    h4('2. The average MPG of all cars with the selected cylinder value will be shown under
       "Average mpg of cars with input cylinder:".'),
    h4('3. The plot shows the cars with their corresponding mpg. The red point shows the average mpg by cylinder')
    
  ),
  mainPanel(
    h4('You entered:'),
    verbatimTextOutput("inputValue"),
    h4('Average mpg of cars with input cylinder:'),
    verbatimTextOutput("avgmpg"),
    #newPlot is the label for my output plot
    plotOutput('newPlot')
    
  )
)))
