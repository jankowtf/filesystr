context("getFileExtension_1")
test_that(desc="getFileExtension", code={
    
  path <- c(
    "somedir/foo.tgz", 
    "another dir\\bar.tar.gz", 
    "baz", 
    "quux. quuux.tbz2", 
    "~/quuuux.tar.xz",
    "", 
    ".",
    "..",
    NA_character_
  )
  expected <- c("tgz", "tar.gz", "", "tbz2", "tar.xz", "", "", "", NA)
  expect_equal(
    res <- getFileExtension(path = path),
    expected
  )
  
  expect_equal(
    getFileExtension(path = character()),
    character()
  )
  
  expect_equivalent(
    getFileExtension(),
    getFileExtension(path = ".")
  )
  
})
