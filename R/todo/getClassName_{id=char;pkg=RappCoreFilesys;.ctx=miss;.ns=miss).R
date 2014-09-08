#' Get Class Name(s)
#'
#' @description 
#' See generic: \code{\link[rapp.core.interface]{getClassName}}.
#' See linked method: \code{\link[rapp.core.filesys]{getClassName-character-RappCoreFilesys-RappCoreFilesys-RappCoreFilesys-method}}.
#' 
#' @section General Remarks for \code{.ctx} and \code{.ns}
#' Take into account possible non-missing values for \code{.ctx} and \code{.ns}
#' depending which application context and/or namespace you want to use the 
#' package in when you call methods of this package.
#' 
#' @param id \code{\link{character}}. Dimension: any. Class IDs.
#' @param pkg \code{\link{RappCoreFilesys}}. Dimension: 1. 
#' 		Package class instance.
#' @param type \code{\link{character}}.
#' 		Controlls the class name type, \emph{S4} (default) or \emph{S3}.
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \code{\link{missing}}.
#' @param .ns \code{\link{missing}}.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/getClassName.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getClassName-character-RappCoreFilesys-missing-missing-method}
#' }
#' @aliases getClassName
#' @aliases getClassName-character-RappCoreFilesys-missing-missing-method
#' @importFrom rapp.core.interface getClassName
#' @export

setMethod(
    f="getClassName", 
    signature=signature(
        id="character",
        pkg="RappCoreFilesys",
        .ctx="missing",
        .ns="missing"
    ), 
    definition=cmpfun(function(
        id,
        pkg,
        type=c("s4", "s3"),
        ...,
        .ctx,
        .ns
    ) {

    ## Tracing //
    if (length(as.numeric(getOption("rapp")$trace))) {
        
    }        
    
    ## Dispatch //
    out <- getClassName(
        id=id,
        pkg=pkg,
        type=type,
        ...,
        .ctx=new("RappCoreFilesys"),
        .ns=new("RappCoreFilesys")
    )
    
    ## Return //
    return(out)
    
    }, options=list(suppressAll=TRUE))
)
