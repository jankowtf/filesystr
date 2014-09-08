#' Get File Extension
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{getFileExtension}}.
#' See convenience method: \code{\link[rapp.core.filesys]{getFileExtension-character-RappCoreFilesys-RappCoreFilesys-method}} 
#' 
#' @param x \code{\link{missing}}.
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \code{\link{RappCoreFilesys}}. 
#' @param .ns \code{\link{RappCoreFilesys}}.   
#' @return See \code{\link[rapp.core.filesys]{getFileExtension-character-RappCoreFilesys-RappCoreFilesys-method}}
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/getFileExtension.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getFileExtension},
#' 		\link[rapp.core.filesys]{getFileExtension-missing-missing-missing-method},
#' 		\link[rapp.core.filesys]{getFileExtension-missing-RappCoreFilesys-RappCoreFilesys-method
#' }
#' @aliases getFileExtension
#' @aliases getFileExtension-missing-RappCoreFilesys-RappCoreFilesys-method
#' @export

setMethod(
    f="getFileExtension", 
    signature=signature(
        x="missing",
        .ctx="RappCoreFilesys",
        .ns="RappCoreFilesys"
    ), 
    definition=cmpfun(function(
        x=dir(),
        ...,
        .ctx,
        .ns
    ) {

    ## Tracing //
    if (length(as.numeric(getOption("rapp")$trace))) {
      
    }        

    ## Dispatch
    out <- getFileExtension(
        x=dir(), 
        ...,
        .ctx=.ctx, 
        .ns=.ctx
    )
    
    ## Return //
    return(out)
      
    }, options=list(suppressAll=TRUE))
)
