context("getFileName_1")
test_that(desc="getFileName", code={
    
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
  expected <- c("foo", "bar", "", "quux. quuux", "quuuux", "", "", "", NA)
  expect_equal(
    res <- getFileName(path = path),
    expected
  )
  
  expect_equal(
    getFileName(path = character()),
    character()
  )
  
  expect_equivalent(
    getFileName(),
    getFileName(path = ".")
  )
  
})
