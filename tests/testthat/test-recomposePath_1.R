context("recomposePath_1")
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
  
  expected <- c(
    normalizePath(file.path(path.expand("."), path[1]), winslash="/", mustWork=FALSE),
    normalizePath(file.path(path.expand("."), path[2]), winslash="/", mustWork=FALSE),
    normalizePath(file.path(path.expand("."), path[3]), winslash="/", mustWork=FALSE),
    normalizePath(file.path(path.expand("."), path[4]), winslash="/", mustWork=FALSE),
    normalizePath(file.path(path.expand("."), path[5]), winslash="/", mustWork=FALSE),
    normalizePath(file.path(path.expand("~"), basename(path[6])), winslash="/", mustWork=FALSE),
    "",
    getwd(),
    dirname(getwd()),
    NA   
  )
  
  expect_identical(
    res <- recomposePath(path = path_dec),
    expected
  )
  expected <- path
  expected <- gsub("\\\\", "/", expected)
  expect_identical(
    res <- recomposePath(path = path_dec, shortform=TRUE),
    expected
  )
  
  path <- c(
    "dir_b/sub_1",
    "dir_b/sub_1/",
    "dir_b/sub_1/file.txt",
    "dir_b/sub_1/file.txt/",
    "dir_b/sub_1/notthere.txt",
    "dir_b/sub_1/notthere.txt/",
    "dir_b/noext",
    "dir_b/noext/",
    "dir_b/noext/file.txt",
    "dir_b/noext/file.txt/",
    "dir_b/noext/notthere.txt",
    "dir_b/noext/notthere.txt/"
  )
  expect_is(
    path_dec <- decomposePath(path = path), "data.frame"
  )
  expected <- c(
    rep(normalizePath(file.path(path.expand("."), path[1]), 
                      winslash = "/", mustWork = FALSE), 2),
    rep(normalizePath(file.path(path.expand("."), path[3]),
                      winslash = "/", mustWork = FALSE), 2),
    rep(normalizePath(file.path(path.expand("."), path[5]),
                      winslash = "/", mustWork = FALSE), 2),
    rep(normalizePath(file.path(path.expand("."), path[7]), 
                      winslash = "/", mustWork = FALSE), 2),
    rep(normalizePath(file.path(path.expand("."), path[9]), 
                      winslash = "/", mustWork = FALSE), 2),
    rep(normalizePath(file.path(path.expand("."), path[11]), 
                      winslash = "/", mustWork = FALSE), 2)
  )
  expect_identical(
    res <- recomposePath(path = path_dec),
    expected
  )
  
  expect_is(
    path_dec <- decomposePath(path = path, dir_slash = TRUE), "data.frame"
  )
  expect_identical(
    res <- recomposePath(path = path_dec),
    expected
  )
  expect_identical(
    res <- recomposePath(path = path_dec, shortform = TRUE),
    gsub(paste0(getwd(), "/"), "", expected)
  )
  
})
