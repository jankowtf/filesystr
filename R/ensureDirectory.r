#' @title
#' Create Directory
#' 
#' @description 
#' Creates directory/directories. Basically, an S4 interface to 
#' \code{\link[base]{dir.create}}.
#' 
#' @param path \strong{Signature argument}.
#' 		Object containing directory information.
#' @param strict \code{\link{logical}}.
#'    Should certain conditions trigger an error (\code{TRUE}) or simply result
#'    in a return value of \code{FALSE} (\code{FALSE}, default).
#' @param ... Further arguments to be passed to:
#' 		\code{\link[base]{dir.create}}.
#' @example inst/examples/ensureDirectory.r
#' @seealso \code{
#'   	\link[base]{ensureDirectory-character-method}
#' 		\link[base]{dir.create}
#' }
#' @template author
#' @template references
#' @export
setGeneric(
  name = "ensureDirectory",
  signature=c(
    "path"
  ),
  def=function(
    path,
    strict,
    ...
  ) {
    standardGeneric("ensureDirectory")       
  }
)

#' @title 
#' Create Directory
#'
#' @description 
#' See \code{\link[filesystr]{ensureDirectory}}.
#' 
#' @inheritParams ensureDirectory
#' @param path \code{\link{character}}.
#' @return \code{\link{logical}} vector. \code{TRUE} for success, \code{FALSE}
#' 		for failure.
#' @example inst/examples/ensureDirectory.r
#' @seealso \code{
#' 		\link[filesystr]{ensureDirectory}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureDirectory", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    strict, 
    ...
  ) {
    
  out <- ensureDirectory(
    path = asDirectoryPath(path = path),
    strict = strict,
    ...
  )
  out

  }
)

#' @title 
#' Create Directory
#'
#' @description 
#' See \code{\link[filesystr]{ensureDirectory}}.
#' 
#' @inheritParams ensureDirectory
#' @param path \code{\link{Directory.S3}}.
#' @return \code{\link{logical}} vector. \code{TRUE} for success, \code{FALSE}
#' 		for failure.
#' @example inst/examples/ensureDirectory.r
#' @seealso \code{
#' 		\link[filesystr]{ensureDirectory}
#' }
#' @template author
#' @template references
#' @export
#' @import conditionr
setMethod(
  f = "ensureDirectory", 
  signature = signature(
    path = "Directory.S3"
  ), 
  definition = function(
    path,
    strict,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Create //
  out <- withRestarts(
    {
      tmp <- sapply(path, dir.create, recursive = TRUE, showWarnings = FALSE, ...)
#       print("DEBUG")
      out <- rep(TRUE, length(path))
      names(out) <- names(tmp)
      out
    },
    warning = function(cond) {
      invokeRestart("muffleWarning")
    },
    error = function(cond) {
      if (strict) {
        conditionr::signalCondition(
          condition = "DirectoryEnsuranceFailed",
          msg = c(
            "Failed to ensure directory",
            "Actual message" = conditionMessage(cond)
          ),
          ns = "filesystr",
          type = "error"
        )
      } else {
        out <- rep(FALSE, length(path))
        names(out) <- path
        out
      }
    }
  )
  names(out) <- normalizePath(names(out), winslash="/", mustWork = FALSE)
  
  ## Return //
  return(out)
    
  }
)

