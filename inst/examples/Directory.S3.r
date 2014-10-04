\dontrun{

## Informal use (intended mainly for rapid prototyping) //
## Takes *any* object and simply changes the class attributes
Directory.S3(tempfile())  
Directory.S3(rep(tempfile(), 3))  
Directory.S3(as.list(rep(tempfile(), 3)))
Directory.S3(TRUE)  

## Formal use (explicitly using 'fields') //
Directory.S3()
Directory.S3(path = tempfile())
Directory.S3(path = rep(tempfile(), 3))
Directory.S3(path = as.list(rep(tempfile(), 3)))

## Recommended: inlcude namespace //
filesystr::Directory.S3(tempfile())

}
