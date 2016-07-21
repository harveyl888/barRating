## Example

library(shiny)
library(barRating)

server <- function(input, output, session) {

  output$bar1 <- renderBarRating(barRating(choices = as.character(seq(1:10)),
                                           theme = 'bars-1to10',
                                           selected = '7',
                                           includeEmpty = TRUE,
                                           showSelectedRating = TRUE))

  output$bar2 <- renderBarRating(barRating(choices = c('Bad', 'Mediocre', 'Good', 'Awesome'),
                                           theme = 'bars-movie',
                                           selected = 'Good'))

  output$bar3 <- renderBarRating(barRating(choices = as.character(seq(1:5)),
                                           theme = 'bars-square',
                                           selected = '4',
                                           showValues = TRUE,
                                           showSelectedRating = FALSE))

  output$bar4 <- renderBarRating(barRating(choices = LETTERS[1:5],
                                           theme = 'bars-pill',
                                           selected = 'C',
                                           showValues = TRUE,
                                           showSelectedRating = FALSE))

  output$bar5 <- renderBarRating(barRating(choices = c('Strongly Agree', 'Agree', 'Neither Agree or Disagree', 'Disagree', 'Strongly Disagree'),
                                           theme = 'bars-reversed',
                                           selected = 'Disagree',
                                           reverse = TRUE,
                                           showValues = FALSE,
                                           showSelectedRating = TRUE))

  output$bar6 <- renderBarRating(barRating(choices = as.character(seq(5,0)),
                                         selected = '3',
                                         reverse = TRUE,
                                         theme = 'bars-horizontal',
                                         showSelectedRating = TRUE))

  output$txt <- renderText({
    paste0('bar 1 = ', input$bar1_value, '\n',
           'bar 2 = ', input$bar2_value, '\n',
           'bar 3 = ', input$bar3_value, '\n',
           'bar 4 = ', input$bar4_value, '\n',
           'bar 5 = ', input$bar5_value, '\n',
           'bar 6 = ', input$bar6_value, '\n')
  })

  observeEvent(input$butChangeValue, {
    barRatingUpdate('bar1', 5, session)
  })

  observeEvent(input$butClear, {
    barRatingClear('bar1', session)
  })

  observe({
    barRatingReadOnly('bar1', input$chkReadOnly, session)
  })

}

ui <- fluidPage(
  h1('barRating widget'),
  h4('For further information check out ',
     a("http://antenna.io/demo/jquery-bar-rating/examples/", href="http://antenna.io/demo/jquery-bar-rating/examples/", target="_blank"), ' and ',
     a("http://github.com/antennaio/jquery-bar-rating", href="http://github.com/antennaio/jquery-bar-rating", target="_blank")),
  hr(),
  fluidRow(
    column(4, barRatingOutput('bar1')),
    column(4, barRatingOutput('bar2')),
    column(4, barRatingOutput('bar3'))
  ),
  br(),
  fluidRow(
    column(4, barRatingOutput('bar4')),
    column(4, barRatingOutput('bar5')),
    column(4, barRatingOutput('bar6'))
  ),
  br(),
  fluidRow(
    column(3,
           actionButton('butChangeValue', 'set value to 5'),
           actionButton('butClear', 'clear the value'),
           checkboxInput('chkReadOnly', 'read only state', value = FALSE)
    ),
    column(3,
           verbatimTextOutput('txt')
    )
  )
)

shinyApp(ui = ui, server = server)
