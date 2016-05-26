## Example

library(shiny)
library(barRating)

server <- function(input, output) {
  output$ex1 <- renderBarRating(barRating(c('A', 'B', 'C')))
  output$txt1 <- renderPrint({input$ex1_value})
}

ui <- fluidPage(

  barRatingOutput('ex1'),
  verbatimTextOutput('txt1')
)

shinyApp(ui = ui, server = server)
