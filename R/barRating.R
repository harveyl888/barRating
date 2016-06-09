#' jQuery Bar Rating
#'
#' create a barRating htmlwidget
#'
#' @param choices Vector of values to select from.
#' @param initialRating Specify initial rating by passing select field's option value.
#' @param showValues If set to true, rating values will be displayed on the bars.
#' @param showSelectedRating If set to true, user selected rating will be displayed next to the widget.
#' @param deselectable If set to true, user can deselect a rating. For this feature to work the select field must contain a first option with an empty value.
#' @param reverse If set to true, the ratings will be reversed.
#' @param readonly If set to true, the ratings will be read-only.
#' @param fastClicks Remove 300ms click delay on touch devices.
#' @param hoverState Change state on hover.
#' @param silent Supress callbacks when controlling ratings programatically.
#' @param selected Specify initial rating.
#' @param includeEmpty Include an empty rating.
#'
#' @import htmlwidgets
#' @import htmltools
#'
#' @export
barRating <- function(choices,
                      theme = "bars-1to10",
                      initialRating = NULL,
                      showValues = FALSE,
                      showSelectedRating = TRUE,
                      deselectable = TRUE,
                      reverse = FALSE,
                      readonly = FALSE,
                      fastClicks = TRUE,
                      hoverState = TRUE,
                      silent = FALSE,
                      selected = NULL,
                      includeEmpty = FALSE) {

  # forward options using x
  x = list(
    choices = choices,
    selected = selected,
    theme = theme,
    initialRating = initialRating,
    showValues = showValues,
    showSelectedRating = showSelectedRating,
    deselectable = deselectable,
    reverse = reverse,
    readonly = readonly,
    fastClicks = fastClicks,
    hoverState = hoverState,
    silent = silent,
    includeEmpty = includeEmpty
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'barRating',
    x,
    width = NULL,
    height = NULL,
    package = 'barRating',
    sizingPolicy = htmlwidgets::sizingPolicy(
      viewer.fill = FALSE
    )
  )
}


#' Update barRating widget
#'
#' Update a barRating widget with a value
#'
#' @param id id of the widget
#' @param value new rating value
#' @param shiny session
#'
#' @export
barRatingUpdate <- function(id, value, session=shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage(type = 'jsBarRatingUpdate', list(id=id, value=value))
}

#' Clear barRating widget
#'
#' Clear a barRating widget
#'
#' @param id id of the widget
#' @param shiny session
#'
#' @export
barRatingClear <- function(id, session=shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage(type = 'jsBarRatingClear', list(id=id))
}

#' Set barRating read-only status
#'
#' Set barRating read-only status
#'
#' @param id id of the widget
#' @param state logical.  True = set widget to read-only; false = set widget to read/write.
#' @param shiny session
#'
#' @export
barRatingReadOnly <- function(id, state, session=shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage(type = 'jsBarRatingReadOnly', list(id=id, state=state))
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
