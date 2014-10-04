#' @title
#' Open Directory in File System Browser
#'
#' @description 
#' Opens a directory in a file system browser
#' 
#' @param path \strong{Signature argument}. 
#' 		Object containing directory path information.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: non-existing ressources trigger error;
#'    \code{FALSE}: non-existing ressources result in return value of \code{FALSE}.
#' @template threedot
#' @example inst/examples/openRessource.r
#' @seealso \code{
#'    \link[filesystr]{openRessource-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "openRessource", 
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    strict = FALSE,
    ...
  ) {
    standardGeneric("openRessource")
  }
)

#' @title
#' Open Directory in File System Browser
#' 
#' @description 
#' See generic: \code{\link[filesystr]{openRessource}}
#' 
#' @inheritParams openRessource
#' @param path \code{\link{missing}}. 
#' @return See method
#' 		\code{\link[filesystr]{openRessource-character-method}}.
#' @example inst/examples/openRessource.r
#' @seealso \code{
#'    \link[filesystr]{openRessource}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "openRessource", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    strict,
    ...
  ) {
   
  return(openRessource(path = path, strict = strict, ...))
    
  }
)

#' @title
#' Open Directory in File System Browser
#' 
#' @description 
#' See generic: \code{\link[filesystr]{openRessource}}
#' 
#' @inheritParams openRessource
#' @param path \code{\link{character}}. File path. 
#' @return \code{\link{logical}}. \code{TRUE}: successfully opened if 
#'    ressource exists;
#'    \code{FALSE}: failed to open ressource as it does not exist.
#' @example inst/examples/openRessource.r
#' @seealso \code{
#'    \link[filesystr]{openRessource}
#' }
#' @template author
#' @template references
#' @export 
#' @import conditionr
setMethod(
  f = "openRessource", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    strict,
    ...
  ) {
  
  if (file.exists(path)) {
    if (.Platform['OS.type'] == "windows"){
      shell.exec(path)
    } else {
      system(paste(Sys.getenv("R_BROWSER"), path))
    }
    out <- TRUE
  } else {
    if (!strict) {
      out <- FALSE
    } else {
      conditionr::signalCondition(
        condition = "InvalidFileSystemRessource",
        msg = c(
          "Ressource does not exist",
          Path = path
        ),
        ns = "filesystr",
        type = "error"
      )
    }
  }
  
  return(out)
    
  }
)

