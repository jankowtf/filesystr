\dontrun{

## Informal use (intended mainly for rapid prototyping) //
## Takes *any* object and simply changes the class attributes
DirectoryPath.S3(tempfile())  
DirectoryPath.S3(rep(tempfile(), 3))  
DirectoryPath.S3(as.list(rep(tempfile(), 3)))
DirectoryPath.S3(TRUE)  

## Formal use (explicitly using 'fields') //
DirectoryPath.S3()
DirectoryPath.S3(path = tempfile())
DirectoryPath.S3(path = rep(tempfile(), 3))
DirectoryPath.S3(path = as.list(rep(tempfile(), 3)))

## Recommended: inlcude namespace //
filesystr::DirectoryPath.S3(tempfile())

}
