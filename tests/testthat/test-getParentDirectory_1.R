context("getParentDirectory_1")
test_that(desc="getParentDirectory", code={
    
  path <- c(getwd(), R.home())
  expected <- normalizePath(c(dirname(path[1]), dirname(path[2])), winslash = "/")
  expect_equal(
    res <- getParentDirectory(path = path),
    expected
  )
  expected <- c(dirname(expected[1]), dirname(expected[2]))
  expect_equal(
    res <- getParentDirectory(path = path, up = 2),
    expected
  )
  expected <- c(dirname(expected[1]), dirname(expected[2]))
  expect_equal(
    res <- getParentDirectory(path = path, up = 3),
    expected
  )
  
  path <- c(getwd(), R.home())
  expected <- normalizePath(c(dirname(path[1]), dirname(dirname(dirname(path[2])))),
    winslash = "/")
  expect_equal(
    res <- getParentDirectory(path = path, up = c(1,3)),
    expected
  )
  
  path <- "c:/Windows"
  expected <- "c:/"
  expect_equal(
    res <- getParentDirectory(path = path, up = 2),
    expected
  )
  expect_error(getParentDirectory(path = path, up = 3))
  
})
