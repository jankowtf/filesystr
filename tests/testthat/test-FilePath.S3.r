context("FilePath.S3_A")
test_that("FilePath.S3", {

  expect_is(FilePath.S3(), "FilePath.S3")
  expect_is(FilePath.S3(path = tempfile()), "FilePath.S3")
  expect_is(res <- FilePath.S3(tempfile()), "FilePath.S3")
  file.create(res)
  expect_true(file.exists(res))
  expect_is(FilePath.S3(.x = tempfile()), "FilePath.S3")
  
  }
)

