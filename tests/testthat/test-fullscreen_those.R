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

  x <- fullscreen_those(items = list("plot")) %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE)

  expect_equal(
    x,
    "<script> var ids = [\"#plot\"]; $(ids.join(',')).click(function () { screenfull.request(this); });</script><style>#plot{ cursor: pointer; } ::backdrop { background-color:#fff; }</style>"
  )

})

test_that("fullscreen_those works with several items", {

  plot1 <- shiny::plotOutput("plot")
  plot2 <- shiny::plotOutput("plot2")

  x <- fullscreen_those(items = list("plot", "plot2")) %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE)

  expect_equal(
    x,
    "<script> var ids = [\"#plot\",\"#plot2\"]; $(ids.join(',')).click(function () { screenfull.request(this); });</script><style>#plot, #plot2{ cursor: pointer; } ::backdrop { background-color:#fff; }</style>"
  )

})
