#' @title 
#' Get File Extension
#' 
#' @description 
#' Returns the file extension of file paths.
#'  
#' @param path \strong{Signature argument}.
#' 		Object containing file path/file name information.
#' @template threedot
#' @example inst/examples/getFileExtension.r
#' @seealso \code{
#' 		\link[filesystr]{getFileExtension-character-method}
#' }
#' @template author
#' @template references
#' @export
setGeneric(
  name = "getFileExtension",
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    ...
  ) {
    standardGeneric("getFileExtension")       
  }
)

#' @title 
#' Get File Extension
#'
#' @description 
#' See generic: \code{\link[filesystr]{getFileExtension}}
#' 
#' @inheritParams getFileExtension
#' @param path \code{\link{missing}}.
#' @references \url{http://www.rappster.de/rapp/filesystr}
#' @example inst/examples/getFileExtension.r
#' @seealso \code{
#'    \link[filesystr]{getFileExtension},
#' 		\link[filesystr]{getFileExtension-character-method},
#'    \link[filesystr]{getFileExtension-DecomposedPath.S3-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getFileExtension", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Dispatch
  out <- getFileExtension(
    path = path, 
    ...
  )
  
  ## Return //
  return(out)
    
  }
)

#' @title 
#' Get File Extension
#'
#' @description 
#' See generic: \code{\link[filesystr]{getFileExtension}}
#' 
#' @inheritParams getFileExtension
#' @param path \code{\link{character}}. Vector of file paths. 
#'   	Default: see \code{\link[filesystr]{getFileExtension-missing-RappCoreFilesys-RappCoreFilesys-method}}.
#' @return See method
#'    \link[filesystr]{getFileExtension-DecomposedPath.S3-method}
#' @example inst/examples/getFileExtension.r
#' @seealso \code{
#' 		\link[filesystr]{getFileExtension},
#'   	\link[filesystr]{getFileExtension-DecomposedPath.S3-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getFileExtension", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ...
  ) {
    
  ## Get file extensions //
  return(getFileExtension(
    path = decomposePath(path = path),
    ...
  ))
    
  }
)

#' @title 
#' Get File Extension
#'
#' @description 
#' See generic: \code{\link[filesystr]{getFileExtension}}
#' 
#' @inheritParams getFileExtension
#' @param path \code{\link{DecomposedPath.S3}}. 
#' @return \code{\link{character}}. Vector containing file extensions or 
#' 		\code{""} or \code{NA} for respective inputs (i.e. directory paths or
#' 		\code{NA}).
#' @example inst/examples/getFileExtension.r
#' @seealso \code{
#' 		\link[filesystr]{getFileExtension},
#' 		\link[filesystr]{getFileExtension-missing-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getFileExtension", 
  signature = signature(
    path = "DecomposedPath.S3"
  ), 
  definition = function(
    path,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  out <- path[["extension"]]
  
  ## Transform //
  if (is.null(out) || !length(out)) {
    out <- character()
  }
  
  ## Return //
  return(out)
    
  }
)
