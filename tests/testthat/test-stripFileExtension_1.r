context("stripFileExtension_1")
test_that(desc="stripFileExtension",code = {
    
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
  expected <- c(
    file.path(getwd(), "somedir/foo"), 
    normalizePath(file.path(getwd(), "another dir\\bar"), winslash="/", 
                  mustWork=FALSE), 
    "",
    file.path(getwd(), "quux. quuux"), 
    normalizePath(file.path(path.expand("~"), "quuuux"), winslash="/", 
                  mustWork=FALSE),
    "", 
    "",
    "",
    NA_character_
  )
  expect_equal(
    res <- stripFileExtension(path = path),
    expected
  )
  
  expected <- c(
    "foo", 
    "bar",
    "",
    "quux. quuux",
    "quuuux", 
    "",
    "",
    "",
    NA_character_
  )
  expect_equal(
    res <- stripFileExtension(path = path, include_dir = FALSE),
    expected
  )
  
  expect_equal(
    stripFileExtension(path = character()),
    character()
  )
  
  expect_equal(
    stripFileExtension(),
    stripFileExtension(path = ".")
  )
  
}
)
