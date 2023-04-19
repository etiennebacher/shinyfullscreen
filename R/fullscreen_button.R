#' Button that toggles fullscreen
#'
#' @param id Id of the button
#' @param label Label of the button
#' @param class Additional classes to give to the button
#' @param type Type of the button ("info", "danger", etc.)
#' @param target Id of the element to put on fullscreen. If `NULL`, the whole
#' page is put on fullscreen.
#'
#' @return Put an element or the whole page on fullscreen
#' @export
#'
#' @examples
#' if (interactive()) {
#' ### Only works in browser
#' library(shiny)
#'
#' ui <- fluidPage(
#'   fullscreen_button(id = "toggle_fs", "Enter/Quit fullscreen", target = "plot"),
#'   plotOutput("plot")
#' )
#'
#' server <- function(input, output){
#'
#'   output$plot <- renderPlot(plot(mtcars))
#'
#' }
#'
#' shinyApp(ui, server)
#' }

fullscreen_button <- function(
    id,
    label,
    class = NULL,
    type = "default",
    target = NULL
){

  target <- if (is.null(target)) "body" else paste0("#", target)

  # class
  cl <- sprintf("btn btn-%s", type)
  cl <- paste(cl, class)

  args <- list(class = cl, label, id = id)

  ui_element <- do.call(shiny::a, args)

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
        			if (screenfull.isEnabled) {
                $('#", id,"').click(function () {
          				screenfull.toggle($('", target, "')[0]);
          			});
        			}
        		});"
      )
    )
  )
}
