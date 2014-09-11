context("standardizePath_1")
test_that(desc="test_standardizePath", code={
  
  path <- c(".", "..", "~", R.home(), tempdir(), "nonex", "nonex/", 
            "nonex/file.txt", "nonex/file.txt/", "", NA)
  
  expect_equal(
    res <- standardizePath(path = path),
    c(
      normalizePath(".", winslash = "/", mustWork = FALSE),
      normalizePath("..", winslash = "/", mustWork = FALSE),
      normalizePath("~", winslash = "/", mustWork = FALSE),
      normalizePath(R.home(), winslash = "/"),
      normalizePath(tempdir(), winslash="/", mustWork = FALSE),
      normalizePath("nonex", winslash="/", mustWork = FALSE),
      normalizePath("nonex", winslash="/", mustWork = FALSE),
      normalizePath("nonex/file.txt", winslash="/", mustWork = FALSE),
      normalizePath("nonex/file.txt", winslash="/", mustWork = FALSE),
      "",
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
  
  path <- c("test")
  expect_equal(
    res <- standardizePath(path = path),
    c(
      normalizePath("test", winslash = "/", mustWork = FALSE)
    )
  )
  
  path <- c("test", "")
  expect_equal(
    res <- standardizePath(path = path),
    c(
      normalizePath("test", winslash = "/", mustWork = FALSE),
      ""
    )
  )
  
  path <- c(".", "./dir", "..", "../dir", "~", "~/file.txt", R.home(), 
            tempdir(), "nonex", "nonex/", "nonex/file.txt", 
            "nonex/file.txt/", "", NA)
  expected <- path
  expected[c(2,4)] <- c("dir", "../dir")
  expected[c(7,8)] <- normalizePath(expected[c(7,8)], winslash = "/")

  expected <- gsub("/$", "", expected)
  expect_equal(
    res <- standardizePath(path = path, shortform = TRUE),
    expected
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
