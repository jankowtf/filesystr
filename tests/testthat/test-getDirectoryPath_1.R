context("getDirectoryPath_1")
test_that(desc="getDirectoryPath", code={
    
  path <- c(
    "somedir/foo.tgz", 
    "another dir\\bar.tar.gz", 
    "baz", 
    "baz/quux. quuux.tbz2", 
    "~/quuuux.tar.xz",
    "", 
    ".",
    "..",
    NA_character_
  )
  expected <- c(
    file.path(getwd(), "somedir"), 
    file.path(getwd(), "another dir"),
    file.path(getwd(), "baz"),
    file.path(getwd(), "baz"),
    normalizePath("~", winslash = "/"),
    "",
    getwd(),
    dirname(getwd()),
    NA
  )
  expect_equal(
    res <- getDirectoryPath(path = path),
    expected
  )
  
  expected <- c(
    "somedir", 
    "another dir",
    "baz",
    "baz",
    "~",
    "",
    ".",
    "..",
    NA
  )
  expect_equal(
    res <- getDirectoryPath(path = path, shortform = TRUE),
    expected
  )
  
  expect_equal(
    getDirectoryPath(path = character()),
    character()
  )
  
  expect_equivalent(
    getDirectoryPath(),
    getDirectoryPath(path = ".")
  )
  
})
