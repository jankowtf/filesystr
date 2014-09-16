\dontrun{

## Create example content  
path <- file.path(tempdir(), "test/registry.rdata")
dir.create(dirname(path), showWarnings = FALSE)
file.create(path)

## Open directory in file system browser //
openRessource(path = dirname(path))

## File //
isRessourceLocked(path = path)
lockRessource(path = path)
## Note additional '*FILE_LOCK' file in directory 
isRessourceLocked(path = path)
unlockRessource(path = path)
## Note '*FILE_LOCK' file in directory has been removed again

## Directory //
isRessourceLocked(path = dirname(path))
lockRessource(path = dirname(path))
## Note additional '*DIR_LOCK' file in directory 
isRessourceLocked(path = dirname(path))
unlockRessource(path = dirname(path))
## Note '*DIR_LOCK' file in directory has been removed again

## Non-existing ressources //
try(isRessourceLocked(path = "abcd"))

}
