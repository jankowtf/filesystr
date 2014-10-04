#' @title 
#' As File Path
#'
#' @description 
#' Turns a \code{character} object denoting a file path into an object 
#' of class \code{File.S3}.
#' 
#' @param path \strong{Signature argument}.
#'    Object containing file path information.
#' @param ensure \code{logical}.
#'    Ensure file existence (\code{TRUE}) or not (\code{FALSE}, default).
#' @param ... Further arguments of:
#'    \code{\link[filesystr]{asFilePath}}.
#' @example inst/examples/asFilePath.r
#' @seealso \code{
#'    \link[base]{asFilePath-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "asFilePath", 
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    ensure = FALSE,
    ...
  ) {
  standardGeneric("asFilePath")
})

#' @title 
#' As File
#'
#' @description 
#' See \code{\link[base]{asFilePath}}
#' 
#' @inheritParams asFilePath
#' @param path \code{\link{character}}.  
#' @return \code{File.S3}. Identical to \code{path} with 
#'    updated class table. 
#' @example inst/examples/asFilePath.r
#' @seealso \code{
#'    \link[base]{asFilePath}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asFilePath", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ensure,
    ...
  ) {
    
  return(asFilePath(
    path = filesystr::File.S3(path),
    ensure = ensure,
    ...
  ))
  
  } 
)

#' @title 
#' As File
#'
#' @description 
#' See \code{\link[base]{asFilePath}}
#' 
#' @inheritParams asFilePath
#' @param path \code{\link{File.S3}}.  
#' @return See method
#'    \code{\link{asFilePath-character-method}}.
#' @example inst/examples/asFilePath.r
#' @seealso \code{
#'    \link[base]{asFilePath},
#'    \link[base]{asFilePath-character-method}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asFilePath", 
  signature = signature(
    path = "File.S3"
  ), 
  definition = function(
    path,
    ensure,
    ...
  ) {
  
  if (ensure) {
    ensureDirectory(path = dirname(path), ...)
    file.create(path, showWarnings = FALSE)
  }    
  path
    
  } 
)
