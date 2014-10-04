#' @title 
#' Conditional Delete
#'
#' @description 
#' Deletes file system ressource based on a condition.
#' 
#' @param path \strong{Signature argument}.
#'    Object containing file system location information.
#' @param condition \strong{Signature argument}.
#'    Object containing condition information.
#' @param content_only \code{\link{logical}}.
#'    Only relevant if \code{path} corresponds to a directory path.
#'    \code{TRUE}: only delete directory content, not the directory itself;
#'    \code{FALSE}: delete entire directory.
#' @template threedot
#' @example inst/examples/conditionalDelete.r
#' @seealso \code{
#'    \link[base]{conditionalDelete-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "conditionalDelete", 
  signature = c(
    "path",
    "condition"
  ),
  def = function(
    path,
    condition,
    content_only = FALSE,
    ...
  ) {
  standardGeneric("conditionalDelete")
})

#' @title 
#' Conditional Delete
#'
#' @description 
#' See \code{\link[base]{conditionalDelete}}
#' 
#' @inheritParams conditionalDelete
#' @param path \code{\link{character}}.  
#' @param condition \code{\link{character}}. 
#' @return See method 
#'    \code{\link[filesystr]{conditionalDelete-character-character-method}}
#' @example inst/examples/conditionalDelete.r
#' @seealso \code{
#'    \link[base]{conditionalDelete}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "conditionalDelete", 
  signature = signature(
    path = "character",
    condition = "character"
  ), 
  definition = function(
    path,
    condition,
    content_only,
    ...
  ) {
  
  out <- sapply(path, function(ii) {
    out <- FALSE
    if (file.exists(ii)) {
      is_dir <- file.info(ii)$isdir
      if (grepl(condition, ii)) {
        out <- !as.logical(unlink(ii, recursive = TRUE, force = TRUE))        
        if (out && is_dir && content_only) {
          Sys.sleep(0.01)
          dir.create(ii, recursive = TRUE, showWarnings = FALSE)
        }
      }
    }
    out
  })
  return(out)
  
  } 
)

