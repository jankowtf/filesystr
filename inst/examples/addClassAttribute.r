\dontrun{

obj <- "hello world!"
obj_new <- rapp.core.filesys::addClassAttribute(
  obj = obj, 
  class_name = "RappFilesystemCopyResultS3"
) 
obj_new
class(obj_new)
rapp.core.filesys::addClassAttribute(
  obj = obj, 
  class_name = "RappFilesystemCopyResultsS3"
)
rapp.core.filesys::addClassAttribute(
  obj = obj, 
  class_name = "RappFilesystemDirectoryS3"
)
rapp.core.filesys::addClassAttribute(
  obj = obj, 
  class_name = "RappFilesystemFileS3"
)

## Condition handling //
try(rapp.core.filesys::addClassAttribute(obj = obj, 
  class_name = "NonExistingClass"))

}
