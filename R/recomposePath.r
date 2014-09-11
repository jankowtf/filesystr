#' @title
#' Recompose Path 
#' 
#' @description 
#' Recomposes path components as returned by 
#' \code{\link[rapp.core.filesys]{decomposePath}} to complete paths.
#'
#' @param path \strong{Signature argument}.
#' 		Object containing path information.
#' @template threedot
#' @example inst/examples/recomposePath.R
#' @seealso \code{
#'    \link[rapp.core.filesys]{recomposePath-RappFilesystemDecomposePathS3-method},
#'    \link[rapp.core.filesys]{decomposePath}
#' }
#' @template author
#' @template references
#' @export

setGeneric(
  name = "recomposePath",
  signature = c(
    "path"
  ),
  def = function(
    path,
    shortform = FALSE,
    ...
  ) {
    standardGeneric("recomposePath")       
  }
)

#' @title 
#' Recompose Path
#'
#' @description 
#' See \code{\link[rapp.core.filesys]{recomposePath}}.
#' 
#' @inheritParams recomposePath
#' @param path \code{\link{RappFilesystemDecomposedPathS3}}. 
#'   	Decomposed path object as returned by 
#' 		\code{\link[rapp.core.filesys]{decomposePath}}.
#' @param shortform \code{\link{logical}}. Dimension: 1.
#' 		\code{TRUE} means the short forms for \code{getwd()} (i.e. \code{"."}, 
#' 		\code{dirname(getwd()} (i.e. \code{".."} and \code{HOME} (i.e. \code{"~"})
#' 		are used, \code{FALSE} means they are not used.
#' @return \code{\link{character}}. Vector of paths (directories and/or 
#' 		files).
#' @example inst/examples/recomposePath.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{recomposePath},
#' 		\link[rapp.core.filesys]{decomposePath}
#' }
#' @template author
#' @template references
#' @export
#' @importFrom assertive is_not_na
setMethod(
  f = "recomposePath", 
  signature = signature(
    path = "RappFilesystemDecomposedPathS3"
  ), 
  definition = function(
    path,
    shortform,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  not_missing <- assertive::is_not_na(path[, "filename"])
  
  has_ext <- nzchar(path[not_missing, "extension"])
  has_dir <- nzchar(path[not_missing, "directory"])
  out <- rep.int(NA_character_, nrow(path))
  base_path <- ifelse(
    has_ext,
    paste(path[not_missing, "filename"], 
          path[not_missing, "extension"], sep = "."),
    path[not_missing, "filename"]
  )
  has_base <- nzchar(base_path)
  #    out[not_missing] <- file.path(path[not_missing, "directory"], base_path)
  out[not_missing] <- ifelse(
    has_base,
    file.path(path[not_missing, "directory"], base_path),
    ifelse(
      has_dir,
      path[not_missing, "directory"],
      ""
    )
  )
  if (shortform) {
    out <- gsub(paste0("^", normalizePath(path.expand("~"), 
      winslash="/")), "~", out)
    out[which(out == getwd())] <- "."
    out[which(out == dirname(getwd()))] <- ".."
    out <- gsub(paste0("^", getwd(), "/"), "", out)
    out <- gsub(paste0("^", getwd(), "/"), "..", out)
    out <- gsub(paste0("^", dirname(getwd()), "/"), "../", out)
#     out <- gsub(paste0("^", normalizePath(path.expand("~"), 
#       winslash="/"), "/"), "~/", out)
  }
  ## Return //
  return(out)
    
  }
)
