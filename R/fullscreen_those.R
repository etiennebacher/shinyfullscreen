#' Enable fullscreen for a list of items
#'
#' @param items A list containing the ids of the items for which fullscreen is enabled.
#' @param bg_color Background color when item is displayed full screen. Default is white.
#'
#' @details This function has to be placed AFTER the call of inputs. See Examples.
#' @export
#' @examples
#' if (interactive) {
#' ### Only works in browser
#'
#' library(shiny)
#'
#' ui <- fluidPage(
#'   actionButton("test", "test"),
#'   plotOutput("plot"),
#'   fullscreen_those(c("test", "plot")) #' HAS TO BE PLACED AFTER THE INPUTS
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$plot <- renderPlot(plot(mtcars))
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

  ids_for_JS <- ids %>%
    jsonlite::toJSON()

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
        paste(ids, collapse = " "), "{
    			cursor: pointer;
    		}
        ::backdrop {
            background-color:", bg_color, ";
        }"
      )
    )
  )

}
