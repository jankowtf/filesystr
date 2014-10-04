context("asDirectoryPath_A")
test_that("asDirectoryPath", {

  path_0  <- file.path(tempdir(), "path")
  
  ## character //
  expected <- "DirectoryPath.S3"
  expect_is(res <- asDirectoryPath(path = path_0), expected)
  
  ## DirectoryPath.S3 //
  expect_is(res <- asDirectoryPath(path = asDirectoryPath(path_0)), expected)
  
  ## Ensure //
  expect_true(file.exists(asDirectoryPath(path = path_0, ensure = TRUE)))
  conditionalDelete(path = path_0, condition = basename(tempdir()))
  
  expect_true(file.exists(
    asDirectoryPath(path = asDirectoryPath(path_0), ensure = TRUE)
  ))

  on.exit(conditionalDelete(path = path_0, condition = basename(tempdir())))
  
  }
)

context("asDirectoryPath_B")
test_that("strict", {

  path_0  <- file.path(tempdir(), "path")
  
  ## character //
  expect_error(asDirectoryPath(path = path_0, strict = TRUE))
  expect_error(asDirectoryPath(path = tempfile(), strict = TRUE))
  
  ## DirectoryPath.S3 //
  expect_error(asDirectoryPath(path = asDirectoryPath(path_0), strict = TRUE))
  
  ## Ensure //
  expect_true(file.exists(asDirectoryPath(path = path_0, 
    ensure = TRUE, strict = TRUE)))
  
  on.exit(conditionalDelete(path = path_0, condition = basename(tempdir())))
  
  }
)
