context("recomposePath_2")
test_that(desc="recomposePath", code={
  
  path <- c(
    "somedir",
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
  expect_is(
    path_dec <- decomposePath(path = path), "data.frame"
  )
  
  expected <- path
  expected[3] <- gsub("\\\\", "/", path[3])
    
  expect_identical(
    res <- recomposePath(path = path_dec, shortform = TRUE),
    expected
  )
    
})
