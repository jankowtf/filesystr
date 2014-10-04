\dontrun{

## Directory preparations //
to <- file.path(tempdir(), "copyDirectory", c("to1", "to2"))
sapply(to, dir.create, recursive=TRUE, showWarnings=FALSE)

## Utility functions //
.carefulCleanup <- function(x, pattern=basename(tempdir()), content.only=TRUE) {
  out <- sapply(x, function(ii) {
      out <- FALSE
      if (grepl(pattern, ii)) {
        out <- !as.logical(unlink(ii, recursive=TRUE, force=TRUE))
        if (out & content.only) {
          dir.create(ii, recursive=TRUE, showWarnings=FALSE)    
        }
      }        
      out
    })
  invisible(out)
}

## Open directories in file system browser //
.openRessource(to[1])
.openRessource(to[2])

## One source, one target //
copyDirectory(from = R.home("etc"), to = to[1])
.carefulCleanup(to[1])

## One source, two targets //
copyDirectory(from = R.home("etc"), to = to)
.carefulCleanup(to)

## Two sources, one target //
## Combines content of 'etc' and 'tests'. If there would be any conflicts,
## the would result in an error as 'overwrite = FALSE'.
## Otherwise, existing content is overwritten.
copyDirectory(from = c(R.home("etc"), R.home("tests")), to = to[1])
.carefulCleanup(to)

## Two sources, two targets //
copyDirectory(from = c(R.home("etc"), R.home("tests")), to = to)
.carefulCleanup(to)

## Non-recursive //
## Only files directly below 'from' and actual subdirectories are copied, 
## *NOT* their content.
copyDirectory(from = R.home("etc"), to = to[1], recursive = FALSE)

## Subsequent recursive copy, existing content overwritten //
## This will add the actual content of the subdirectories.
copyDirectory(from = R.home("etc"), to = to[1], overwrite = TRUE)
.carefulCleanup(to[1])

## Condition handling //
## Handling of non-existing target directories:
.carefulCleanup(to, content.only = FALSE)
try(copyDirectory(from = R.home("etc"), to = to[1]))
## Existence of target root directories can be ensured:
copyDirectory(from = R.home("etc"), to = to[1], ensure_to =TRUE)

}
