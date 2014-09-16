context("asDecomposedPath-1")
test_that("asDecomposedPath", {
  
  path <- c(
    ".",
    "..",
    "dir_a/", 
    "dir_b/", 
    "dir_b/sub_1/",
    "dir_b/sub_1/file.txt",
    "dir_b/nonex/",
    "dir_b/nonex/file.txt",
    "nonex/",
    "nonex/sub_1/",
    "nonex/sub_1/file.txt",
    "nonex/foo.tgz", 
    "another nonex\\file.tar.gz", 
    "a_file", 
    "quux. quuux.tbz2", 
    "~/file.tar.xz",
    "", 
    NA_character_
  )
  
  ## character //
  expected <- decomposePath(path= path)
  expect_equal(res <- asDecomposedPath(path = path), expected)
  expected <- decomposePath(path= path, dir_slash = TRUE)
  expect_equal(res <- asDecomposedPath(path = path, dir_slash = TRUE), expected)
  expected <- decomposePath(path= path, shortform = TRUE)
  expect_equal(res <- asDecomposedPath(path = path, shortform = TRUE), expected)
  
  ## RappFilesystemDirectoryS3 //
  expected <- decomposePath(path= path)
  expect_equal(res <- asDecomposedPath(path = asDirectoryPath(path)), expected)
  
  ## RappFilesystemFileS3 //
  expected <- decomposePath(path= path)
  expect_equal(res <- asDecomposedPath(path = asFilePath(path)), expected)
  
  ## RappFilesystemDecomposedPathS3 //
  expected <- decomposePath(path= path)
  expect_equal(res <- asDecomposedPath(path = decomposePath(path)), expected)
  
  }
)

