context("File.S3_A")
test_that("File.S3", {

  expect_is(File.S3(), "File.S3")
  expect_is(File.S3(path = tempfile()), "File.S3")
  expect_is(res <- File.S3(tempfile()), "File.S3")
  file.create(res)
  expect_true(file.exists(res))
  expect_is(File.S3(.x = tempfile()), "File.S3")
  
  }
)

