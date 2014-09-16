#' @title 
#' Is File System Ressource Locked
#'
#' @description 
#' Checks if a file is locked (\code{\link[rapp.core.filesys]{isRessourceLocked}}.
#' 
#' @param path \strong{Signature argument}. 
#'    Object containing file path information.
#' @param ... Further arguments passed to subsequent functions/methods.
#'    \code{\link[rapp.core.filesys]{getLockFileName}}.
#' @example inst/examples/isRessourceLocked.r
#' @seealso \code{
#'   	\link[rapp.core.filesys]{isRessourceLocked.r-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "isRessourceLocked", 
  signature = c("path"), 
  def = function(
    path, 
    ...
  ) {
    standardGeneric("isRessourceLocked")
  }
)

#' @title 
#' Is File System Ressource Locked
#' 
#' @description
#' See generic: \code{\link[rapp.core.filesys]{isRessourceLocked}}
#' 
#' @inheritParams isRessourceLocked
#' @param path \code{\link{character}}. File path. 
#' @return \code{\link{logical}}. \code{TRUE}: locked; \code{FALSE}: not locked.
#' @example inst/examples/isRessourceLocked.r
#' @seealso \code{
#'   	\link[rapp.core.filesys]{isRessourceLocked}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.condition
setMethod(
  f = "isRessourceLocked", 
  signature = signature(path = "character"), 
  definition = function(
    path, 
    ...
  ) {
    
  if (!file.exists(path)) {
    rapp.core.condition::signalCondition(
      condition = "RessourceDoesNotExist", 
      msg = c(
        "Ressource does not exist", 
        Path = path
      ), 
      ns = "rapp.core.filesys", 
      type = "error"
    )
  }
  path_lock <- gsub(basename(path), getLockFileName(path = path, ...), path)
  
  return(file.exists(path_lock))
    
  }
)
