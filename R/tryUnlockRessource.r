#' @title 
#' Try to Unlock Files System Ressource
#'
#' @description 
#' Unlocks file system ressource if it is locked yet, else tries \code{try_limit}
#' times to unlock it. If \code{try_limt}
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
#' 		\code{\link[rapp.core.filesys]{isRessourceLocked}, 
#'   	\link[rapp.core.filesys]{unlockRessource}}.
#' @example inst/examples/tryUnlockRessource.r
#' @seealso \code{
#'    \link[rapp.core.filesys]{tryUnlockRessource-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "tryUnlockRessource", 
  signature = c(
    "path"
  ),
  def = function(
    path,
    try_limit = 100,
    strict = FALSE,
    ...
  ) {
    standardGeneric("tryUnlockRessource")
  }
)

#' @title 
#' Manage File System Ressource Lock Status
#' 
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{tryUnlockRessource}}
#' 
#' @inheritParams tryUnlockRessource
#' @param path \code{\link{character}}. File path. 
#' @return \code{\link{logical}}. \code{TRUE}: lock successful; 
#'    \code{FALSE}: lock failed.
#' @example inst/examples/tryUnlockRessource.r
#' @seealso \code{
#'    \link[rapp.core.filesys]{tryUnlockRessource}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.condition
setMethod(
  f = "tryUnlockRessource", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    try_limit,
    strict,
    ...
  ) {
    
  if (isRessourceLocked(path = path, ...)) {
    unlockRessource(path = path, ...)
    out <- TRUE
  } else {
    try_count <- 1            
    while (!isRessourceLocked(path = path, ...) && try_count <= try_limit) {
      message(paste0("tryUnlockRessource> waiting for ressource access (", 
                     try_count, ")"))
      Sys.sleep(1)
      try_count <- try_count + 1
    }
    if (try_count >= try_limit) {
      if (!strict) {
        out <- FALSE
      } else {
        rapp.core.condition::signalCondition(
          condition = "RegistryFileIsNotAccessible",
          msg = c(
            "Ressource is not accessible or does not exist",
            Path = path,
            Tries = try_limit
          ),
          ns = "rapp.core.filesys",
          type = "error"
        )
      }
    } else {
      out <- TRUE
    }    
    unlockRessource(path=path, ...)
  }
  
  return(out)
    
  }
)

