#' @title
#' Class: DecomposedPath.S3 
#'
#' @description
#' Directory class (S3).
#' 
#' @template intended-use
#'
#' @param .x \code{\link{ANY}}. An object of an arbitrary class whose class
#'    attribute should be updated so that it becomes an instance of class
#'    \code{DecomposedPath.S3}. Mainly intended for rapid prototyping 
#'    purposes
#' @field decomposed \code{\link{data.frame}}. Decomposed path(s).
#' @return Instance of class \code{DecomposedPath.S3}.
#' @example inst/examples/DecomposedPath.S3.r
#' @seealso \code{
#'    \link[filesystr]{FilePath.S3},
#'   	\link[filesystr]{DirectoryPath.S3}
#' }
#' @template author
#' @template references
#' @export
DecomposedPath.S3 <- function(
  .x,
  decomposed = data.frame()
  
) {
  if (!missing(.x)) {
    class(.x) <- c("DecomposedPath.S3", class(.x))
    out <- .x
  } else {
    out <- structure(
      list(decomposed = decomposed),
      class = c("DecomposedPath.S3", "list")
    )
  }
  return(out)
}
