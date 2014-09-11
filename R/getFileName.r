#' @title 
#' Get File Name
#' 
#' @description 
#' Returns the file name of file paths.
#'  
#' @param path \strong{Signature argument}.
#' 		Object containing path information.
#' @template threedot
#' @example inst/examples/getFileName.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getFileName-character-method}
#' }
#' @template author
#' @template references
#' @export
setGeneric(
  name = "getFileName",
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    ...
  ) {
    standardGeneric("getFileName")       
  }
)

#' @title 
#' Get File Name
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{getFileName}}
#' 
#' @inheritParams getFileName
#' @param path \code{\link{missing}}.
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/getFileName.r
#' @seealso \code{
#'    \link[rapp.core.filesys]{getFileName},
#' 		\link[rapp.core.filesys]{getFileName-character-method},
#'    \link[rapp.core.filesys]{getFileName-RappFilesystemDecomposedPathS3-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getFileName", 
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
  out <- getFileName(
    path = path, 
    ...
  )
  
  ## Return //
  return(out)
    
  }
)

#' @title 
#' Get File Name
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{getFileName}}
#' 
#' @inheritParams getFileName
#' @param path \code{\link{character}}. Vector of file paths. 
#'   	Default: see \code{\link[rapp.core.filesys]{getFileName-missing-RappCoreFilesys-RappCoreFilesys-method}}.
#' @return See method
#'    \link[rapp.core.filesys]{getFileName-RappFilesystemDecomposedPathS3-method}
#' @example inst/examples/getFileName.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getFileName},
#'   	\link[rapp.core.filesys]{getFileName-RappFilesystemDecomposedPathS3-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getFileName", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ...
  ) {
    
  ## Get file extensions //
  return(getFileName(
    path = decomposePath(path = path),
    ...
  ))
    
  }
)

#' @title 
#' Get File Name
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{getFileName}}
#' 
#' @inheritParams getFileName
#' @param path \code{\link{RappFilesystemDecomposedPathS3}}. 
#' @return \code{\link{character}}. Vector containing file names or 
#' 		\code{""} or \code{NA} for respective inputs (i.e. directory paths or
#' 		\code{NA}).
#' @example inst/examples/getFileName.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getFileName},
#' 		\link[rapp.core.filesys]{getFileName-missing-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getFileName", 
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
  
  out <- path[["filename"]]
  
  ## Transform //
  if (is.null(out) || !length(out)) {
    out <- character()
  }
  
  ## Return //
  return(out)
    
  }
)
