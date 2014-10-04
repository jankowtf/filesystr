context("DirectoryCopyResult.S3_A")
test_that("DirectoryCopyResult.S3", {

  expect_is(DirectoryCopyResult.S3(), "DirectoryCopyResult.S3")
  expect_is(DirectoryCopyResult.S3(status = 1), "DirectoryCopyResult.S3")
  expect_is(res <- DirectoryCopyResult.S3(TRUE), "DirectoryCopyResult.S3")
  expect_true(res)
  expect_is(DirectoryCopyResult.S3(.x = TRUE), "DirectoryCopyResult.S3")
  
  }
)

