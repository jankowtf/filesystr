context("unlockRessource-1")
test_that("unlockRessource", {
  
  path <- file.path(tempdir(), "registry.rdata")
  path_0 <- path
  file.create(path)
  
  ## File //
  expect_false(unlockRessource(path = path))
  lockRessource(path = path)
  expect_true(file.exists(sprintf("%s_FILE_LOCK", path)))
  expect_true(unlockRessource(path = path))
  expect_false(file.exists(sprintf("%s_FILE_LOCK", path)))
  
  ## Directory //
  path <- dirname(path)
  expect_false(unlockRessource(path = path))
  lockRessource(path = path)
  expect_true(file.exists(sprintf("%s_DIR_LOCK", path)))
  expect_true(unlockRessource(path = path))
  expect_false(file.exists(sprintf("%s_DIR_LOCK", path)))
  
  ## Non-existing ressource //
  expect_error(unlockRessource(path = "abcd", strict = TRUE))
  
  on.exit(
    if (grepl(basename(tempdir()), path_0)) {
      unlink(path_0, recursive=TRUE, force=TRUE)
    }
  )
  
})
