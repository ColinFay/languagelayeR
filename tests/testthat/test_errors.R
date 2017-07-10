context("Error message")

test_that("API error message are thrown", {
  expect_warning(get_supported_lang(), "You need to enter you API key first. Please use the setApiKey function.")
  expect_error(get_lang())
  expect_warning(get_lang("This is a test"))
})
