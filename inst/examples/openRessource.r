\dontrun{

## Directory //
## Absolute path:
openRessource(path = tempdir())
## Relative path (non-existing):
openRessource(path = "does-not-exist")
## Relative path (existing):
openRessource(path = "R")

## File //
## Absolute path:
path <- file.path(tempdir(), "test.txt")
file.create(path)
openRessource(path = path)
## Relative path
openRessource(path = "DESCRIPTION")

## Non-existing ressource //
openRessource(path = "abdce")
try(openRessource(path = "abdce", strict = TRUE))

}
