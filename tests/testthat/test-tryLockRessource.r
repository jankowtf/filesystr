context("tryLockRessource-1")
test_that("tryLockRessource", {
  
  path <- file.path(tempdir(), "test/registry.rdata")
  dir.create(dirname(path), showWarnings=FALSE)
  path_0 <- path
  file.create(path)
  
  ## File //
  lockRessource(path = path)
  expect_false(res <- tryLockRessource(path = path, try_limit = 1))
  expect_error(res <- tryLockRessource(path = path, try_limit = 1, strict = TRUE))
  unlockRessource(path = path)
  expect_true(tryLockRessource(path = path))
  unlockRessource(path = path)
  
  ## Directory //
  path <- dirname(path)
  lockRessource(path = path)
  expect_false(res <- tryLockRessource(path = path, try_limit = 1))
  expect_error(res <- tryLockRessource(path = path, try_limit = 1, strict = TRUE))
  unlockRessource(path = path)
  expect_true(tryLockRessource(path = path))
  unlockRessource(path = path)
  
  ## Non-existing ressource //
  expect_error(tryLockRessource(path = "abcd", strict = TRUE))
  
  on.exit(
    if (grepl(basename(tempdir()), path_0)) {
      unlink(path_0, recursive=TRUE, force=TRUE)
    }
  )
  
}
)
