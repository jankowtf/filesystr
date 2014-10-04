#' @title 
#' Get Directory Path
#' 
#' @description 
#' Returns the directory path of paths of file system ressources.
#'  
#' @param path \strong{Signature argument}.
#' 		Object containing path information.
#' @param ... Further arguments passed to:
#'    \code{\link[filesystr]{decomposePath}}
#' @example inst/examples/getDirectoryPath.r
#' @seealso \code{
#' 		\link[filesystr]{getDirectoryPath-character-method}
#' }
#' @template author
#' @template references
#' @export
setGeneric(
  name = "getDirectoryPath",
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    ...
  ) {
    standardGeneric("getDirectoryPath")       
  }
)

#' @title 
#' Get Directory Path
#'
#' @description 
#' See generic: \code{\link[filesystr]{getDirectoryPath}}
#' 
#' @inheritParams getDirectoryPath
#' @param path \code{\link{missing}}.
#' @references \url{http://www.rappster.de/rapp/filesystr}
#' @example inst/examples/getDirectoryPath.r
#' @seealso \code{
#'    \link[filesystr]{getDirectoryPath},
#' 		\link[filesystr]{getDirectoryPath-character-method},
#'    \link[filesystr]{getDirectoryPath-DecomposedPath.S3-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getDirectoryPath", 
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
  out <- getDirectoryPath(
    path = path, 
    ...
  )
  
  ## Return //
  return(out)
    
  }
)

#' @title 
#' Get Directory Path
#'
#' @description 
#' See generic: \code{\link[filesystr]{getDirectoryPath}}
#' 
#' @inheritParams getDirectoryPath
#' @param path \code{\link{character}}. Vector of file paths. 
#'   	Default: see \code{\link[filesystr]{getDirectoryPath-missing-RappCoreDirectorysys-RappCoreDirectorysys-method}}.
#' @return See method
#'    \link[filesystr]{getDirectoryPath-DecomposedPath.S3-method}
#' @example inst/examples/getDirectoryPath.r
#' @seealso \code{
#' 		\link[filesystr]{getDirectoryPath},
#'   	\link[filesystr]{getDirectoryPath-DecomposedPath.S3-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getDirectoryPath", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ...
  ) {
    
  ## Get file extensions //
  return(getDirectoryPath(
    path = decomposePath(path = path, ...),
    ...
  ))
    
  }
)

#' @title 
#' Get Directory Path
#'
#' @description 
#' See generic: \code{\link[filesystr]{getDirectoryPath}}
#' 
#' @inheritParams getDirectoryPath
#' @param path \code{\link{DecomposedPath.S3}}. 
#' @return \code{\link{character}}. Vector containing file names or 
#' 		\code{""} or \code{NA} for respective inputs (i.e. directory paths or
#' 		\code{NA}).
#' @example inst/examples/getDirectoryPath.r
#' @seealso \code{
#' 		\link[filesystr]{getDirectoryPath},
#' 		\link[filesystr]{getDirectoryPath-missing-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getDirectoryPath", 
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
  
  out <- path[["directory"]]
  
  ## Transform //
  if (is.null(out) || !length(out)) {
    out <- character()
  }
  
  ## Return //
  return(out)
    
  }
)
