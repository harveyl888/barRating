## Example

library(shiny)
library(barRating)

server <- function(input, output) {
  output$ex1 <- renderBarRating(barRating(seq(0,5), 3))
  output$txt1 <- renderPrint({input$ex1_value})
}

ui <- fluidPage(

  barRatingOutput('ex1'),
  verbatimTextOutput('txt1')
)

shinyApp(ui = ui, server = server)
