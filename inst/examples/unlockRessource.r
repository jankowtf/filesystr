\dontrun{

## Create example content  
path <- file.path(tempdir(), "test/registry.rdata")
dir.create(dirname(path), showWarnings = FALSE)
file.create(path)

## Open directory in file system browser //
openRessource(path = dirname(path))

## File //
lockRessource(path = path)
## Note additional '*FILE_LOCK' file in directory 
unlockRessource(path = path)
## Note '*FILE_LOCK' file in directory has been removed again

## Directory //
lockRessource(path = dirname(path))
## Note additional '*DIR_LOCK' file in directory 
unlockRessource(path = dirname(path))
## Note '*DIR_LOCK' file in directory has been removed again

## Non-existing ressources //
unlockRessource(path = "abcd")
try(unlockRessource(path = "abcd", strict = TRUE))

}
