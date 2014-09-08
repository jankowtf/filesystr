#' Decompose Path
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{decomposePath}}.
#' 
#' @param x \code{\link{missing}}. Vector of file paths. 
#' 		Default: files in current directory.
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \code{\link{RappCoreFilesys}}. 
#' @param .ns \code{\link{RappCoreFilesys}}.   
#' @return See linked method: \code{\link[rapp.core.filesys]{decomposePath-character-RapppCoreFilesys-RappCoreFilesys-method}}.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/decomposePath.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{decomposePath},
#' 		\link[rapp.core.filesys]{decomposePath-character-RappCoreFilesys-RappCoreFilesys-method}
#' }
#' @aliases decomposePath
#' @aliases decomposePath-missing-RappCoreFilesys-RappCoreFilesys-method
#' @export

setMethod(
    f="decomposePath", 
    signature=signature(
        x="missing",
        .ctx="RappCoreFilesys",
        .ns="RappCoreFilesys"
    ), 
    definition=cmpfun(function(
        x,
        ...,
        .ctx,
        .ns
    ) {

    ## Tracing //
    if (length(as.numeric(getOption("rapp")$trace))) {
        
    }        
    
    ## Dispatch //
    out <- decomposePath(
        x=dir(),
        ...,
        .ctx=.ctx,
        .ns=.ns
    )
    
    ## Return //
    return(out)
    
    }, options=list(suppressAll=TRUE))
)
