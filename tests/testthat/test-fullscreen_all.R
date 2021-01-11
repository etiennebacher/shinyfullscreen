test_that("fullscreen_all needs a click_id argument", {
  expect_error(fullscreen_all())
})

test_that("fullscreen_all produces the right JS", {
  shiny::actionButton("click", "Click") %>%
    fullscreen_all() %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE) %>%
    expect_snapshot_output()
})

test_that("argument bg_color works", {

  shiny::actionButton("click", "Click") %>%
    fullscreen_all(bg_color = "pink") %>%
    paste() %>%
    gsub("\\t", "", .) %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE) %>%
    expect_snapshot_output()
})
