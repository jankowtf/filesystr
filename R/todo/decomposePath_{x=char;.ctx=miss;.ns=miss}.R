#' Decompose Path
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{decomposePath}}.
#' See linked method: \code{\link[rapp.core.filesys]{decomposePath-character-RapppCoreFilesys-RappCoreFilesys-method}}.
#' 
#' @param x \code{\link{character}}. Vector of file paths. 
#' 		Default: files in current directory.
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \code{\link{missing}}. 
#' @param .ns \code{\link{missing}}.   
#' @return See linked method: \code{\link[rapp.core.filesys]{decomposePath-character-RapppCoreFilesys-RappCoreFilesys-method}}.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/decomposePath.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{decomposePath},
#' 		\link[rapp.core.filesys]{decomposePath-character-RappCoreFilesys-RappCoreFilesys-method}
#' }
#' @aliases decomposePath
#' @aliases decomposePath-character-missing-missing-method
#' @export

setMethod(
    f="decomposePath", 
    signature=signature(
        x="character",
        .ctx="missing",
        .ns="missing"
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
        x=x,
        ...,
        .ctx=new("RappCoreFilesys"),
        .ns=new("RappCoreFilesys")
    )
    
    ## Return //
    return(out)
    
    }, options=list(suppressAll=TRUE))
)
