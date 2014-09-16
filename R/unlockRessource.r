#' @title
#' Unlock File System Ressource
#'
#' @description 
#' Unlocks a file system ressource by placing a dummy file in the same directory.
#' 
#' @param path \strong{Signature argument}. 
#'   	Object containing file system path information.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: non-existing ressources trigger error;
#'    \code{FALSE}: non-existing ressources result in return value of \code{FALSE}.
#' @param ... Further arguments passed to subsequent functions/methods.
#'    In particular:
#' 		\code{\link[rapp.core.filesys]{getLockFileName}}.
#' @example inst/examples/unlockRessource.r
#' @seealso \code{
#'    \link[rapp.core.filesys]{unlockRessource-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "unlockRessource", 
  signature = c(
    "path"
  ),
  def = function(
    path,
    strict = FALSE,
    ...
  ) {
    standardGeneric("unlockRessource")
  }
)

#' @title
#' Unlock File System Ressource
#' 
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{unlockRessource}}
#' 
#' @inheritParams unlockRessource
#' @param path \code{\link{character}}. File path. 
#' @return \code{\link{character}}. Lock file name.
#' @example inst/examples/unlockRessource.r
#' @seealso \code{
#'    \link[rapp.core.filesys]{unlockRessource}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "unlockRessource", 
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
    path_lock <- gsub(basename(path), 
      getLockFileName(path=path, ...), path)
    if (file.exists(path_lock)) {
      message(sprintf("Unlocking ressource: %s", path))
      unlink(path_lock, force=TRUE)
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

