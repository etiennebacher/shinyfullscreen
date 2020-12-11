#' Enable fullscreen for a specific item
#'
#' @param ui_element A UI element that should be wrapped with a spinner when the corresponding output is being calculated.
#'
#' @export
#'
#' @examples
#' ### Only works in browser
#'
#' library(shiny)
#'
#' ui <- fluidPage(
#'   actionButton("test", "test"),
#'   plotOutput("plot") %>%
#'     fullscreen_this()
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$plot <- renderPlot(plot(mtcars))
#'
#' }
#'
#' shinyApp(ui, server, options = list(launch.browser = TRUE))
fullscreen_this <- function(ui_element) {

  ui_element <- ui_element
  id_element <- ui_element$attribs$id

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$script(
          src="shinyfullscreen-assets/screenfull/screenfull.min.js"
        )
      )
    ),
    ui_element,
    shiny::tags$script(
          paste0(
            "
            $(function () {
        			if (!screenfull.isEnabled) {
        				return false;
        			}

              const element = $('#", id_element, "');

        			element.click(function () {
        				screenfull.request(element[0]);
        			});
        		});"
          )
        )
      )

}
