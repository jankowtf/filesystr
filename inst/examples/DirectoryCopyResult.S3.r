\dontrun{

## Informal use (intended mainly for rapid prototyping) //
## Takes *any* object and simply changes the class attributes
DirectoryCopyResult.S3(1)  
DirectoryCopyResult.S3(rep(1, 3))  
DirectoryCopyResult.S3(as.list(rep(1, 3)))
DirectoryCopyResult.S3(TRUE)  

## Formal use (explicitly using 'fields') //
DirectoryCopyResult.S3()
DirectoryCopyResult.S3(status = 1)
DirectoryCopyResult.S3(status = rep(1, 3))
DirectoryCopyResult.S3(status = as.list(rep(1, 3)))

## Recommended: inlcude namespace //
filesystr::DirectoryCopyResult.S3(1)

}
