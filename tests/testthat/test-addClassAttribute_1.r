context("addClassAttribute_1")
test_that("addClassAttribute", {

  obj <- "hello world!"
  expected <- c(
    "RappFilesystemCopyResultS3",
    "RappFilesystemCopyResultsS3",
    "RappFilesystemDecomposedPathS3",
    "RappFilesystemDirectoryS3",
    "RappFilesystemFileS3"
  )
  lapply(expected, function(ii) {
    expect_is(res <- rapp.core.filesys::addClassAttribute(
        obj = obj, 
        class_name = ii
      ), 
      ii
    )
  })
  
  expect_error(rapp.core.filesys::addClassAttribute(
    obj = obj, 
    class_name = "NonExistingClass"
  ))
  
  }
)

