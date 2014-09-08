#' @title
#' Create Directory
#' 
#' @description 
#' Creates directory/directories. Basically, an S4 interface to 
#' \code{\link[base]{dir.create}}.
#' 
#' @param path \strong{Signature argument}.
#' 		Object containing directory information.
#' @param ... Further arguments to be passed to:
#' 		\code{\link[base]{dir.create}}.
#' @example inst/examples/ensureDirectory.r
#' @seealso \code{
#'   	\link[base]{ensureDirectory-character-method}
#' 		\link[base]{dir.create}
#' }
#' @template author
#' @template references
#' @export
setGeneric(
  name = "ensureDirectory",
  signature=c(
    "path"
  ),
  def=function(
    path,
    ...
  ) {
    standardGeneric("ensureDirectory")       
  }
)

#' @title 
#' Create Directory
#'
#' @description 
#' See \code{\link[rapp.core.filesys]{ensureDirectory}}.
#' 
#' @inheritParams ensureDirectory
#' @param path \code{\link{character}}.
#' @return \code{\link{logical}} vector. \code{TRUE} for success, \code{FALSE}
#' 		for failure.
#' @example inst/examples/ensureDirectory.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{ensureDirectory}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureDirectory", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ...
  ) {
    
  return(ensureDirectory(
    path = asDirectory(path = path),
    ...
  ))
    
  }
)

#' @title 
#' Create Directory
#'
#' @description 
#' See \code{\link[rapp.core.filesys]{ensureDirectory}}.
#' 
#' @inheritParams ensureDirectory
#' @param path \code{\link{RappFilesystemDirectoryS3}}.
#' @return \code{\link{logical}} vector. \code{TRUE} for success, \code{FALSE}
#' 		for failure.
#' @example inst/examples/ensureDirectory.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{ensureDirectory}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureDirectory", 
  signature = signature(
    path = "RappFilesystemDirectoryS3"
  ), 
  definition = function(
    path,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Create //
  out <- sapply(path, dir.create, showWarnings = FALSE, ...)
  names(out) <- normalizePath(names(out), winslash="/")
  
  ## Return //
  return(out)
    
  }
)

