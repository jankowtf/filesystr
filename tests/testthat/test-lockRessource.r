context("lockRessource-1")
test_that("lockRessource", {
  
  path <- file.path(tempdir(), "registry.rdata")
  path_0 <- path
  file.create(path)
  
  ## File //
  expect_true(res <- lockRessource(path = path))
  expect_true(file.exists(sprintf("%s_FILE_LOCK", path)))
  expect_false(lockRessource(path = path))
  expect_true(unlockRessource(path = path))
  
  ## Directory //
  path <- dirname(path)
  expect_true(res <- lockRessource(path = path))
  expect_true(file.exists(sprintf("%s_DIR_LOCK", path)))
  expect_false(lockRessource(path = path))
  expect_true(unlockRessource(path = path))
  
  ## Non-existing ressource //
  expect_error(lockRessource(path = "abcd", strict = TRUE))
  
  on.exit(
    if (grepl(basename(tempdir()), path_0)) {
      unlink(path_0, recursive=TRUE, force=TRUE)
    }
  )
  
}
)
