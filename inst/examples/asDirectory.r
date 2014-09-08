\dontrun{

## Auxiliary function //
.cleanTempDir <- function(x) {
  if (grepl(basename(tempdir()), x)) {
    unlink(x, recursive = TRUE, force = TRUE)
  }
}

## Path //
path_0 <- file.path(tempdir(), "path")

## character //
res <- asDirectory(path = path_0)
res
class(res)

## RappFilesystemDirectoryS3 //
res <- asDirectory(path = asDirectory(path_0))
res
class(res)

## Ensure //
file.exists(asDirectory(path = path_0, ensure = TRUE))
.cleanTempDir(x = path_0)

file.exists(
  asDirectory(path = asDirectory(path_0), ensure = TRUE)
)
.cleanTempDir(x = path_0)

}
