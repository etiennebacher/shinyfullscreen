% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fullscreen_button.R
\name{fullscreen_button}
\alias{fullscreen_button}
\title{Button that toggles fullscreen}
\usage{
fullscreen_button(
  id,
  label,
  class = NULL,
  type = "default",
  target = NULL,
  icon = NULL
)
}
\arguments{
\item{id}{Id of the button}

\item{label}{Label of the button}

\item{class}{Additional classes to give to the button}

\item{type}{Type of the button ("info", "danger", etc.)}

\item{target}{Id of the element to put on fullscreen. If \code{NULL}, the whole
page is put on fullscreen.}

\item{icon}{Icon to add before the label on the button}
}
\value{
Put an element or the whole page on fullscreen
}
\description{
Button that toggles fullscreen
}
\examples{
if (interactive()) {
### Only works in browser
library(shiny)

ui <- fluidPage(
  fullscreen_button(id = "toggle_fs", "Enter/Quit fullscreen", target = "plot"),
  plotOutput("plot")
)

server <- function(input, output){

  output$plot <- renderPlot(plot(mtcars))

}

shinyApp(ui, server)
}
}
