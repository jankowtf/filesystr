\dontrun{

## Informal use (intended mainly for rapid prototyping) //
## Takes *any* object and simply changes the class attributes
FilePath.S3(tempfile())  
FilePath.S3(rep(tempfile(), 3))  
FilePath.S3(as.list(rep(tempfile(), 3)))
FilePath.S3(TRUE)  

## Formal use (explicitly using 'fields') //
FilePath.S3()
FilePath.S3(path = tempfile())
FilePath.S3(path = rep(tempfile(), 3))
FilePath.S3(path = as.list(rep(tempfile(), 3)))

## Recommended: inlcude namespace //
filesystr::FilePath.S3(tempfile())

}
