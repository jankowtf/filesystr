#' @title
#' Class: DirectoryPath.S3 
#'
#' @description
#' Directory class (S3).
#' 
#' @template intended-use
#'
#' @param .x \code{\link{ANY}}. An object of an arbitrary class whose class
#'    attribute should be updated so that it becomes an instance of class
#'    \code{DirectoryPath.S3}. Mainly intended for rapid prototyping 
#'    purposes
#' @field path \code{\link{character}}. Directory path.
#' @return Instance of class \code{DirectoryPath.S3}.
#' @example inst/examples/DirectoryPath.S3.r
#' @seealso \code{
#'   	\link[filesystr]{FilePath.S3}
#' }
#' @template author
#' @template references
#' @export
DirectoryPath.S3 <- function(
  .x,
  path = NA_character_
  
) {
  if (!missing(.x)) {
    class(.x) <- c("DirectoryPath.S3", class(.x))
    out <- .x
  } else {
    out <- structure(
      list(path = path),
      class = c("DirectoryPath.S3", "list")
    )
  }
  return(out)
}
