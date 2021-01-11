test_that("fullscreen_those creates nothing if no item", {

  x <- fullscreen_those(items = list()) %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE)

  expect_equal(length(x), 0)

})

test_that("fullscreen_those works with 1 item", {

  plot1 <- shiny::plotOutput("plot")

  fullscreen_those(items = list("plot")) %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE) %>%
    expect_snapshot_output()

})

test_that("fullscreen_those works with several items", {

  plot1 <- shiny::plotOutput("plot")
  plot2 <- shiny::plotOutput("plot2")

  fullscreen_those(items = list("plot", "plot2")) %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE) %>%
    expect_snapshot_output()

})
