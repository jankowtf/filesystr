#' Recompose Path Components
#' 
#' @description 
#' Recomposes path components as returned by 
#' \code{\link[rapp.core.filesys]{recomposePath}}.
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
    name="recomposePath",
    signature=c("x", ".ctx", ".ns"),
    def=function(
        x,
        ...,
        .ctx,
        .ns
    ) {
    standardGeneric("recomposePath")       
	}
)
