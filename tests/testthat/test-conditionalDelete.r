context("conditionalDelete-A")
test_that("conditionalDelete", {
  
  path <- file.path(tempdir(), "conditionalDelete/dir")    
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  file.create(file.path(path, paste0("file", 1:3)))
  
  expect_true(res <- conditionalDelete(path = path, 
    condition = basename(tempdir())))
  expect_false(file.exists(path))
  
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  file.create(file.path(path, paste0("file", 1:3)))
  expect_true(res <- conditionalDelete(path = path, 
    condition = basename(tempdir()), content_only = TRUE))
  expect_true(file.exists(path))
  
  file.create(file.path(path, paste0("file", 1:3)))
  fpath <- file.path(path, "file1")
  expect_true(res <- conditionalDelete(path = fpath, 
    condition = basename(tempdir())))
  expect_false(file.exists(fpath))
  
  fpath <- file.path(path, "file2")
  expect_false(res <- conditionalDelete(path = fpath, condition = "abcd"))
  expect_true(file.exists(fpath))
  
})

