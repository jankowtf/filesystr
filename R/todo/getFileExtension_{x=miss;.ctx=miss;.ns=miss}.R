#' Get File Extension
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{getFileExtension}}.
#' See linked method: \code{\link[rapp.core.filesys]{getFileExtension-missing-RappCoreFilesys-RappCoreFilesys-method}} 
#' 
#' @param x \code{\link{missing}}.
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \code{\link{missing}}. 
#' @param .ns \code{\link{missing}}.   
#' @return See \code{\link[rapp.core.filesys]{getFileExtension-missing-RappCoreFilesys-RappCoreFilesys-method}}
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/getFileExtension.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getFileExtension},
#' 		\link[rapp.core.filesys]{getFileExtension-missing-RappCoreFilesys-RappCoreFilesys-method}
#' }
#' @aliases getFileExtension
#' @aliases getFileExtension-missing-missing-missing-method
#' @export

setMethod(
    f="getFileExtension", 
    signature=signature(
        x="missing",
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

    ## Dispatch
    out <- getFileExtension(
        ...,
        .ctx=new("RappCoreFilesys"), 
        .ns=new("RappCoreFilesys")
    )
      
    ## Return //
    return(out)
      
    }, options=list(suppressAll=TRUE))
)
