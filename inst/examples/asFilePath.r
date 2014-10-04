\dontrun{

##------------------------------------------------------------------------------
## Method: character
##------------------------------------------------------------------------------  
  
## Path //
path_0 <- file.path(tempdir(), "path/test.txt")

res <- asFilePath(path = path_0)
res
class(res)

## Strict:
try(asFilePath(path = path_0, strict = TRUE))
## --> error as 'path' does not exist yet

try(asFilePath(path = tempdir(), strict = TRUE))
## --> error as 'path' is a directory and not a file 

## Note that 'ensure' overrules 'strict':
asFilePath(path = path_0, ensure = TRUE, strict = TRUE)
file.exists(path_0)

## Clean up //
conditionalDelete(path = path_0, condition = tempdir())

##------------------------------------------------------------------------------
## Method: FilePath.S3
##------------------------------------------------------------------------------

## Path //
path_0 <- file.path(tempdir(), "path/test2.txt")

res <- asFilePath(path = asFilePath(path_0))
res
class(res)

## Strict:
try(res <- asFilePath(path = asFilePath(path_0), strict = TRUE))
## --> error as 'path' does not exist yet

## Note that 'ensure' overrules 'strict':
asFilePath(path = asFilePath(path_0), ensure = TRUE, strict = TRUE)
file.exists(path_0)

## Clean up //
conditionalDelete(path = path_0, condition = tempdir())

}
