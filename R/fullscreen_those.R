#' Enable fullscreen for a list of items
#'
#' @param items A list containing the ids of the items for which fullscreen is enabled.
#' @param bg_color Background color when item is displayed full screen. Default is white.
#'
#' @details This function has to be placed AFTER the call of inputs. See Examples.
#' @return Enables the selected elements to be displayed in fullscreen mode.
#' @export
#' @examples
#' if (interactive()) {
#' ### Only works in browser
#'
#' library(shiny)
#' library(shinyfullscreen)
#'
#' ui <- fluidPage(
#'   plotOutput("plot"),
#'   plotOutput("plot2"),
#'
#'   # Has to be placed after plot and plot2
#'   fullscreen_those(items = list("plot", "plot2"))
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$plot <- renderPlot(plot(mtcars))
#'   output$plot2 <- renderPlot(plot(AirPassengers))
#'
#' }
#'
#' shinyApp(ui, server, options = list(launch.browser = TRUE))
#' }
fullscreen_those <- function(items = list(), bg_color = "#fff"){

  ids <- unlist(
    lapply(items, function(x) {
      paste0("#", x)
    })
  )

  if (!is.null(ids)) {

    ids_for_JS <- jsonlite::toJSON(ids)

    if (length(ids) > 1) {
      ids_for_CSS <- paste(ids, collapse = ", ")
    } else {
      ids_for_CSS <- paste(ids)
    }


    shiny::tagList(
      shiny::singleton(
        shiny::tags$head(
          shiny::tags$script(
            src="shinyfullscreen-assets/screenfull/screenfull.min.js"
          )
        )
      ),
      shiny::tags$script(
        paste0(
          "
        var ids = ", ids_for_JS, ";
        $(ids.join(',')).click(function () {
          screenfull.request(this);
        });"
        )
      ),
      shiny::tags$style(
        paste0(
          ids_for_CSS, "{
    			cursor: -webkit-zoom-in;
    			cursor: -moz-zoom-in;
    		}
        ::backdrop {
            background-color:", bg_color, ";
        }"
        )
      )
    )

  }

}
