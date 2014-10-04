#' @title 
#' As Decomposed Path
#'
#' @description 
#' Coerces files system ressources' paths into objects of class
#' \code{DecomposedPath.S3}.
#' 
#' @param path \strong{Signature argument}.
#'    Object containing path information.
#' @param ... Further arguments of:
#'    \code{\link[filesystr]{decomposePath}}.
#' @example inst/examples/asDecomposedPath.r
#' @seealso \code{
#'    \link[base]{asDecomposedPath-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "asDecomposedPath", 
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    ...
  ) {
  standardGeneric("asDecomposedPath")
})

#' @title 
#' As Decomposed Path
#'
#' @description 
#' See \code{\link[base]{asDecomposedPath}}
#' 
#' @inheritParams asDecomposedPath
#' @param path \code{\link{character}}.  
#' @return \code{FilePath.S3}. Identical to \code{path} with 
#'    updated class table. 
#' @example inst/examples/asDecomposedPath.r
#' @seealso \code{
#'    \link[base]{asDecomposedPath}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asDecomposedPath", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ensure,
    ...
  ) {
    
  return(decomposePath(path = path, ...))
  
  } 
)

#' @title 
#' As Decomposed Path
#'
#' @description 
#' See \code{\link[base]{asDecomposedPath}}
#' 
#' @inheritParams asDecomposedPath
#' @param path \code{\link{FilePath.S3}}.  
#' @return See method
#'    \code{\link{asDecomposedPath-character-method}}.
#' @example inst/examples/asDecomposedPath.r
#' @seealso \code{
#'    \link[base]{asDecomposedPath},
#'    \link[base]{asDecomposedPath-character-method}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asDecomposedPath", 
  signature = signature(
    path = "FilePath.S3"
  ), 
  definition = function(
    path,
    ...
  ) {
  
  return(decomposePath(path = unclass(path), ...))
    
  } 
)

#' @title 
#' As Decomposed Path
#'
#' @description 
#' See \code{\link[base]{asDecomposedPath}}
#' 
#' @inheritParams asDecomposedPath
#' @param path \code{\link{DirectoryPath.S3}}.  
#' @return See method
#'    \code{\link{asDecomposedPath-character-method}}.
#' @example inst/examples/asDecomposedPath.r
#' @seealso \code{
#'    \link[base]{asDecomposedPath},
#'    \link[base]{asDecomposedPath-character-method}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asDecomposedPath", 
  signature = signature(
    path = "DirectoryPath.S3"
  ), 
  definition = function(
    path,
    ...
  ) {
  
  return(decomposePath(path = unclass(path), ...))
    
  } 
)

#' @title 
#' As Decomposed Path
#'
#' @description 
#' See \code{\link[base]{asDecomposedPath}}
#' 
#' @inheritParams asDecomposedPath
#' @param path \code{\link{DecomposedPath.S3}}.  
#' @return See method
#'    \code{\link{asDecomposedPath-character-method}}.
#' @example inst/examples/asDecomposedPath.r
#' @seealso \code{
#'    \link[base]{asDecomposedPath},
#'    \link[base]{asDecomposedPath-character-method}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asDecomposedPath", 
  signature = signature(
    path = "DecomposedPath.S3"
  ), 
  definition = function(
    path,
    ...
  ) {
  
  return(path)
    
  } 
)

