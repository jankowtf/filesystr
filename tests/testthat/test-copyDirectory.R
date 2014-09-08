test_that(desc="copyDirectory", code={
  
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
  filescope	<- 1*24
  path 		<- file.path(tempdir(), "copyDirectory")
  from 		<- file.path(path, "from")
  from2 	<- file.path(path, "from2")
  from_dirs 	<- file.path(from, paste0(letters, 1:filescope))
  from_dirs2 	<- gsub("/from/", "/from2/", from_dirs)
  to 			<- file.path(path, "to")
  to2			<- file.path(path, "to2")
  
  sapply(c(from_dirs, from_dirs2), dir.create, recursive=TRUE, showWarnings=FALSE)
  sapply(c(to, to2), dir.create, recursive=TRUE, showWarnings=FALSE)
  
  fpaths <- unlist(lapply(from_dirs, file.path, 
                          paste0(letters, 1:filescope, ".txt")))
  fpaths2 <- gsub("/from/", "/from2/", fpaths)
  sapply(c(fpaths, fpaths2), function(ii) {
    write("hello world!", file=ii)
  })
  
  ## Standardize //
  from_stand 	<- normalizePath(from, winslash="/")
  from_stand2 <- normalizePath(from2, winslash="/")
  to_stand 	<- normalizePath(to, winslash="/")
  to_stand2 	<- normalizePath(to2, winslash="/")
  
  expected_raw <- list(list(from=NA, to=NA, elements=c("."=TRUE)))
  
  ## Copy subdirs by default //
  expected <- expected_raw
  expected[[1]]$from 	<- from_stand
  expected[[1]]$to 	<- to_stand
  class(expected[[1]]) <- c("RappFilesystemCopyResultS3", class(expected[[1]]))
  class(expected) <- c("RappFilesystemCopyResultsS3", class(expected))
  expect_equal(
    res <- copyDirectory(from = from, to = to),
    expected
  )
  carefulCleanup(x=to)
  
  ## One source, two targets //
  expected <- expected_raw
  expected[[1]]$from 	<- from_stand
  expected[[1]]$to 	<- to_stand
  class(expected[[1]]) <- c("RappFilesystemCopyResultS3", class(expected[[1]]))
  expected[[2]] <- expected[[1]]
  expected[[2]]$to <- to_stand2
  class(expected) <- c("RappFilesystemCopyResultsS3", class(expected))
  expect_equal(
    res <- copyDirectory(from = from, to = c(to, to = to2), ensure_to = TRUE),
    expected
  )
  #        carefulCleanup(x = c(to, to2))
  
  ## Two source, one target //
  expected <- expected_raw
  expected[[1]]$from 	<- from_stand
  expected[[1]]$to 	<- to_stand
  class(expected[[1]]) <- c("RappFilesystemCopyResultS3", class(expected[[1]]))
  expected[[2]] <- expected[[1]]
  expected[[2]]$from	<- from_stand2
  expected[[2]]$to 	<- to_stand
  class(expected) <- c("RappFilesystemCopyResultsS3", class(expected))
  expect_equal(
    res <- copyDirectory(from = c(from, from2), 
      to = to, overwrite = TRUE, ensure_to = TRUE
    ),
    expected
  )
  carefulCleanup(x = c(to, to2))
  
  ## Two sources, two targets //
  expected <- expected_raw
  expected[[1]]$from 	<- from_stand
  expected[[1]]$to 	<- to_stand
  class(expected[[1]]) <- c("RappFilesystemCopyResultS3", class(expected[[1]]))
  expected[[2]] <- expected[[1]]
  expected[[2]]$from 	<- from_stand2
  expected[[2]]$to 	<- to_stand2
  class(expected) <- c("RappFilesystemCopyResultsS3", class(expected))
  expect_equal(
    res <- copyDirectory(
      from = c(from, from2), 
      to = c(to, to=to2),
      overwrite = TRUE,
      ensure_to = TRUE
    ),
    expected
  )
  carefulCleanup(x = c(to, to2))
  
  ## Non-recursive //
  expected <- expected_raw
  expected[[1]]$from 	<- from_stand
  expected[[1]]$to 	<- to_stand
  class(expected[[1]]) <- c("RappFilesystemCopyResultS3", class(expected[[1]]))
  tmp <- list.files(from)
  expected[[1]]$elements <- rep(TRUE, length(tmp))
  names(expected[[1]]$elements) <- tmp
  class(expected) <- c("RappFilesystemCopyResultsS3", class(expected))
  rm(tmp)
  expect_equal(
    res <- copyDirectory(
      from = from, 
      to = to,
      recursive = FALSE,
      ensure_to = TRUE
    ),
    expected
  )
  
  ## Copy deeper levels, without overwriting //
  expected <- expected_raw
  expected[[1]]$from 	<- from_stand
  expected[[1]]$to 	<- to_stand
  class(expected[[1]]) <- c("RappFilesystemCopyResultS3", class(expected[[1]]))
  class(expected) <- c("RappFilesystemCopyResultsS3", class(expected))
  expect_equal(
    res <- copyDirectory(from = from, to = to, overwrite = FALSE),
    expected
  )
  
  ## Condition handling //
  expect_error(
    res <- copyDirectory(from = from, to = "nonexisting")
  )
  carefulCleanup(x = path)
  
})
