\dontrun{

## Informal use (intended mainly for rapid prototyping) //
## Takes *any* object and simply changes the class attributes
DecomposedPath.S3(data.frame(
  directory=tempdir(), 
  filename=basename(tempfile()), 
  extension = "")
)  
DecomposedPath.S3("anything")  

## Formal use (explicitly using 'fields') //
DecomposedPath.S3()
DecomposedPath.S3(decomposed = data.frame(
  directory=tempdir(), 
  filename=basename(tempfile()), 
  extension = "")
)

## Recommended: inlcude namespace //
filesystr::DecomposedPath.S3(decomposed = data.frame(
  directory=tempdir(), 
  filename=basename(tempfile()), 
  extension = "")
)

}
