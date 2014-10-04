context("asFilePath_A")
test_that("asFilePath", {

  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }
  
  path_0 <- file.path(tempdir(), "path/test.txt")
  
  ## character //
  expected <- "FilePath.S3"
  expect_is(res <- asFilePath(path = path_0), expected)
  
  ## FilePath.S3 //
  expect_is(res <- asFilePath(path = asFilePath(path_0)), expected)
  
  ## Ensure //
  expect_true(file.exists(asFilePath(path = path_0, ensure = TRUE)))
  .cleanTempDir(x = path_0)
  
  expect_true(file.exists(
    asFilePath(path = asFilePath(path_0), ensure = TRUE)
  ))
  .cleanTempDir(x = path_0)
  
  on.exit(.cleanTempDir(x = path_0))
  
  }
)

context("asFilePath_B")
test_that("strictness", {
 
  path_0 <- file.path(tempdir(), "path/test.txt")
  
  ## character //
  expected <- "FilePath.S3"
  expect_error(res <- asFilePath(path = path_0, strict = TRUE))
  expect_error(res <- asFilePath(path = tempdir(), strict = TRUE))
  expect_is(res <- asFilePath(path = path_0, ensure = TRUE, strict = TRUE),
            expected)
  conditionalDelete(path_0, condition = tempdir())
  
  ## FilePath.S3 //
  expect_error(res <- asFilePath(path = asFilePath(path_0), strict = TRUE))
  expect_is(res <- asFilePath(path = asFilePath(path_0), ensure = TRUE,
                              strict = TRUE), expected)
  
  on.exit(conditionalDelete(path = path_0, condition = tempdir()))
  
  }
)
