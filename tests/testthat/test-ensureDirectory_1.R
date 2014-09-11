context("ensureDirectory_1")
test_that(desc="ensureDirectory", code={
  
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
  path_0 <- file.path(tempdir(), "ensureDirectory")
  expect_equivalent(
    res <- ensureDirectory(path = path_0),
    TRUE
  )
  
  path <- file.path(path_0, letters[1:3])
  expected <- rep(TRUE, length(path))
  expect_equivalent(
    res <- ensureDirectory(path = path),
    expected
  )
  
  ## Directory already exists //
  names(expected) <- normalizePath(path, winslash="/", mustWork=FALSE)
  
  expect_equivalent(
    res <- ensureDirectory(path = path),
    expected
  )
  
  ## Clean up //
  on.exit(carefulCleanup(x = path))
  
})
