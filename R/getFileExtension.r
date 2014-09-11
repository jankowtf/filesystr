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
#' 		\link[rapp.core.filesys]{getFileExtension-character-method}
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
#' See generic: \code{\link[rapp.core.filesys]{getFileExtension}}
#' 
#' @inheritParams getFileExtension
#' @param path \code{\link{missing}}.
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/getFileExtension.r
#' @seealso \code{
#'    \link[rapp.core.filesys]{getFileExtension},
#' 		\link[rapp.core.filesys]{getFileExtension-character-method},
#'    \link[rapp.core.filesys]{getFileExtension-RappFilesystemDecomposedPathS3-method}
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
#' See generic: \code{\link[rapp.core.filesys]{getFileExtension}}
#' 
#' @inheritParams getFileExtension
#' @param path \code{\link{character}}. Vector of file paths. 
#'   	Default: see \code{\link[rapp.core.filesys]{getFileExtension-missing-RappCoreFilesys-RappCoreFilesys-method}}.
#' @return See method
#'    \link[rapp.core.filesys]{getFileExtension-RappFilesystemDecomposedPathS3-method}
#' @example inst/examples/getFileExtension.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getFileExtension},
#'   	\link[rapp.core.filesys]{getFileExtension-RappFilesystemDecomposedPathS3-method}
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
#' See generic: \code{\link[rapp.core.filesys]{getFileExtension}}
#' 
#' @inheritParams getFileExtension
#' @param path \code{\link{RappFilesystemDecomposedPathS3}}. 
#' @return \code{\link{character}}. Vector containing file extensions or 
#' 		\code{""} or \code{NA} for respective inputs (i.e. directory paths or
#' 		\code{NA}).
#' @example inst/examples/getFileExtension.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getFileExtension},
#' 		\link[rapp.core.filesys]{getFileExtension-missing-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getFileExtension", 
  signature = signature(
    path = "RappFilesystemDecomposedPathS3"
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
