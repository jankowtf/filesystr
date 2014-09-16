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
res <- asFilePath(path = path_0)
res
class(res)

## RappFilesystemFileS3 //
res <- asFilePath(path = asFilePath(path_0))
res
class(res)

## Ensure //
file.exists(asFilePath(path = path_0, ensure = TRUE))
.cleanTempDir(x = path_0)

file.exists(
  asFilePath(path = asFilePath(path_0), ensure = TRUE)
)
.cleanTempDir(x = path_0)

}
