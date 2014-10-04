#' @title 
#' As File Path
#'
#' @description 
#' Turns a \code{character} object denoting a file path into an object 
#' of class \code{FilePath.S3}.
#' 
#' @param path \strong{Signature argument}.
#'    Object containing file path information.
#' @param ensure \code{logical}.
#'    Ensure file existence (\code{TRUE}) or not (\code{FALSE}, default).
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: \code{path} must exist and be a file;
#'    \code{FALSE}: no prior checks. If \code{ensure = TRUE} then this is 
#'    automatically set to \code{FALSE}.
#' @param ... Further arguments of:
#'    \code{\link[filesystr]{asFilePath}}.
#' @example inst/examples/asFilePath.r
#' @seealso \code{
#'    \link[base]{asFilePath-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "asFilePath", 
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    ensure = FALSE,
    strict = FALSE,
    ...
  ) {
  standardGeneric("asFilePath")
})

#' @title 
#' As File Path
#'
#' @description 
#' See \code{\link[base]{asFilePath}}
#' 
#' @inheritParams asFilePath
#' @param path \code{\link{character}}.  
#' @return \code{FilePath.S3}. Identical to \code{path} with 
#'    updated class table. 
#' @example inst/examples/asFilePath.r
#' @seealso \code{
#'    \link[base]{asFilePath}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asFilePath", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ensure,
    strict,
    ...
  ) {
    
  return(asFilePath(
    path = filesystr::FilePath.S3(standardizePath(path)),
    ensure = ensure,
    strict = strict,
    ...
  ))
  
  } 
)

#' @title 
#' As File Path
#'
#' @description 
#' See \code{\link[base]{asFilePath}}
#' 
#' @inheritParams asFilePath
#' @param path \code{\link{FilePath.S3}}.  
#' @return See method
#'    \code{\link{asFilePath-character-method}}.
#' @example inst/examples/asFilePath.r
#' @seealso \code{
#'    \link[base]{asFilePath},
#'    \link[base]{asFilePath-character-method}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "asFilePath", 
  signature = signature(
    path = "FilePath.S3"
  ), 
  definition = function(
    path,
    ensure,
    strict,
    ...
  ) {
  
  if (ensure) {
    strict <- FALSE
    ensureDirectory(path = dirname(path), ...)
    file.create(path, showWarnings = FALSE)
  }    
  if (strict) {
    is_file <- !file.info(path)$isdir
    if (is.na(is_file) || !is_file) {
      conditionr::signalCondition(
        condition = "NoAFilePath",
        msg = c(
          "Not a file path",
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
