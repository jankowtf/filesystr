\dontrun{

obj <- "hello world!"
obj_new <- filesystr::addClassAttribute(
  obj = obj, 
  class_name = "RappFilesystemCopyResultS3"
) 
obj_new
class(obj_new)
filesystr::addClassAttribute(
  obj = obj, 
  class_name = "RappFilesystemCopyResultsS3"
)
filesystr::addClassAttribute(
  obj = obj, 
  class_name = "RappFilesystemDecomposedPathS3"
)
filesystr::addClassAttribute(
  obj = obj, 
  class_name = "RappFilesystemDirectoryS3"
)
filesystr::addClassAttribute(
  obj = obj, 
  class_name = "RappFilesystemFileS3"
)

## Condition handling //
try(filesystr::addClassAttribute(obj = obj, 
  class_name = "NonExistingClass"))

}
