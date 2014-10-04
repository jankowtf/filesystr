#' @title 
#' Try to Lock Files System Ressource
#'
#' @description 
#' Locks file system ressource if it is not locked yet, else tries \code{try_limit}
#' times to lock it after it it has been made available again. If \code{try_limt}
#' is reached, either \code{FALSE} is returned or an error is thrown
#' (depends on \code{strict}).
#' 
#' @param path \strong{Signature argument}. 
#' 		Object containing file system path information.
#' @param try_limit \code{\link{numeric}}. 
#'    Limit for trying to lock ressource.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: when \code{try_limit} is reached, an error is thrown;
#'    \code{FALSE}: when \code{try_limit} is reached, method returns with \code{FALSE}.
#' @param ... Further arguments passed to subsequent functions/methods.
#'    In particular:
#' 		\code{\link[filesystr]{isRessourceLocked}, 
#'   	\link[filesystr]{lockRessource}}.
#' @example inst/examples/tryLockRessource.r
#' @seealso \code{
#'    \link[filesystr]{tryLockRessource-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "tryLockRessource", 
  signature = c(
    "path"
  ),
  def = function(
    path,
    try_limit = 100,
    strict = FALSE,
    ...
  ) {
    standardGeneric("tryLockRessource")
  }
)

#' @title 
#' Manage File System Ressource Lock Status
#' 
#' @description 
#' See generic: \code{\link[filesystr]{tryLockRessource}}
#' 
#' @inheritParams tryLockRessource
#' @param path \code{\link{character}}. File path. 
#' @return \code{\link{logical}}. \code{TRUE}: lock successful; 
#'    \code{FALSE}: lock failed.
#' @example inst/examples/tryLockRessource.r
#' @seealso \code{
#'    \link[filesystr]{tryLockRessource}
#' }
#' @template author
#' @template references
#' @export 
#' @import conditionr
setMethod(
  f = "tryLockRessource", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    try_limit,
    strict,
    ...
  ) {
    
  if (!isRessourceLocked(path = path, ...)) {
    lockRessource(path = path, ...)
    out <- TRUE
  } else {
    try_count <- 1            
    while (isRessourceLocked(path = path, ...) && try_count <= try_limit) {
      message(paste0("tryLockRessource> waiting for ressource access (", 
                     try_count, ")"))
      Sys.sleep(1)
      try_count <- try_count + 1
    }
    if (try_count >= try_limit) {
      if (!strict) {
        out <- FALSE
      } else {
        conditionr::signalCondition(
          condition = "RegistryFileIsNotAccessible",
          msg = c(
            "Ressource is not accessible or does not exist",
            Path = path,
            Tries = try_limit
          ),
          ns = "filesystr",
          type = "error"
        )
      }
    } else {
      out <- TRUE
    }    
    lockRessource(path=path, ...)
  }
  
  return(out)
    
  }
)

