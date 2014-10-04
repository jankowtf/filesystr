\dontrun{

## Informal use (intended mainly for rapid prototyping) //
## Takes *any* object and simply changes the class attributes  
DirectoryCopyResults.S3(
  .x = list(
    DirectoryCopyResult.S3(),
    DirectoryCopyResult.S3(),
    DirectoryCopyResult.S3()
  )
)  
DirectoryCopyResults.S3(.x = TRUE)  

## Formal use (explicitly using 'fields') //
DirectoryCopyResults.S3()
DirectoryCopyResults.S3(
  DirectoryCopyResult.S3(),
  DirectoryCopyResult.S3(),
  DirectoryCopyResult.S3()
)  

## Recommended: inlcude namespace //
filesystr::DirectoryCopyResults.S3(DirectoryCopyResult.S3())

}
