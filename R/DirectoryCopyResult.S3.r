#' @title
#' Class: DirectoryCopyResult.S3 
#'
#' @description
#' Copy result class (S3).
#' 
#' @template intended-use
#'
#' @param .x \code{\link{ANY}}. An object of an arbitrary class whose class
#'    attribute should be updated so that it becomes an instance of class
#'    \code{DirectoryCopyResult.S3}. Mainly intended for rapid prototyping 
#'    purposes
#' @field from \code{\link{character}}. Copy source location.
#' @field to \code{\link{character}}. Copy target location.
#' @field status \code{\link{numeric}}. Copy result.
#' \itemize{
#'    \item{\code{0}: }{Failure}
#'    \item{\code{1}: }{Success}
#' }
#' @return Instance of class \code{DirectoryCopyResult.S3}.
#' @example inst/examples/DirectoryCopyResult.S3.r
#' @seealso \code{
#'   	\link[DirectoryCopyResultsystr]{FilePath.S3}
#' }
#' @template author
#' @template references
#' @export
DirectoryCopyResult.S3 <- function(
  .x,
  from = character(),
  to = character(),
  status = numeric()
) {
  if (!missing(.x)) {
    class(.x) <- c("DirectoryCopyResult.S3", class(.x))
    out <- .x
  } else {
    out <- structure(
      list(from = from, to = to, status = status),
      class = c("DirectoryCopyResult.S3", "list")
    )
  }
  return(out)
}
