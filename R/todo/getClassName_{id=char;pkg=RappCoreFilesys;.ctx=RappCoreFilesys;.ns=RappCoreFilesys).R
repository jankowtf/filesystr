#' Get Class Name(s)
#'
#' @description 
#' See generic: \code{\link[rapp.core.interface]{getClassName}}.
#' See convenience method: \code{\link[rapp.core.filesys]{getClassName-character-RappCoreFilesys-missing-missing-method}}.
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
#' @param .ctx \code{\link{RappCoreFilesys}}.
#' @param .ns \code{\link{RappCoreFilesys}}.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/getClassName.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getClassName-character-RappCoreFilesys-missing-missing-method}
#' }
#' @aliases getClassName
#' @aliases getClassName-character-RappCoreFilesys-RappCoreFilesys-RappCoreFilesys-method
#' @importFrom rapp.core.interface getClassName
#' @export

setMethod(
    f="getClassName", 
    signature=signature(
        id="character",
        pkg="RappCoreFilesys",
        .ctx="RappCoreFilesys",
        .ns="RappCoreFilesys"
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
    
    ## Argument matching //
    type <- match.arg(type, choices=c("s4", "s3"))
    
    ## Registered classes //
    classes <- list(
        decomposed_path=list(
            s3="RappCoreFilesysDecomposedPathS3",
            s4="RappCoreFilesysDecomposedPath"
        )
    )
    
    ## Early exit upon missing/empty 'id' //
    if (!length(id)) {
        return(classes)
    }
    
    ## Indexing //
    tmp <- classes[[id]]
    out <- tmp[[type]]
    
    ## Transformation //
    if (is.null(out)) {
        out <- character()
    }
    
    ## Return //
    return(out)
    
    }, options=list(suppressAll=TRUE))
)
