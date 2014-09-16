context("openRessource_1")
test_that("openRessource", {

  ## Directory //
  expect_true(res <- openRessource(path = tempdir()))
  
  ## File //
  path <- file.path(tempdir(), "test.txt")
  file.create(path)
  expect_true(res <- openRessource(path = path))
  
  ## Non-existing ressource //
  expect_false(res <- openRessource(path = "abdce"))
  expect_error(res <- openRessource(path = "abdce", strict = TRUE))
  
  }
)

