#' @title 
#' As Directory
#'
#' @description 
#' Turns a \code{character} object denoting a directory path into an object 
#' of class \code{RappFilesystemDirectory3}.
#' 
#' @param path \strong{Signature argument}.
#'    Object containing path information.
#' @param ensure \code{logical}.
#'    Ensure Directory existence (\code{TRUE}) or not (\code{FALSE}, default).
#' @param ... Further arguments passed to:
#'    \code{\link[rapp.core.filesys]{ensureDirectory}}.
#' @example inst/examples/asDirectory.r
#' @seealso \code{
#'    \link[base]{asDirectory-character-method},
#' 		\link[rapp.core.filesys]{ensureDirectory}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "asDirectory", 
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    ensure = FALSE,
    ...
  ) {
  standardGeneric("asDirectory")
})

#' @title 
#' As Directory
#'
#' @description 
#' See \code{\link[base]{asDirectory}}
#' 
#' @inheritParams asDirectory
#' @param path \code{\link{missing}}.  
#' @return \code{RappFilesystemDirectoryS3}. Identical to \code{path} with 
#'    updated class table. 
#' @example inst/examples/asDirectory.r
#' @seealso \code{
#'    \link[base]{asDirectory-character-method},
#'     \link[rapp.core.filesys]{ensureDirectory}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asDirectory", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    ensure,
    ...
  ) {
    
  return(asDirectory(
    path = path,
    ensure = ensure,
    ...
  ))
    
  } 
)

#' @title 
#' As Directory
#'
#' @description 
#' See \code{\link[base]{asDirectory}}
#' 
#' @inheritParams asDirectory
#' @param path \code{\link{character}}.  
#' @return \code{RappFilesystemDirectoryS3}. Identical to \code{path} with 
#'    updated class table. 
#' @example inst/examples/asDirectory.r
#' @seealso \code{
#'    \link[base]{asDirectory},
#'   	\link[rapp.core.filesys]{ensureDirectory}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asDirectory", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ensure,
    ...
  ) {
    
  return(asDirectory(
    path = rapp.core.filesys::addClassAttribute(
      obj = path, 
      class_name = "RappFilesystemDirectoryS3"
    ),
    ensure = ensure,
    ...
  ))
  
  } 
)

#' @title 
#' As Directory
#'
#' @description 
#' See \code{\link[base]{asDirectory}}
#' 
#' @inheritParams asDirectory
#' @param path \code{\link{RappFilesystemDirectoryS3}}.  
#' @return See method
#'    \code{\link{asDirectory-character-method}}.
#' @example inst/examples/asDirectory.r
#' @seealso \code{
#'    \link[base]{asDirectory},
#'    \link[base]{asDirectory-character-method},
#'     \link[rapp.core.filesys]{ensureDirectory}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asDirectory", 
  signature = signature(
    path = "RappFilesystemDirectoryS3"
  ), 
  definition = function(
    path,
    ensure,
    ...
  ) {
  
  if (ensure) {
    ensureDirectory(path = path, ...)
  }    
  path
    
  } 
)
