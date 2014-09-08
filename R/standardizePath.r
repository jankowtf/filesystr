#' @title 
#' Standardize Path
#' 
#' @description 
#' Standardizes paths of file system ressources.
#'
#' @param path \strong{Signature argument}.
#' 		Object containing path information.
#' @param sep \code{\link{character}}. 
#' 		String separator betwen directory levels in the output.
#' @template threedot
#' @example inst/examples/standardizePath.r
#' @seealso \code{
#'    \link[rapp.core.filesys]{standardizePath-character-method}
#' }
#' @template author
#' @template references
#' @export
setGeneric(
  name = "standardizePath",
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    sep = c("/", "\\"),
    ...
  ) {
    standardGeneric("standardizePath")       
  }
)

#' @title 
#' Standardize Path
#' 
#' @description 
#' See \code{\link[rapp.core.filesys]{standardizePath}}.
#' 
#' @inheritParams standardizePath
#' @param path \code{\link{character}}. Vector of file paths. 
#'   	Default: files in current directory.
#' @param sep \code{\link{character}}. 
#' 		String separator betwen directory levels in the output.
#' @return \code{\link{matrix}} with three 
#'    columns named \code{"dirname"}, \code{"filename"} and \code{"extension"}.
#'    \code{strip_extension} returns a character vector of the second column,
#'    and \code{get_extension} returns a character vector of the third column.
#' \code{recompose_path} returns a character vector of paths.
#' @example inst/examples/standardizePath.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{standardizePath}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "standardizePath", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    sep,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  sep <- match.arg(sep)
  out <- ifelse(
    is.na(path),
    NA_character_,
    #        normalizePath(path.expand(path), winslash=sep, mustWork=FALSE)
    normalizePath(path, winslash = sep, mustWork = FALSE)
  )
  if (!length(out)) {
    out <- character()
  }
  
  ## Return //
  return(out)
    
  }
)

#' @title 
#' Standardize Path
#' 
#' @description 
#' See \code{\link[rapp.core.filesys]{standardizePath}}.
#' 
#' @inheritParams standardizePath
#' @param path \code{\link{missing}}. 
#' @param sep \code{\link{character}}. 
#'   	String separator betwen directory levels in the output.
#' @return See method 
#'    \code{\link[rapp.core.filesys]{standardizePath-character-method}}.
#' @example inst/examples/standardizePath.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{standardizePath}
#' 		\link[rapp.core.filesys]{standardizePath-character-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "standardizePath", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    sep,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Dispatch //
  out <- standardizePath(
#     path = list.files(path),
    path = path,
    sep = sep,
    ...
  )
  
  ## Return //
  return(out)
    
  }
)

