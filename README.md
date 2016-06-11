# barRating
An R htmlwidget wrapper for jquery bar rating.

The jquery bar rating is a lightweight rating widget which can be styled using css themes.  The javascript library can be found at https://github.com/antennaio/jquery-bar-rating and examples can be found at http://antenna.io/demo/jquery-bar-rating/examples/.


This htmlwidget allows bar ratings to be used in shiny apps.

## Install

```r
library(devtools)
devtools::install_github("harveyl888/barRating")
```

## Usage
```r
library(barRating)
barRating(choices = c(1,2,3,4,5)
```

barRating can take a number of arguments:
-   `choices`: Vector of values to select from.
-   `theme`: Name of a theme (themes are contained in barrating_themes.css).
-   `initialRating`: Specify initial rating by passing select field's option value.
-   `showValues`: If set to true, rating values will be displayed on the bars.
-   `showSelectedRating`: If set to true, user selected rating will be displayed next to the widget.
-   `deselectable`: If set to true, user can deselect a rating. For this feature to work the select field must contain a first option with an empty value.
-   `reverse`: If set to true, the ratings will be reversed.
-   `readonly`: If set to true, the ratings will be read-only.
-   `fastClicks`: Remove 300ms click delay on touch devices.
-   `hoverState`: Change state on hover.
-   `silent`: Supress callbacks when controlling ratings programatically.
-   `selected`: Specify initial rating.
-   `includeEmpty`: Include an empty rating.
Further information on these parameters can be found at http://antenna.io/demo/jquery-bar-rating/examples/.

If the widget is used in a shiny app, the selected value is exposed as `input$id_select`.

In addition, the htmlwidget exposes several methods which can be called as follows:

-   `barRatingUpdate(id, value, session)` : Update value of widget id.
-   `barRatingClear(id, session)` : Clear a widget by reseting to initialRating if one has been specified or lowest value which can be an empty value if includeEmpty is true.
-   `barRatingReadonly(id, state, session)` : Change readonly state of widget (state = true or false).

A shiny example, highlighting some of the features, can be found under ./inst/htmlwidgets/examples/shiny_example_01/
