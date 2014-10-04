#' @title 
#' As Directory Path
#'
#' @description 
#' Turns a \code{character} object denoting a directory path into an object 
#' of class \code{RappFilesystemDirectory3}.
#' 
#' @param path \strong{Signature argument}.
#'    Object containing path information.
#' @param ensure \code{logical}.
#'    Ensure Directory existence (\code{TRUE}) or not (\code{FALSE}, default).
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: \code{path} must exist and be a directory;
#'    \code{FALSE}: no prior checks. If \code{ensure = TRUE} then this is 
#'    automatically set to \code{FALSE}.
#' @param ... Further arguments passed to:
#'    \code{\link[filesystr]{ensureDirectory}}.
#' @example inst/examples/asDirectoryPath.r
#' @seealso \code{
#'    \link[base]{asDirectoryPath-character-method},
#' 		\link[filesystr]{ensureDirectory}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "asDirectoryPath", 
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    ensure = FALSE,
    strict = FALSE,
    ...
  ) {
  standardGeneric("asDirectoryPath")
})

#' @title 
#' As Directory Path
#'
#' @description 
#' See \code{\link[base]{asDirectoryPath}}
#' 
#' @inheritParams asDirectoryPath
#' @param path \code{\link{missing}}.  
#' @return \code{Directory.S3}. Identical to \code{path} with 
#'    updated class table. 
#' @example inst/examples/asDirectoryPath.r
#' @seealso \code{
#'    \link[base]{asDirectoryPath-character-method},
#'     \link[filesystr]{ensureDirectory}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asDirectoryPath", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    ensure,
    strict,
    ...
  ) {
    
  return(asDirectoryPath(
    path = path,
    ensure = ensure,
    strict = strict,
    ...
  ))
    
  } 
)

#' @title 
#' As Directory Path
#'
#' @description 
#' See \code{\link[base]{asDirectoryPath}}
#' 
#' @inheritParams asDirectoryPath
#' @param path \code{\link{character}}.  
#' @return \code{Directory.S3}. Identical to \code{path} with 
#'    updated class table. 
#' @example inst/examples/asDirectoryPath.r
#' @seealso \code{
#'    \link[base]{asDirectoryPath},
#'   	\link[filesystr]{ensureDirectory}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asDirectoryPath", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ensure,
    strict,
    ...
  ) {
    
  return(asDirectoryPath(
    path = filesystr::Directory.S3(standardizePath(path)),
    ensure = ensure,
    strict = strict,
    ...
  ))
  
  } 
)

#' @title 
#' As Directory Path
#'
#' @description 
#' See \code{\link[base]{asDirectoryPath}}
#' 
#' @inheritParams asDirectoryPath
#' @param path \code{\link{Directory.S3}}.  
#' @return See method
#'    \code{\link{asDirectoryPath-character-method}}.
#' @example inst/examples/asDirectoryPath.r
#' @seealso \code{
#'    \link[base]{asDirectoryPath},
#'    \link[base]{asDirectoryPath-character-method},
#'     \link[filesystr]{ensureDirectory}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asDirectoryPath", 
  signature = signature(
    path = "Directory.S3"
  ), 
  definition = function(
    path,
    ensure,
    strict,
    ...
  ) {
  
  if (ensure) {
    strict <- FALSE
    ensureDirectory(path = path, ...)
  }    
  if (strict) {
    is_dir <- file.info(path)$isdir
    if (is.na(is_dir) || !is_dir) {
      conditionr::signalCondition(
        condition = "NoADirectoryPath",
        msg = c(
          "Not a directory path",
          Path = path
        ),
        ns = "filesystr",
        type = "error"
      )
    }
  }
  path
    
  } 
)
