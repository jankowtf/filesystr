#' @title
#' Class: File.S3 
#'
#' @description
#' File class (S3).
#' 
#' @template intended-use
#'
#' @param .x \code{\link{ANY}}. An object of an arbitrary class whose class
#'    attribute should be updated so that it becomes an instance of class
#'    \code{File.S3}. Mainly intended for rapid prototyping 
#'    purposes
#' @field path \code{\link{character}}. File path.
#' @return Instance of class \code{File.S3}.
#' @example inst/examples/File.S3.r
#' @seealso \code{
#'   	\link[filesystr]{Directory.S3}
#' }
#' @template author
#' @template references
#' @export
File.S3 <- function(
  .x,
  path = NA_character_
) {
  if (!missing(.x)) {
    class(.x) <- c("File.S3", class(.x))
    out <- .x
  } else {
    out <- structure(
      list(path = path),
      class = c("File.S3", "list")
    )
  }
  return(out)
}
