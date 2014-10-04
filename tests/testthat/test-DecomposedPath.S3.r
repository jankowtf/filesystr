context("DecomposedPath.S3_A")
test_that("DecomposedPath.S3", {

  expect_is(DecomposedPath.S3(), "DecomposedPath.S3")
  expect_is(DecomposedPath.S3(decomposed = data.frame(a = 1, b = 2)), 
            "DecomposedPath.S3")
  expect_is(res <- DecomposedPath.S3(TRUE), "DecomposedPath.S3")
  expect_is(DecomposedPath.S3(.x = TRUE), "DecomposedPath.S3")
  
  }
)

