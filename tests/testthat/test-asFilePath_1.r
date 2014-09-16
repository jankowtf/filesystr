context("asFilePath_1")
test_that("asFilePath", {

  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }
  
  path_0 <- file.path(tempdir(), "path/test.txt")
  
  ## character //
  expected <- "RappFilesystemFileS3"
  expect_is(res <- asFilePath(path = path_0), expected)
  
  ## RappFilesystemFileS3 //
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

