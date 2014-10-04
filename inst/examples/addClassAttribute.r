\dontrun{

obj <- "hello world!"
obj_new <- filesystr::addClassAttribute(
  obj = obj, 
  class_name = "CopyResult.S3"
) 
obj_new
class(obj_new)
filesystr::addClassAttribute(
  obj = obj, 
  class_name = "CopyResults.S3"
)
filesystr::addClassAttribute(
  obj = obj, 
  class_name = "RappFilesystemDecomposedPathS3"
)
filesystr::addClassAttribute(
  obj = obj, 
  class_name = "Directory.S3"
)
filesystr::addClassAttribute(
  obj = obj, 
  class_name = "File.S3"
)

## Condition handling //
try(filesystr::addClassAttribute(obj = obj, 
  class_name = "NonExistingClass"))

}
