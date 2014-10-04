#' @title
#' Get Path of Parent Directory
#' 
#' @description 
#' Gets the path of a directorie's parent directory. 
#' Argument \code{up} controls how many levels to go up relative
#' to the initial directory.
#' 
#' @param path \strong{Signature argument}.
#' 		Object containing path information.
#' @param up \code{\link{numeric}}. Dimension: 1
#' 		Number of levels to go up (relative to the initial directory).
#' @template threedot
#' @example inst/examples/getParentDirectory.r
#' @seealso \code{
#'   	\link[filesystr]{getParentDirectory},
#' 		\link[filesystr]{getParentDirectory-character-method}
#' }
#' @template author
#' @template references
#' @export
setGeneric(
  name = "getParentDirectory",
  signature = c(
    "path"
  ),
  def = function(
    path,
    up = 1,
    ...
  ) {
    standardGeneric("getParentDirectory")       
  }
)

#' @title 
#' Get Path of Parent Directory (Vectorized)
#'
#' @description 
#' See generic: \code{\link[filesystr]{getParentDirectory}}.
#' 
#' @note 
#' The function is multi-vectorized: arguments \code{x} and \code{up}
#' (see \code{\link[base]{mapply}}. 
#' 
#' @inheritParams getParentDirectory
#' @param path \code{\link{character}}. Dimension: any.
#'    Paths of file system ressources.
#' @param up \code{\link{numeric}}. Dimension: 1
#'    Number of levels to go up (relative to the initial directory).
#' @return \code{\link{character}}. A vector containing paths of parent
#' 		directories based on \code{up}.
#' @example inst/examples/getParentDirectory.r
#' @seealso \code{
#' 		\link[filesystr]{getParentDirectory}
#' }
#' @template author
#' @template references
#' @export
#' @import conditionr
setMethod(
  f = "getParentDirectory", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    up,
    ...
  ) {
  # Easier, but introduces dependency //
  #    stringr::str_count(string=path, pattern="/")
  
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace))) {
#     
#   } 
  path <- standardizePath(path = path)
  .getParentDirectory <- function(path, up) {            
    idx <- unlist(gregexpr("/", path))
    if (all(is.na(idx))) {
      out <- character()
    } else {
      idx <- length(idx)
      if (up > (idx + 1)) {
        conditionr::signalCondition(
          condition="InvalidParentDirectoryScope",
          msg=c(
            "Parent directory scope exceeds path components",
            Path = path,
            Up = up
          ),
          ns = "filesystr",
          type="error"
        )
      }
      out <- path
      for (ii in 1:up) {
        out <- dirname(out)
      }
    }
    out
  }
  out <- mapply(
    .getParentDirectory,
    path=path,
    up=up,
    ...,
    USE.NAMES=FALSE
  )
  return(out)
    
  }
)

