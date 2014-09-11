#' @title 
#' Strip File Extension
#' 
#' @description 
#' Strips file extensions.
#'  
#' @param path \strong{Signature argument}.
#' 		Object containing file path/file name information.
#' @param include_dir \code{\link{logical}}. Dimension: 1.
#' 		Inlcude directory path (\code{TRUE}, default) or not (\code{FALSE}).
#' @param ... Further arguments passed to subsequent functions/methods.
#'    In particular:
#'    \code{\link[rapp.core.filesys]{decomposePath}}
#' @example inst/examples/stripFileExtension.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{stripFileExtension-character-method}
#' }
#' @template author
#' @template references
#' @export
setGeneric(
  name = "stripFileExtension",
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    include_dir = TRUE,
    ...
  ) {
    standardGeneric("stripFileExtension")       
  }
)

#' @title
#' Get File Extension
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{stripFileExtension}}.
#' 
#' @inheritParams stripFileExtension
#' @param path \code{\link{missing}}.
#' @param include_dir \code{\link{logical}}. Dimension: 1.
#'   	\code{TRUE} means directory path is included, \code{FALSE} means it is
#' 		not.
#' @return See method
#'    \code{\link[rapp.core.filesys]{stripFileExtension-character-method}}
#' @example inst/examples/stripFileExtension.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{stripFileExtension},
#' 		\link[rapp.core.filesys]{stripFileExtension-character-method}
#' }
#' @template author
#' @template references
#' @export

setMethod(
  f = "stripFileExtension", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path = ".",
    include_dir,
    ...
  ) {
  
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Dispatch
  out <- stripFileExtension(
    path = path, 
    include_dir = include_dir,
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
#' See generic: \code{\link[rapp.core.filesys]{stripFileExtension}}.
#' 
#' @inheritParams stripFileExtension
#' @param path \code{\link{missing}}.
#' @param include_dir \code{\link{logical}}. Dimension: 1.
#'     \code{TRUE} means directory path is included, \code{FALSE} means it is
#' 		not.
#' @return See method
#'    \code{\link[rapp.core.filesys]{stripFileExtension-character-method}}
#' @example inst/examples/stripFileExtension.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{stripFileExtension},
#' 		\link[rapp.core.filesys]{stripFileExtension-missing-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "stripFileExtension", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    include_dir,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Decompose //
  decomposed <- decomposePath(path = path, ...)
  if (include_dir) {
    out <- ifelse(
      is.na(path),
      NA_character_,
      ifelse(decomposed[, "filename"] != "", 
        file.path(decomposed[, "directory"], decomposed[, "filename"]),
        ""
      )
    )
  } else {
    out <- decomposed[, "filename"]
  }
  
  if (is.logical(out)) {
    out <- character()
  }
  
  ## Fix "/"
  idx <- which(path == "")
  if (length(idx)) {
    out[idx] <- ""
  }
  
  ## Return //
  return(out)
    
  }
)
