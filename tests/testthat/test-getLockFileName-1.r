context("getLockFileName_1")
test_that("getLockFileName", {

  path <- file.path(tempdir(), "path/test.txt")
  expected <- paste0(basename(path), "_LOCK")
  expect_equal(res <- getLockFileName(path = path), expected)
  
  path <- tempdir()
  expected <- paste0(basename(path), "_DIR_LOCK")
  expect_equal(res <- getLockFileName(path = path), expected)
  
  path <- file.path(tempdir(), "test.txt")
  file.create(path)
  expected <- paste0(basename(path), "_FILE_LOCK")
  expect_equal(res <- getLockFileName(path = path), expected)
  
  }
)

