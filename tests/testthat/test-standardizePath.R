test_that(desc="test_standardizePath", code={
  
  path <- c(".", "..", "~", R.home(), tempdir(), NA)
  
  expect_equal(
    standardizePath(path = path),
    c(
      normalizePath(".", winslash = "/", mustWork = FALSE),
      normalizePath("..", winslash = "/", mustWork = FALSE),
      normalizePath("~", winslash = "/", mustWork = FALSE),
      normalizePath(R.home(), winslash = "/"),
      normalizePath(tempdir(), winslash="/", mustWork = FALSE),
      NA   
    )
  )
  expect_equal(standardizePath("."), normalizePath(".", winslash = "/"))
  expect_equal(standardizePath(".", sep = "\\"),
               normalizePath("."))

  expect_equal(standardizePath(), normalizePath(".", winslash = "/"))
  
  expect_equal(
    standardizePath(path = character()),
    character()
  )
  
#   expect_equal(
#     standardizePath(),
#     c(
#       file.path(
#         normalizePath(path.expand("."), winslash="/", mustWork=FALSE),
#         list.files(".")
#       )
#     )
#   )
  
}
)
