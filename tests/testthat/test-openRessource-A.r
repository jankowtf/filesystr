context("openRessource_A")
test_that("openRessource", {

  ## Directory //
  expect_true(res <- openRessource(path = tempdir()))
  
  ## Relative path //
  expect_false(res <- openRessource(path = "does-not-exist"))
  expect_true(res <- openRessource(path = "R"))
  
  ## File //
  path <- file.path(tempdir(), "test.txt")
  file.create(path)
  expect_true(res <- openRessource(path = path))
  
  ## Non-existing ressource //
  expect_false(res <- openRessource(path = "abdce"))
  expect_error(res <- openRessource(path = "abdce", strict = TRUE))
  
  }
)

