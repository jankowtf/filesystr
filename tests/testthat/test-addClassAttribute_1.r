context("addClassAttribute_1")
test_that("addClassAttribute", {

  obj <- "hello world!"
  expected <- c(
    "CopyResult.S3",
    "CopyResults.S3",
    "RappFilesystemDecomposedPathS3",
    "Directory.S3",
    "File.S3"
  )
  lapply(expected, function(ii) {
    expect_is(res <- filesystr::addClassAttribute(
        obj = obj, 
        class_name = ii
      ), 
      ii
    )
  })
  
  expect_error(filesystr::addClassAttribute(
    obj = obj, 
    class_name = "NonExistingClass"
  ))
  
  }
)

