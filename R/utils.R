.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    prefix = "shinyfullscreen-assets",
    directoryPath = system.file("assets", package = "shinyfullscreen"))
}
