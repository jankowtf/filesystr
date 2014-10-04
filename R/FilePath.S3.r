#' @title
#' Class: FilePath.S3 
#'
#' @description
#' File class (S3).
#' 
#' @template intended-use
#'
#' @param .x \code{\link{ANY}}. An object of an arbitrary class whose class
#'    attribute should be updated so that it becomes an instance of class
#'    \code{FilePath.S3}. Mainly intended for rapid prototyping 
#'    purposes
#' @field path \code{\link{character}}. File path.
#' @return Instance of class \code{FilePath.S3}.
#' @example inst/examples/FilePath.S3.r
#' @seealso \code{
#'   	\link[filesystr]{DirectoryPath.S3}
#' }
#' @template author
#' @template references
#' @export
FilePath.S3 <- function(
  .x,
  path = NA_character_
) {
  if (!missing(.x)) {
    class(.x) <- c("FilePath.S3", class(.x))
    out <- .x
  } else {
    out <- structure(
      list(path = path),
      class = c("FilePath.S3", "list")
    )
  }
  return(out)
}
