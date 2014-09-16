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
res <- asDirectoryPath(path = path_0)
res
class(res)

## RappFilesystemDirectoryS3 //
res <- asDirectoryPath(path = asDirectoryPath(path_0))
res
class(res)

## Ensure //
file.exists(asDirectoryPath(path = path_0, ensure = TRUE))
.cleanTempDir(x = path_0)

file.exists(
  asDirectoryPath(path = asDirectoryPath(path_0), ensure = TRUE)
)
.cleanTempDir(x = path_0)

}
