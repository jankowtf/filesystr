\dontrun{

##------------------------------------------------------------------------------
## Method: character
##------------------------------------------------------------------------------

## Path //
path_0 <- file.path(tempdir(), "path")

res <- asDirectoryPath(path = path_0)
res
class(res)

## Strict:
try(asDirectoryPath(path = path_0, strict = TRUE))
## --> error as 'path' does not exist yet

path <- tempfile()
file.create(path)
try(asDirectoryPath(path = path, strict = TRUE))
## --> error as 'path' is a file and not a directory 

## Note that 'ensure' overrules 'strict':
asDirectoryPath(path = path_0, ensure = TRUE, strict = TRUE)
file.exists(path_0)

## Clean up //
conditionalDelete(path = path_0, condition = tempdir())

##------------------------------------------------------------------------------
## Method: Directory.S3
##------------------------------------------------------------------------------

## Path //
path_0 <- file.path(tempdir(), "path2")

res <- asDirectoryPath(path = asDirectoryPath(path_0))
res
class(res)

## Strict:
try(res <- asDirectoryPath(path = asDirectoryPath(path_0), strict = TRUE))
## --> error as 'path' does not exist yet

## Note that 'ensure' overrules 'strict':
asDirectoryPath(path = asDirectoryPath(path_0), ensure = TRUE, strict = TRUE)
file.exists(path_0)

## Clean up //
conditionalDelete(path = path_0, condition = tempdir())

}
