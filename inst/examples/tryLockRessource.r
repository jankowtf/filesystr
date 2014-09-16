\dontrun{

## Example content //
path <- file.path(tempdir(), "test/registry.rdata")
file.create(path)
  
## File //
lockRessource(path = path)
tryLockRessource(path = path, try_limit = 3)
try(tryLockRessource(path = path, try_limit = 3, strict = TRUE))
unlockRessource(path = path)
tryLockRessource(path = path)
unlockRessource(path = path)

## Directory //
path <- dirname(path)
lockRessource(path = path)
tryLockRessource(path = path, try_limit = 3)
try(tryLockRessource(path = path, try_limit = 3, strict = TRUE))
unlockRessource(path = path)
tryLockRessource(path = path)
unlockRessource(path = path)

## Non-existing ressource //
expect_error(tryLockRessource(path = "abcd", strict = TRUE))

}
