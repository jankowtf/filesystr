context("asDirectoryPath_1")
test_that("asDirectoryPath", {

  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }
  
  path_0  <- file.path(tempdir(), "path")
  
  ## character //
  expected <- "Directory.S3"
  expect_is(res <- asDirectoryPath(path = path_0), expected)
  
  ## Directory.S3 //
  expect_is(res <- asDirectoryPath(path = asDirectoryPath(path_0)), expected)
  
  ## Ensure //
  expect_true(file.exists(asDirectoryPath(path = path_0, ensure = TRUE)))
  .cleanTempDir(x = path_0)
  
  expect_true(file.exists(
    asDirectoryPath(path = asDirectoryPath(path_0), ensure = TRUE)
  ))
  .cleanTempDir(x = path_0)
  
  on.exit(.cleanTempDir(x = path_0))
  
  }
)

