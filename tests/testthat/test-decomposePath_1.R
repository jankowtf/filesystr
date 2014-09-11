context("decomposePath_1")
test_that(desc="decomposePath", code={
  
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
  wd_0 <- getwd()
  
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
  expected <- data.frame(
    directory = c(
      file.path(getwd(), "somedir"),  
      file.path(getwd(), "somedir"),  
      file.path(getwd(), "another dir"), 
      file.path(getwd(), "baz"),  
      getwd(), 
      dirname("~/ "), 
      "", 
      normalizePath(getwd(), winslash = "/"),
      normalizePath(dirname(getwd()), winslash = "/"),
      NA
    ),
    filename = c("", "foo", "bar", "", "quux. quuux", "quuuux", "", "", "", NA),
    extension = c("", "tgz", "tar.gz", "", "tbz2", "tar.xz", "", "", "", NA),
    stringsAsFactors = FALSE
  )
  expected <- rapp.core.filesys::addClassAttribute(obj = expected, 
    class_name = "RappFilesystemDecomposedPath")
  expect_equal(
    res <- decomposePath(path = path),
    expected
  )
#   idx <- res[[column]] != expected[[column]]
#   which(idx)
#   res[[column]][idx]
#   expected[[column]][idx]
  
  expected <- data.frame(
    directory = c(
      getwd(),
      file.path(getwd(), "somedir"),  
      file.path(getwd(), "another dir"), 
      file.path(getwd()),  
      getwd(), 
      dirname("~/ "), 
      "", 
      normalizePath(getwd(), winslash = "/"),
      normalizePath(dirname(getwd()), winslash = "/"),
      NA
    ),
    filename = c("somedir", "foo", "bar", "baz", "quux. quuux", "quuuux", "", "", "", NA),
    extension = c("", "tgz", "tar.gz", "", "tbz2", "tar.xz", "", "", "", NA),
    stringsAsFactors = FALSE
  )
  expected <- rapp.core.filesys::addClassAttribute(obj = expected, 
    class_name = "RappFilesystemDecomposedPath")
  expect_equal(
    res <- decomposePath(path = path, dir_slash = TRUE),
    expected
  )

#   column <- "extension"
#   idx <- res[[column]] != expected[[column]]
#   which(idx)
#   res[[column]][idx]
#   expected[[column]][idx]

  ## Create example content //  
  to_create <- file.path(tempdir(), "decomposePath", 
                         c("dir_a", file.path("dir_b", "sub_1")))
  sapply(to_create, dir.create, recursive = TRUE, showWarnings = FALSE)
  file.create(file.path(tempdir(), "decomposePath/dir_b/sub_1/file.txt"))
  ## Change working directory //
  setwd(file.path(tempdir(), "decomposePath"))
  ## Make sure you undo this with 'setwd(wd_0)' when you are finished!!!
  
  path <- c(
    ".",
    "..",
    "dir_a", 
    "dir_b", 
    "dir_b/sub_1",
    "dir_b/sub_1/file.txt",
    "dir_b/nonex",
    "dir_b/nonex/file.txt",
    "nonex",
    "nonex/sub_1",
    "nonex/sub_1/file.txt",
    "nonex/foo.tgz", 
    "another nonex\\file.tar.gz", 
    "a_file", 
    "quux. quuux.tbz2", 
    "~/file.tar.xz",
    "", 
    NA_character_
  )
  expected <- data.frame(
    directory = c(
      normalizePath(getwd(), winslash = "/"),
      normalizePath(dirname(getwd()), winslash = "/"), 
      normalizePath(file.path(getwd(), "dir_a"), winslash = "/"),  
      normalizePath(file.path(getwd(), "dir_b"), winslash = "/"),
      normalizePath(file.path(getwd(), "dir_b/sub_1"), winslash = "/"),
      normalizePath(file.path(getwd(), "dir_b/sub_1"), winslash = "/"),  
      file.path(getwd(), "dir_b/nonex"),  
      file.path(getwd(), "dir_b/nonex"),
      file.path(getwd(), "nonex"),
      file.path(getwd(), "nonex/sub_1"),
      file.path(getwd(), "nonex/sub_1"),
      file.path(getwd(), "nonex"),
      file.path(getwd(), "another nonex"),
      file.path(getwd(), "a_file"),
      getwd(),
      normalizePath(dirname("~/ "), winslash = "/"), 
      "", 
      NA
    ),
    filename = c("", "", "", "", "", "file", "", "file", "", "", "file", "foo", "file", "", "quux. quuux", "file", "", NA),
    extension = c("", "", "", "", "", "txt", "", "txt", "", "", "txt", "tgz", "tar.gz", "", "tbz2", "tar.xz", "", NA),
    stringsAsFactors = FALSE
  )
  expected <- rapp.core.filesys::addClassAttribute(obj = expected, 
    class_name = "RappFilesystemDecomposedPath")
  expect_equal(
    res <- decomposePath(path = path),
    expected
  )
#   column <- "directory"
#   idx <- res[[column]] != expected[[column]]
#   which(idx)
#   res[[column]][idx]
#   expected[[column]][idx]
  
  path <- c(
    ".",
    "..",
    "dir_a/", 
    "dir_b/", 
    "dir_b/sub_1/",
    "dir_b/sub_1/file.txt",
    "dir_b/nonex/",
    "dir_b/nonex/file.txt",
    "nonex/",
    "nonex/sub_1/",
    "nonex/sub_1/file.txt",
    "nonex/foo.tgz", 
    "another nonex\\file.tar.gz", 
    "a_file", 
    "quux. quuux.tbz2", 
    "~/file.tar.xz",
    "", 
    NA_character_
  )
  expected <- data.frame(
    directory = c(
      normalizePath(getwd(), winslash = "/"),
      normalizePath(dirname(getwd()), winslash = "/"), 
      normalizePath(file.path(getwd(), "dir_a"), winslash = "/"),  
      normalizePath(file.path(getwd(), "dir_b"), winslash = "/"),
      normalizePath(file.path(getwd(), "dir_b/sub_1"), winslash = "/"),
      normalizePath(file.path(getwd(), "dir_b/sub_1"), winslash = "/"),
      file.path(getwd(), "dir_b/nonex"),  
      file.path(getwd(), "dir_b/nonex"),
      file.path(getwd(), "nonex"),
      file.path(getwd(), "nonex/sub_1"),
      file.path(getwd(), "nonex/sub_1"),
      file.path(getwd(), "nonex"),
      file.path(getwd(), "another nonex"),
      file.path(getwd(), "a_file"),
      getwd(),
      normalizePath(dirname("~/ "), winslash = "/"), 
      "", 
      NA
    ),
    filename = c("", "", "", "", "", "file", "", "file", "", "", "file", "foo", "file", "", "quux. quuux", "file", "", NA),
    extension = c("", "", "", "", "", "txt", "", "txt", "", "", "txt", "tgz", "tar.gz", "", "tbz2", "tar.xz", "", NA),
    stringsAsFactors = FALSE
  )
  expected <- rapp.core.filesys::addClassAttribute(obj = expected, 
    class_name = "RappFilesystemDecomposedPath")
  expect_equal(
    res <- decomposePath(path = path),
    expected
  )
#   idx <- res[[column]] != expected[[column]]
#   which(idx)
#   res[[column]][idx]
#   expected[[column]][idx]
# path[idx]
  
  expected <- data.frame(
    directory = c(
      normalizePath(getwd(), winslash = "/"),
      normalizePath(dirname(getwd()), winslash = "/"), 
      normalizePath(file.path(getwd(), "dir_a"), winslash = "/"),  
      normalizePath(file.path(getwd(), "dir_b"), winslash = "/"),
      normalizePath(file.path(getwd(), "dir_b/sub_1"), winslash = "/"),
      normalizePath(file.path(getwd(), "dir_b/sub_1"), winslash = "/"),  
      file.path(getwd(), "dir_b/nonex"),  
      file.path(getwd(), "dir_b/nonex"),
      file.path(getwd(), "nonex"),
      file.path(getwd(), "nonex/sub_1"),
      file.path(getwd(), "nonex/sub_1"),
      file.path(getwd(), "nonex"),
      file.path(getwd(), "another nonex"),
      getwd(),
      getwd(),
      normalizePath(dirname("~/ "), winslash = "/"), 
      "", 
      NA
    ),
    filename = c("", "", "", "", "", "file", "", "file", "", "", "file", "foo", "file", "a_file", "quux. quuux", "file", "", NA),
    extension = c("", "", "", "", "", "txt", "", "txt", "", "", "txt", "tgz", "tar.gz", "", "tbz2", "tar.xz", "", NA),
    stringsAsFactors = FALSE
  )
  expected <- rapp.core.filesys::addClassAttribute(obj = expected, 
    class_name = "RappFilesystemDecomposedPath")
  expect_equal(
    res <- decomposePath(path = path, dir_slash = TRUE),
    expected
  )
#   idx <- res[[column]] != expected[[column]]
#   which(idx)
#   res[[column]][idx]
#   expected[[column]][idx]
#   path[idx]

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
  expected <- data.frame(
    directory = c(
      rep(normalizePath(file.path(getwd(), "dir_b/sub_1"), winslash = "/"), 4),
      rep(file.path(getwd(), "dir_b/sub_1"), 2),
      rep(file.path(getwd(), "dir_b/noext"), 6)
    ),
    filename = rep(c("", "", "file", "file", "notthere", "notthere"), 2),
    extension = rep(c("", "", "txt", "txt", "txt", "txt"), 2),
    stringsAsFactors = FALSE
  )
  expected <- rapp.core.filesys::addClassAttribute(obj = expected, 
    class_name = "RappFilesystemDecomposedPath")
  expect_equal(
    res <- decomposePath(path = path),
    expected
  )

  expected <- data.frame(
    directory = c(
      rep(normalizePath(file.path(getwd(), "dir_b/sub_1"), winslash = "/"), 4),
      rep(file.path(getwd(), "dir_b/sub_1"), 2),
      file.path(getwd(), "dir_b"),
      rep(file.path(getwd(), "dir_b/noext"), 5)
    ),
    filename = c("", "", "file", "file", "notthere", "notthere", "noext",
                 "", "file", "file", "notthere", "notthere"),
    extension = rep(c("", "", "txt", "txt", "txt", "txt"), 2),
    stringsAsFactors = FALSE
  )
  expected <- rapp.core.filesys::addClassAttribute(obj = expected, 
    class_name = "RappFilesystemDecomposedPath")
  expect_equal(
    res <- decomposePath(path = path, dir_slash = TRUE),
    expected
  )

  column = "directory"
  idx <- res[[column]] != expected[[column]]
  which(idx)
  res[[column]][idx]
  expected[[column]][idx]
  path[idx]

  expected <- data.frame(
    directory = NA_character_,
    filename = NA_character_,
    extension = NA_character_
  )[-1,]
  expected <- rapp.core.filesys::addClassAttribute(obj = expected, 
    class_name = "RappFilesystemDecomposedPath")
  expect_equal(
    decomposePath(path=character()),
    expected
  )
  
  expect_identical(
    res <- decomposePath(),
    decomposePath(path=".")
  )
  
  path = c(".", "c:/nonexdir")
  expected <- data.frame(
    directory = c(
      normalizePath(path[1], winslash = "/"),
      path[2]
    ),
    filename = c(rep("", 2)),
    extension = c(rep("", 2)),
    stringsAsFactors = FALSE
  )
  expected <- rapp.core.filesys::addClassAttribute(obj = expected, 
    class_name = "RappFilesystemDecomposedPath")
  expect_identical(
    res <- decomposePath(path = path),
    expected
  )
  
  expected <- data.frame(
    directory = c(
      normalizePath(path[1], winslash = "/"),
      "c:/"
    ),
    filename = c("", "nonexdir"),
    extension = c(rep("", 2)),
    stringsAsFactors = FALSE
  )
  expected <- rapp.core.filesys::addClassAttribute(obj = expected, 
    class_name = "RappFilesystemDecomposedPath")
  expect_identical(
    res <- decomposePath(path = path, dir_slash = TRUE),
    expected
  )
  
  path = c(".", "./", "c:/nonexdir/", "d:/nonexdir")
  expected <- data.frame(
    directory = c(
      rep(normalizePath(path[1], winslash = "/"), 2),
      gsub("/$", "", path[3]),
      "d:/"
    ),
    filename = c(rep("", 3), "nonexdir"),
    extension = c(rep("", 4)),
    stringsAsFactors = FALSE
  )
  expected <- rapp.core.filesys::addClassAttribute(obj = expected, 
    class_name = "RappFilesystemDecomposedPath")
  expect_identical(
    res <- decomposePath(path = path, dir_slash = TRUE),
    expected
  )
  
  on.exit({
    setwd(wd_0)
    carefulCleanup(x = file.path(tempdir(), "decomposePath"))
  })
  
})
