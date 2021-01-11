test_that("fullscreen_this throws an error if no ui_element", {
  expect_error(fullscreen_this())
})


test_that("fullscreen_this produces the right JS", {
  shiny::plotOutput("plot") %>%
    fullscreen_this() %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE) %>%
    expect_snapshot_output()
})

test_that("argument click_id works", {
  shiny::plotOutput("plot") %>%
    fullscreen_this(click_id = "other_id") %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE) %>%
    expect_snapshot_output()
})

test_that("argument bg_color works", {
  shiny::plotOutput("plot") %>%
    fullscreen_this(bg_color = "pink") %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE) %>%
    expect_snapshot_output()
})
