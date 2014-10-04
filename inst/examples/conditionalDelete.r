\dontrun{

## Example content //
path <- file.path(tempdir(), "conditionalDelete/dir")    
dir.create(path, recursive = TRUE, showWarnings = FALSE)
file.create(file.path(path, paste0("file", 1:3)))

## Delete file if its in a directory that is a subdirectory of 
## the temp directory //
fpath <- file.path(path, "file1")
conditionalDelete(path = fpath, condition = basename(tempdir()))
file.exists(fpath)
file.exists(path)

## When condition is not met //
fpath <- file.path(path, "file2")
conditionalDelete(path = fpath, condition = "abcd")
file.exists(fpath)

## Delete *content* of directory if its a subdirectory of the temp directory //
conditionalDelete(path = path, condition = basename(tempdir()), 
  content_only = TRUE)
file.exists(path)

## Delete directory if its a subdirectory of the temp directory //
conditionalDelete(path = path, condition = basename(tempdir()))
file.exists(path)

}
