\dontrun{

## Directory //
openRessource(path = tempdir())

## File //
path <- file.path(tempdir(), "test.txt")
file.create(path)
openRessource(path = path)

## Non-existing ressource //
openRessource(path = "abdce")
try(openRessource(path = "abdce", strict = TRUE))

}
