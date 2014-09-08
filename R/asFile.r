#' @title 
#' As File
#'
#' @description 
#' Turns a \code{character} object denoting a file path into an object 
#' of class \code{RappFilesystemFileS3}.
#' 
#' @param path \strong{Signature argument}.
#'    Object containing file path information.
#' @param ensure \code{logical}.
#'    Ensure file existence (\code{TRUE}) or not (\code{FALSE}, default).
#' @template threedot
#' @example inst/examples/asFile.r
#' @seealso \code{
#'    \link[base]{asFile-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "asFile", 
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    ensure = FALSE,
    ...
  ) {
  standardGeneric("asFile")
})

#' @title 
#' As File
#'
#' @description 
#' See \code{\link[base]{asFile}}
#' 
#' @inheritParams asFile
#' @param path \code{\link{character}}.  
#' @return \code{RappFilesystemFileS3}. Identical to \code{path} with 
#'    updated class table. 
#' @example inst/examples/asFile.r
#' @seealso \code{
#'    \link[base]{asFile}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asFile", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ensure,
    ...
  ) {
    
  return(asFile(
    path = rapp.core.filesys::addClassAttribute(
      obj = path, 
      class_name = "RappFilesystemFileS3"
    ),
    ensure = ensure,
    ...
  ))
  
  } 
)

#' @title 
#' As File
#'
#' @description 
#' See \code{\link[base]{asFile}}
#' 
#' @inheritParams asFile
#' @param path \code{\link{RappFilesystemFileS3}}.  
#' @return See method
#'    \code{\link{asFile-character-method}}.
#' @example inst/examples/asFile.r
#' @seealso \code{
#'    \link[base]{asFile},
#'    \link[base]{asFile-character-method}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asFile", 
  signature = signature(
    path = "RappFilesystemFileS3"
  ), 
  definition = function(
    path,
    ensure,
    ...
  ) {
  
  if (ensure) {
    dir.create(dirname(path), recursive = TRUE, showWarnings = FALSE)
    file.create(path, showWarnings = FALSE)
  }    
  path
    
  } 
)
