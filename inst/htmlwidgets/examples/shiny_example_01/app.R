## Example

library(shiny)
library(barRating)

server <- function(input, output) {
  output$example1 <- renderBarRating(barRating('example'))
  output$txt1 <- renderPrint({input$shinydataout})
}

ui <- fluidPage(

  HTML('<select id="example">'),
  HTML('<option value="1">1</option>'),
  HTML('<option value="2">2</option>'),
  HTML('<option value="3">3</option>'),
  HTML('<option value="4">4</option>'),
  HTML('<option value="5">5</option>'),
  HTML('</select>'),
  barRatingOutput('example1'),
  verbatimTextOutput('txt1')
)

shinyApp(ui = ui, server = server)
