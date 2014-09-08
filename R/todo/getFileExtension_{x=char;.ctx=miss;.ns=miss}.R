#' Get File Extension
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{getFileExtension}}.
#' See linked method: \code{\link[rapp.core.filesys]{getFileExtension-character-RappCoreFilesys-RappCoreFilesys-method}} 
#' 
#' @param x \code{\link{character}}. Vector of file paths. 
#' 		Default: see \code{\link[rapp.core.filesys]{getFileExtension-missing-RappCoreFilesys-RappCoreFilesys-method}}.
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \code{\link{missing}}. 
#' @param .ns \code{\link{missing}}.   
#' @return See \code{\link[rapp.core.filesys]{getFileExtension-character-RappCoreFilesys-RappCoreFilesys-method}}
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/getFileExtension.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getFileExtension},
#' 		\link[rapp.core.filesys]{getFileExtension-character-RappCoreFilesys-RappCoreFilesys-method},
#' 		\link[rapp.core.filesys]{getFileExtension-missing-missing-missing-method
#' }
#' @aliases getFileExtension
#' @aliases getFileExtension-character-missing-missing-method
#' @export

setMethod(
    f="getFileExtension", 
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

    ## Dispatch
    out <- getFileExtension(
        x=x, 
        ...,
        .ctx=new("RappCoreFilesys"), 
        .ns=new("RappCoreFilesys")
    )
      
    ## Return //
    return(out)
      
    }, options=list(suppressAll=TRUE))
)
