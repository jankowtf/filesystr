\dontrun{

## Auxiliary functions //
.carefulCleanup <- function(x, pattern=basename(tempdir())) {
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
path <- file.path(tempdir(), "ensureDirectory")
sapply(path, dir.create, recursive=TRUE, showWarnings=FALSE)

path <- file.path(path, letters[1:3])
ensureDirectory(path = path)

## If directory already exists //
ensureDirectory(path = path)

## Clean up //
.carefulCleanup(x = path)
  

}
