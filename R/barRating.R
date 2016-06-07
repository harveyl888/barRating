#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#' @import htmltools
#'
#' @export
barRating <- function(choices, selected = NULL, theme = "bars-1to10", reverse = FALSE, includeEmpty = FALSE, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    choices = choices,
    selected = selected,
    theme = theme,
    reverse = reverse,
    includeEmpty = includeEmpty
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'barRating',
    x,
    width = width,
    height = height,
    package = 'barRating',
    sizingPolicy = htmlwidgets::sizingPolicy(
      viewer.fill = FALSE
    )
  )
}


#' Update a barrating widget with a value
#'
#' @export
barRatingUpdate <- function(id, value, session=shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage(type = 'jsBarRatingUpdate', list(id=id, value=value))
}


#' Shiny bindings for barRating
#'
#' Output and render functions for using barRating within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a barRating
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name barRating-shiny
#'
#' @export
barRatingOutput <- function(outputId, width = "auto", height = "auto"){
  htmlwidgets::shinyWidgetOutput(outputId, 'barRating', width, height, package = 'barRating')
}

#' @rdname barRating-shiny
#' @export
renderBarRating <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, barRatingOutput, env, quoted = TRUE)
}
