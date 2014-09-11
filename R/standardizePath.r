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
#' @param shortform \code{\link{logical}}. Dimension: 1.
#'   	Use shortforms (\code{TRUE}) for \code{getwd()} (i.e. \code{"."}, 
#' 		\code{dirname(getwd()} (i.e. \code{".."} and \code{HOME} (i.e. \code{"~"})
#' 		or not (\code{FALSE}, default).
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
    shortform = FALSE,
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
#' @param path \code{\link{missing}}. 
#' @param sep \code{\link{character}}. 
#'     String separator betwen directory levels in the output.
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
    shortform,
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
    shortform = shortform,
    ...
  )
  
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
    shortform,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  path <- gsub("/$", "", path)
  sep <- match.arg(sep, c("/", "\\"))
  out <- ifelse(
    is.na(path),
    NA_character_,
    #        normalizePath(path.expand(path), winslash=sep, mustWork=FALSE)
    normalizePath(path, winslash = sep, mustWork = FALSE)
  )
  if (!length(out)) {
    out <- character()
  }
  
#   ## Ensure "" is transformed to NA //
#   ## This seems to be a more consistent choice for use cases
#   if (length(idx <- which(out == ""))) {
#     out[idx] <- NA_character_
#   }

  if (shortform) {
    out <- gsub(paste0("^", normalizePath(path.expand("~"), 
      winslash="/")), "~", out)
    out[which(out == getwd())] <- "."
    out[which(out == dirname(getwd()))] <- ".."
    out <- gsub(paste0("^", getwd(), "/"), "", out)
    out <- gsub(paste0("^", dirname(getwd()), "/"), "../", out)
#     out <- gsub(paste0("^", normalizePath(path.expand("~"), 
#       winslash="/"), "/"), "~/", out)
  }
  
  ## Return //
  return(out)
    
  }
)
