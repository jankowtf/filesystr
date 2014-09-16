context("isRessourceLocked-1")

test_that("isRessourceLocked", {
  
  path <- file.path(tempdir(), "registry.rdata")
  file.create(path)
  
  expect_false(isRessourceLocked(path = path))
  lockRessource(path = path)
  expect_true(isRessourceLocked(path = path))
  unlockRessource(path = path)
  
  on.exit(
    if (grepl(basename(tempdir()), path)) {
      unlink(path, recursive=TRUE, force=TRUE)
      unlink(sprintf("%s_LOCK", path), recursive=TRUE, force=TRUE)
    }
  )
  
})
