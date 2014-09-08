#' Decompose Path
#' 
#' Splits a path into the directory name, filename 
#' without extension, and extension. \code{strip_extension} and 
#' \code{get_extension} provide shortcuts to the second and third parts
#' of the filename. \code{recompose_path} takes the result of 
#' \code{decompose_path} and returns complete paths. 
#'
#' @section General Remarks for \code{.ctx} and \code{.ns}
#' Take into account possible non-missing values for \code{.ctx} and \code{.ns}
#' depending which application context and/or namespace you want to use the 
#' package in when you call methods of this package.
#'  
#' @param x \strong{Signature argument}.
#' 		Object containing path information.
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \strong{Signature argument}. Application context.
#' @param .ns \strong{Signature argument}. Application namespace.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @export

setGeneric(
    name="decomposePath",
    signature=c("x", ".ctx", ".ns"),
    def=function(
        x,
        ...,
        .ctx,
        .ns
    ) {
    standardGeneric("decomposePath")       
	}
)
