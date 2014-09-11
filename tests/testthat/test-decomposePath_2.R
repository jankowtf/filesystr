context("decomposePath_2")
test_that(desc="decomposePath", code={
  
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
  expected <- data.frame(
    directory = c(
      ".",
      "..",
      "dir_a", 
      "dir_b", 
      "dir_b/sub_1",
      "dir_b/sub_1",
      "dir_b/nonex",
      "dir_b/nonex",
      "nonex",
      "nonex/sub_1",
      "nonex/sub_1",
      "nonex", 
      "another nonex", 
      "a_file", 
      ".", 
      "~",
      "", 
      NA_character_
    ),
    filename = c("", "", "", "", "", "file", "", "file", "", "", "file", "foo", "file", "", "quux. quuux", "file", "", NA),
    extension = c("", "", "", "", "", "txt", "", "txt", "", "", "txt", "tgz", "tar.gz", "", "tbz2", "tar.xz", "", NA),
    stringsAsFactors = FALSE
  )
  expected <- rapp.core.filesys::addClassAttribute(obj = expected, 
    class_name = "RappFilesystemDecomposedPath")
  expect_equal(
    res <- decomposePath(path = path, shortform = TRUE),
    expected
  )
  
})
