#' Enable fullscreen for the whole page
#'
#' @param click_id Id of the item that triggers the fullscreen view. This is a mandatory argument. You can specify the id of a button for instance, so that clicking on this button triggers the fullscreen view for the whole page.
#' @param bg_color Background color when item is displayed fullscreen. Default is white.
#'
#' @return Enables the whole page to be displayed in fullscreen mode.
#' @export
#'
#' @examples
#' if (interactive()) {
#' ### Only works in browser
#'
#' library(shiny)
#'
#' ui <- fluidPage(
#'   actionButton("test", "test"),
#'   plotOutput("plot"),
#'   fullscreen_all(click_id = "test")
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

fullscreen_all <- function(click_id = NULL, bg_color = "#fff") {

  if (missing(click_id)) {
    stop("Must specify a click_id to put the whole page on fullscreen")
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
            $(function () {
        			if (!screenfull.isEnabled) {
        				return false;
        			}

              $('#", click_id,"').click(function () {
        				screenfull.request();
        			});
        		});"
      )
    ),
    shiny::tags$style(
      paste0(
        "::backdrop {
            background-color:", bg_color, ";
        }"
      )
    )
  )

}
