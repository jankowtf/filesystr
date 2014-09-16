#' @title
#' Lock File System Ressource
#'
#' @description 
#' Lock a file by placing a dummy file in the same directory.
#' 
#' @param path \strong{Signature argument}. 
#' 		Object containing file system path information.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: non-existing ressources trigger error;
#'    \code{FALSE}: non-existing ressources result in return value of \code{FALSE}.
#' @param ... Further arguments passed to subsequent functions/methods.
#'    In particular:
#' 		\code{\link[rapp.core.filesys]{getLockFileName}}.
#' @example inst/examples/lockRessource.r
#' @seealso \code{
#'    \link[rapp.core.filesys]{lockRessource-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "lockRessource", 
  signature = c(
    "path"
  ),
  def = function(
    path,
    strict = FALSE,
    ...
  ) {
    standardGeneric("lockRessource")
  }
)

#' @title
#' Lock File System Ressource
#' 
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{lockRessource}}
#' 
#' @inheritParams lockRessource
#' @param path \code{\link{character}}. File path. 
#' @return \code{\link{character}}. Lock file name.
#' @example inst/examples/lockRessource.r
#' @seealso \code{
#'    \link[rapp.core.filesys]{lockRessource}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "lockRessource", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    strict,
    ...
  ) {
    
#   && !file.info(path)$isdir    
  if (file.exists(path)) {
#     if (!file.info(path)$isdir) {
      path_lock <- gsub(basename(path), 
        getLockFileName(path=path, ...), path)
#     } else {
#       path_lock <- file.path(path, getLockFileName(path=path, ...))
#     }
    if (!file.exists(path_lock)) {
      file.create(path_lock)
      message(sprintf("Locking ressource: %s", path))
      out <- TRUE
    } else {
      out <- FALSE
    }
  } else {
    if (!strict) {
      out <- FALSE
    } else {
      rapp.core.condition::signalCondition(
        condition = "InvalidFileSystemRessource",
        msg = c(
          "Ressource does not exist",
          Path = path
        ),
        ns = "rapp.core.filesys",
        type = "error"
      )
    }
  }
  
  return(out)
    
  }
)

