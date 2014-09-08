test_that(desc="createDirectory", code={
  
  carefulCleanup <- function(x, pattern=basename(tempdir())) {
    out <- sapply(x, function(ii) {
      out <- NA
      if (grepl(pattern, ii)) {
        out <- unlink(ii, recursive=TRUE, force=TRUE)
      }        
      out
    })
    invisible(out)
  }
  
  ## Example content //
  path <- file.path(tempdir(), "createDirectory")
  sapply(path, dir.create, recursive=TRUE, showWarnings=FALSE)
  
  path <- file.path(path, letters[1:3])
  expected <- rep(TRUE, length(path))
  expect_equivalent(
    res <- createDirectory(path = path),
    expected
  )
  
  ## Directory already exists //
  names(expected) <- normalizePath(path, winslash="/", mustWork=FALSE)
  for (ii in seq(along=expected)) {
    expected[ii] <- FALSE
  }
  expect_warning(
    res <- createDirectory(path = path)
  )
  expect_equal(
    res,
    expected
  )
  
  ## Clean up //
  carefulCleanup(x=path)
  
})
