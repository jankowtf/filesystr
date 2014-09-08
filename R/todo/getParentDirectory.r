#' Get Path of Parent Directory
#' 
#' @description 
#' Gets the path of a directorie's parent directory. 
#' Argument \code{up} controls how many levels to go up relative
#' to the initial directory.
#' 
#' @param x \strong{Signature argument}.
#' 		Object containing path information.
#' @param up \code{\link{numeric}}. Dimension: 1
#' 		Number of levels to go up (relative to the initial directory).
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \strong{Signature argument}. Application context.
#' @param .ns \strong{Signature argument}. Application namespace.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @export

setGeneric(
    name="getParentDirectory",
    signature=c("x", ".ctx", ".ns"),
    def=function(
        x,
        up=1,
        ...,
        .ctx,
        .ns
    ) {
    standardGeneric("getParentDirectory")       
	}
)
