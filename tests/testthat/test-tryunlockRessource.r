context("tryUnlockRessource-1")
test_that("tryUnlockRessource", {
  
  path <- file.path(tempdir(), "test/registry.rdata")
  dir.create(dirname(path), showWarnings=FALSE)
  path_0 <- path
  file.create(path)
  
  ## File //
  expect_false(res <- tryUnlockRessource(path = path, try_limit = 1))
  expect_error(res <- tryUnlockRessource(path = path, try_limit = 1, strict = TRUE))
  lockRessource(path = path)
  expect_true(tryUnlockRessource(path = path))
  
  ## Directory //
  path <- dirname(path)
  expect_false(res <- tryUnlockRessource(path = path, try_limit = 1))
  expect_error(res <- tryUnlockRessource(path = path, try_limit = 1, strict = TRUE))
  lockRessource(path = path)
  expect_true(tryUnlockRessource(path = path))
  
  ## Non-existing ressource //
  expect_error(tryUnlockRessource(path = "abcd", strict = TRUE))
  
  on.exit(
    if (grepl(basename(tempdir()), path_0)) {
      unlink(path_0, recursive=TRUE, force=TRUE)
    }
  )
  
}
)
