context("DirectoryPath.S3_A")
test_that("DirectoryPath.S3", {

  expect_is(DirectoryPath.S3(), "DirectoryPath.S3")
  expect_is(DirectoryPath.S3(path = tempdir()), "DirectoryPath.S3")
  expect_is(res <- DirectoryPath.S3(tempdir()), "DirectoryPath.S3")
  expect_true(file.exists(res))
  expect_is(DirectoryPath.S3(.x = tempdir()), "DirectoryPath.S3")
  
  }
)

