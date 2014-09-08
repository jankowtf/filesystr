context("package")

test_that("asDirectory", {

  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }
  
  path_0  <- file.path(tempdir(), "path")
  
  ## character //
  expected <- "RappFilesystemDirectoryS3"
  expect_is(res <- asDirectory(path = path_0), expected)
  
  ## RappFilesystemDirectoryS3 //
  expect_is(res <- asDirectory(path = asDirectory(path_0)), expected)
  
  ## Ensure //
  expect_true(file.exists(asDirectory(path = path_0, ensure = TRUE)))
  .cleanTempDir(x = path_0)
  
  expect_true(file.exists(
    asDirectory(path = asDirectory(path_0), ensure = TRUE)
  ))
  .cleanTempDir(x = path_0)
  
  on.exit(.cleanTempDir(x = path_0))
  
  }
)

