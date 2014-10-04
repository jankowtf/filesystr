\dontrun{

## Informal use (intended mainly for rapid prototyping) //
## Takes *any* object and simply changes the class attributes
File.S3(tempfile())  
File.S3(rep(tempfile(), 3))  
File.S3(as.list(rep(tempfile(), 3)))
File.S3(TRUE)  

## Formal use (explicitly using 'fields') //
File.S3()
File.S3(path = tempfile())
File.S3(path = rep(tempfile(), 3))
File.S3(path = as.list(rep(tempfile(), 3)))

## Recommended: inlcude namespace //
filesystr::File.S3(tempfile())

}
