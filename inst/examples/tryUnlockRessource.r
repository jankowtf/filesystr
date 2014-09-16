\dontrun{

## Example content //
path <- file.path(tempdir(), "test/registry.rdata")
file.create(path)
  
## File //
tryUnlockRessource(path = path, try_limit = 3)
try(tryUnlockRessource(path = path, try_limit = 3, strict = TRUE))
lockRessource(path = path)
tryUnlockRessource(path = path)

## Directory //
path <- dirname(path)
tryUnlockRessource(path = path, try_limit = 3)
try(tryUnlockRessource(path = path, try_limit = 3, strict = TRUE))
lockRessource(path = path)
tryUnlockRessource(path = path)

## Non-existing ressource //
expect_error(tryUnlockRessource(path = "abcd", strict = TRUE))

}
