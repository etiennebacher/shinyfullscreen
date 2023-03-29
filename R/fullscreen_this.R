#' Enable fullscreen for a specific item
#'
#' @param ui_element A UI element that should be displayed fullscreen.
#' @param bg_color Background color when item is displayed fullscreen. Default is white.
#' @param click_id Id of the item that triggers the fullscreen view. By default, it is the id of `ui_element`, i.e clicking on the element shows it on fullscreen. You can specify the id of a button for instance, so that clicking on this button triggers the fullscreen view of `ui_element`.
#' @param cursor Display a special "zoom-in" cursor when hovering the element?
#' Default is `TRUE`.
#'
#' @return Enables the selected element to be displayed in fullscreen mode.
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
#'   fullscreen_this(plotOutput("plot"))
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

fullscreen_this <- function(ui_element, click_id = NULL, bg_color = "#fff",
                            cursor = TRUE) {

  ui_element <- ui_element
  id_element <- ui_element$attribs$id

  # some ui_elements can be list but their organization is a bit different
  # e.g echarts4rOutput("plot")
  if (is.null(id_element) && "list" %in% class(ui_element)) {
    id_element <- unlist(ui_element)["attribs.id"]
  }

  if (missing(click_id)) {
    click_id <- id_element
  }

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

              $('#", click_id,"').click(function () {
        				screenfull.request($('#", id_element, "')[0]);
        			});
        		});"
          )
        ),
    if(isTRUE(cursor)){
      shiny::tags$style(
        paste0(
          "#", id_element, "{
      			cursor: -webkit-zoom-in;
      			cursor: -moz-zoom-in;
      		}"
        )
      )
    },
    shiny::tags$style(
      '::backdrop {
          background-color:", bg_color, ";
       }'
    )
  )

}
