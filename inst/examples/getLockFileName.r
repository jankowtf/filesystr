\dontrun{

## Non-existing file system ressource //
path <- file.path(tempdir(), "test.txt")
getLockFileName(path = path)

## Files //
file.create(path)
getLockFileName(path = path)

## Directories //
getLockFileName(path = tempdir())

}
