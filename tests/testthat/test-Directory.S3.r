context("Directory.S3_A")
test_that("Directory.S3", {

  expect_is(Directory.S3(), "Directory.S3")
  expect_is(Directory.S3(path = tempdir()), "Directory.S3")
  expect_is(res <- Directory.S3(tempdir()), "Directory.S3")
  expect_true(file.exists(res))
  expect_is(Directory.S3(.x = tempdir()), "Directory.S3")
  
  }
)

