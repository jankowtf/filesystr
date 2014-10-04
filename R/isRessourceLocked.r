#' @title 
#' Is File System Ressource Locked
#'
#' @description 
#' Checks if a file is locked (\code{\link[filesystr]{isRessourceLocked}}.
#' 
#' @param path \strong{Signature argument}. 
#'    Object containing file path information.
#' @param ... Further arguments passed to subsequent functions/methods.
#'    \code{\link[filesystr]{getLockFileName}}.
#' @example inst/examples/isRessourceLocked.r
#' @seealso \code{
#'   	\link[filesystr]{isRessourceLocked.r-character-method}
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
#' See generic: \code{\link[filesystr]{isRessourceLocked}}
#' 
#' @inheritParams isRessourceLocked
#' @param path \code{\link{character}}. File path. 
#' @return \code{\link{logical}}. \code{TRUE}: locked; \code{FALSE}: not locked.
#' @example inst/examples/isRessourceLocked.r
#' @seealso \code{
#'   	\link[filesystr]{isRessourceLocked}
#' }
#' @template author
#' @template references
#' @export 
#' @import conditionr
setMethod(
  f = "isRessourceLocked", 
  signature = signature(path = "character"), 
  definition = function(
    path, 
    ...
  ) {
    
  if (!file.exists(path)) {
    conditionr::signalCondition(
      condition = "RessourceDoesNotExist", 
      msg = c(
        "Ressource does not exist", 
        Path = path
      ), 
      ns = "filesystr", 
      type = "error"
    )
  }
  path_lock <- gsub(basename(path), getLockFileName(path = path, ...), path)
  
  return(file.exists(path_lock))
    
  }
)
