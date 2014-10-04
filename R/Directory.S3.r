#' @title
#' Class: Directory.S3 
#'
#' @description
#' Directory class (S3).
#' 
#' @template intended-use
#'
#' @param .x \code{\link{ANY}}. An object of an arbitrary class whose class
#'    attribute should be updated so that it becomes an instance of class
#'    \code{Directory.S3}. Mainly intended for rapid prototyping 
#'    purposes
#' @field path \code{\link{character}}. Directory path.
#' @return Instance of class \code{Directory.S3}.
#' @example inst/examples/Directory.S3.r
#' @seealso \code{
#'   	\link[filesystr]{File.S3}
#' }
#' @template author
#' @template references
#' @export
Directory.S3 <- function(
  .x,
  path = NA_character_
  
) {
  if (!missing(.x)) {
    class(.x) <- c("Directory.S3", class(.x))
    out <- .x
  } else {
    out <- structure(
      list(path = path),
      class = c("Directory.S3", "list")
    )
  }
  return(out)
}
