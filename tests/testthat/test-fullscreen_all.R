test_that("fullscreen_all needs a click_id argument", {
  expect_error(fullscreen_all())
})

test_that("fullscreen_all produces the right JS", {
  x <- shiny::actionButton("click", "Click")

  y <- x %>%
    fullscreen_all() %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE)

  expect_equal(
    y,
    "<script> $(function () { if (!screenfull.isEnabled) { return false; } $('#&lt;button id=\"click\" type=\"button\" class=\"btn btn-default action-button\"&gt;Click&lt;/button&gt;').click(function () { screenfull.request(); }); });</script><style>::backdrop { background-color:#fff; }</style>"
  )

})

test_that("argument bg_color works", {
  x <- shiny::actionButton("click", "Click")

  y <- x %>%
    fullscreen_all(bg_color = "pink") %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE)

  expect_equal(
    y,
    "<script> $(function () { if (!screenfull.isEnabled) { return false; } $('#&lt;button id=\"click\" type=\"button\" class=\"btn btn-default action-button\"&gt;Click&lt;/button&gt;').click(function () { screenfull.request(); }); });</script><style>::backdrop { background-color:pink; }</style>"
  )

})
