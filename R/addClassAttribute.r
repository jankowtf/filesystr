#' @title 
#' Add Class Attribute
#'
#' @description 
#' Adds class attribute to an object and returns it.
#' 
#' @param obj \strong{Signature argument}.
#'    Object to be updated.
#' @param class_name \strong{Signature argument}.
#'    Object containing class name information.
#' @example inst/examples/addClassAttribute.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{addClassAttribute-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "addClassAttribute", 
  signature = c(
    "obj",
    "class_name"
  ),
  def = function(
    obj,
    class_name
  ) {
  standardGeneric("addClassAttribute")
})

#' @title 
#' Add Class Attribute
#'
#' @description 
#' See \code{\link[rapp.core.filesys]{addClassAttribute}}.
#' 
#' @inheritParams addClassAttribute
#' @param obj \code{\link{ANY}}.  
#' @param class_name \code{\link{character}}.  
#' @return Object with updated class graph (\code{c(<class_name>, <class>)}) 
#' 		with the first entry corresponding to \code{class_name}.
#' @seealso \code{
#' 		\link[rapp.core.filesys]{addClassAttribute}
#' }
#' @template author
#' @template references
#' @export
setMethod(f = "addClassAttribute", 
  signature = signature(
    obj = "ANY",
    class_name = "character"
  ), 
  definition = function(
    obj,
    class_name
  ) {
      
  class_name <- match.arg(
    class_name,
    choices = c(
      "RappFilesystemCopyResultS3",
      "RappFilesystemCopyResultsS3",
      "RappFilesystemDecomposedPathS3",
      "RappFilesystemDirectoryS3",
      "RappFilesystemFileS3"
    )
  )
  class(obj) <- unique(c(class_name, class(obj)))
  obj
    
  } 
)

