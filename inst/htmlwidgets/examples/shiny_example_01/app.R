## Example

library(shiny)
library(barRating)

server <- function(input, output, session) {
  output$ex1 <- renderBarRating(barRating(choices = as.character(seq(5,0)), selected = '3', theme='bars-horizontal', reverse = TRUE, includeEmpty = FALSE))
  output$txt1 <- renderPrint({input$ex1_value})

  observeEvent(input$butChangeValue, {
    barRatingUpdate('ex1', 1, session)
  })

}

ui <- fluidPage(

  selectInput('select1', 'select input', choices=paste('select',seq(1:5))),
  selectizeInput('select2', 'selectize input', choices=paste('select',seq(1:5))),
  barRatingOutput('ex1'),
  verbatimTextOutput('txt1'),
  actionButton('butChangeValue', 'set value to 1')
)

shinyApp(ui = ui, server = server)
