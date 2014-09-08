\dontrun{

## Auxiliary function //
.cleanTempDir <- function(x) {
  if (grepl(basename(tempdir()), x)) {
    unlink(x, recursive = TRUE, force = TRUE)
  }
}

## Path //
path_0 <- file.path(tempdir(), "path/test.txt")

## character //
res <- asFile(path = path_0)
res
class(res)

## RappFilesystemFileS3 //
res <- asFile(path = asFile(path_0))
res
class(res)

## Ensure //
file.exists(asFile(path = path_0, ensure = TRUE))
.cleanTempDir(x = path_0)

file.exists(
  asFile(path = asFile(path_0), ensure = TRUE)
)
.cleanTempDir(x = path_0)

}
