filesystr (v0.1.2)
======

Functionality for processing file system ressources

## Installation

```
require("devtools")
devtools::install_github("Rappster/conditionr")
devtools::install_github("Rappster/filesystr")
require("filesystr")
```

## Classes and coercion methods

Coerce to class `Directory.S3`

```
asDirectoryPath(tempdir())
```

Coerce to class `File.S3`

```
asFilePath(tempfile())
```

Coerce to class `DecomposedPath.S3`

```
asDecomposedPath(paste0(tempfile(), ".txt"))
```

## Copy directories

### Preparing example content

```
to <- file.path(tempdir(), "copyDirectory", c("to1", "to2"))
sapply(to, dir.create, recursive=TRUE, showWarnings=FALSE)

## Open directories in file system browser //
openRessource(to[1])
openRessource(to[2])
```

### One source directory, one target directory

```
copyDirectory(from = R.home("etc"), to = to[1])
conditionalDelete(to[1], condition = basename(tempdir()), content_only = TRUE)
```

### One source directory, two target directories

```
to <- file.path(tempdir(), "copyDirectory", c("to1", "to2"))
copyDirectory(from = R.home("etc"), to = to)
conditionalDelete(to, condition = basename(tempdir()), content_only = TRUE)
```

### Two source directories, one target directory

Combines content of 'etc' and 'tests'. If there would be any conflicts, the would result in an error as 'overwrite = FALSE'. Otherwise, existing content is overwritten.

```
copyDirectory(from = c(R.home("etc"), R.home("tests")), to = to[1])
conditionalDelete(to, condition = basename(tempdir()), content_only = TRUE)
```

### Two source directories, two targets directories

```
copyDirectory(from = c(R.home("etc"), R.home("tests")), to = to)
conditionalDelete(to, condition = basename(tempdir()), content_only = TRUE)
```

**Non-recursive copying**:
Only files directly below 'from' and actual subdirectories are copied, **not** their content.

```
copyDirectory(from = R.home("etc"), to = to[1], recursive = FALSE)
```

**Subsequent recursive copying (existing content overwritten)**:
This will add the actual content of the subdirectories.

```
copyDirectory(from = R.home("etc"), to = to[1], overwrite = TRUE)
conditionalDelete(to, condition = basename(tempdir()))
```

## Path decompositon and recomposition

Decompose paths

```
(dec_1 <- decomposePath(
  path = c(tempfile(), paste0(tempfile(), ".txt"), ".", "..", "~")
))
(dec_2 <- decomposePath(
  path = c(tempfile(), paste0(tempfile(), ".txt"), ".", "..", "~"), 
  dir_slash = TRUE
))
(dec_3 <- decomposePath(
  path = c(tempfile(), paste0(tempfile(), ".txt"), ".", "..", "~"), 
  dir_slash = TRUE, 
  shortform = TRUE
))
```
Recompose paths

```
recomposePath(dec_1)
recomposePath(dec_2)
recomposePath(dec_2, shortform = TRUE)
recomposePath(dec_3)
recomposePath(dec_3, shortform = FALSE) ## TODO
```

## Path component selectors and path standardization

Get directory path(s)

```
getDirectoryPath(tempfile()) 
## --> file interpreted as directory due to "missing" extension
getDirectoryPath(tempfile(), dir_slash = TRUE)
getDirectoryPath(paste0(tempfile(), ".txt"))

getDirectoryPath(dec_1)
getDirectoryPath(dec_2)
getDirectoryPath(dec_3)
```

Get file name(s)

```
getFileName(tempfile()) 
## --> file interpreted as directory due to "missing" extension
getFileName(tempfile(), dir_slash = TRUE) 
## TODO #1
getFileName(paste0(tempfile(), ".txt"))

getFileName(dec_1)
getFileName(dec_2)
getFileName(dec_3)
```

Get file extension(s)

```
getFileExtension(tempfile()) 
## --> file interpreted as directory due to "missing" extension
getFileExtension(tempfile(), dir_slash = TRUE) 
getFileExtension(paste0(tempfile(), ".txt"))

getFileExtension(dec_1)
getFileExtension(dec_2)
getFileExtension(dec_3)
```

Standardize path(s)

```
standardizePath(tempfile()) 
standardizePath(".")
standardizePath("..")
standardizePath("~")

standardizePath(dec_1)
## TODO #2
standardizePath(dec_2)
## TODO #2
standardizePath(dec_3)
## TODO #2
```

## File and directory locking

Lock ressource

```
path <- paste0(tempfile(), ".txt")
write("hello world!", file = path)
openRessource(dirname(path))
openRessource(path)
lockRessource(path)
## --> note '*_FILE_LOCK' file has been created
```

Unlock ressource

```
unlockRessource(path)
## --> note '*_FILE_LOCK' file has been deleted again
```

Check locked status 

```
isRessourceLocked(path)
lockRessource(path)
isRessourceLocked(path)
unlockRessource(path)
isRessourceLocked(path)
```
## Convenience functions/methods

Open file system ressource

```
openRessource(tempdir())
path <- paste0(tempfile(), ".txt")
write("hello world!", file = path)
openRessource(path)
```

-----

## Classes and constructors

Directory

```
filesystr::Directory.S3(tempdir())
```

File

```
filesystr::File.S3(tempfile())
```

Decomposed path

```
filesystr::DecomposedPath.S3(
  data.frame(
      directory = tempdir(),  
      filename = basename(tempfile()), 
      extension = ".txt"
  )
)
```