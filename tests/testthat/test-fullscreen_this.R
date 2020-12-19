test_that("fullscreen_this throws an error if no ui_element", {
  expect_error(fullscreen_this())
})


test_that("fullscreen_this produces the right JS", {
  x <- shiny::plotOutput("plot") %>%
    fullscreen_this() %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE)

  expect_equal(
    x,
    "<div id=\"plot\" class=\"shiny-plot-output\" style=\"width: 100% ; height: 400px\"></div><script> $(function () { if (!screenfull.isEnabled) { return false; } $('#plot').click(function () { screenfull.request($('#plot')[0]); }); });</script><style>#plot{ cursor: -webkit-zoom-in; cursor: -moz-zoom-in; } ::backdrop { background-color:#fff; }</style>"
  )

})

test_that("argument click_id works", {

  x <- shiny::plotOutput("plot") %>%
    fullscreen_this(click_id = "other_id") %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE)

  expect_equal(
    x,
    "<div id=\"plot\" class=\"shiny-plot-output\" style=\"width: 100% ; height: 400px\"></div><script> $(function () { if (!screenfull.isEnabled) { return false; } $('#other_id').click(function () { screenfull.request($('#plot')[0]); }); });</script><style>#plot{ cursor: -webkit-zoom-in; cursor: -moz-zoom-in; } ::backdrop { background-color:#fff; }</style>"
  )

})

test_that("argument bg_color works", {

  x <- shiny::plotOutput("plot") %>%
    fullscreen_this(bg_color = "pink") %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE)

  expect_equal(
    x,
    "<div id=\"plot\" class=\"shiny-plot-output\" style=\"width: 100% ; height: 400px\"></div><script> $(function () { if (!screenfull.isEnabled) { return false; } $('#plot').click(function () { screenfull.request($('#plot')[0]); }); });</script><style>#plot{ cursor: -webkit-zoom-in; cursor: -moz-zoom-in; } ::backdrop { background-color:pink; }</style>"
  )

})
