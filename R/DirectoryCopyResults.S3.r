#' @title
#' Class: DirectoryCopyResults.S3 
#'
#' @description
#' Copy result class (S3).
#' 
#' @template intended-use
#'
#' @param .x \code{\link{ANY}}. An object of an arbitrary class whose class
#'    attribute should be updated so that it becomes an instance of class
#'    \code{DirectoryCopyResults.S3}. Mainly intended for rapid prototyping 
#'    purposes
#' @field ... A collection of instances of class 
#'    \code{\link[filesystr]{DirectoryCopyResult.S3}}.
#' @return Instance of class \code{DirectoryCopyResults.S3}.
#' @example inst/examples/DirectoryCopyResults.S3.r
#' @seealso \code{
#'     \link[filesystr]{DirectoryCopyResult.S3}
#' }
#' @template author
#' @template references
#' @export
DirectoryCopyResults.S3 <- function(
  ...,
  .x
) {
  if (!missing(.x)) {
    class(.x) <- c("DirectoryCopyResults.S3", class(.x))
    out <- .x
  } else {
    out <- structure(
      list(collection = list(...)),
      class = c("DirectoryCopyResults.S3", "list")
    )
  }
  return(out)
}
