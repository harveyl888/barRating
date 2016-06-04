## Example

library(shiny)
library(barRating)

server <- function(input, output) {
  output$ex1 <- renderBarRating(barRating(choices = as.character(seq(5,0)), selected = '3', theme='bars-horizontal', includeEmpty = FALSE))
  output$txt1 <- renderPrint({input$ex1_value})
}

ui <- fluidPage(

  barRatingOutput('ex1'),
  verbatimTextOutput('txt1')
)

shinyApp(ui = ui, server = server)
