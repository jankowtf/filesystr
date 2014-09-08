#' Get File Extension
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{stripFileExtension}}.
#' See linked method: \code{\link[rapp.core.filesys]{stripFileExtension-character-RappCoreFilesys-RappCoreFilesys-method}} 
#' 
#' @param x \code{\link{character}}. Vector of file paths. 
#' 		Default: see \code{\link[rapp.core.filesys]{stripFileExtension-missing-RappCoreFilesys-RappCoreFilesys-method}}.
#' @param do.includedir \code{\link{logical}}. Dimension: 1.
#' 		\code{TRUE} means directory path is included, \code{FALSE} means it is
#' 		not.
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \code{\link{missing}}. 
#' @param .ns \code{\link{missing}}.   
#' @return See \code{\link[rapp.core.filesys]{stripFileExtension-character-RappCoreFilesys-RappCoreFilesys-method}}
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/stripFileExtension.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{stripFileExtension},
#' 		\link[rapp.core.filesys]{stripFileExtension-character-RappCoreFilesys-RappCoreFilesys-method},
#' 		\link[rapp.core.filesys]{stripFileExtension-missing-missing-missing-method
#' }
#' @aliases stripFileExtension
#' @aliases stripFileExtension-character-missing-missing-method
#' @export

setMethod(
    f="stripFileExtension", 
    signature=signature(
        x="character",
        .ctx="missing",
        .ns="missing"
    ), 
    definition=cmpfun(function(
        x,
        do.includedir=TRUE,
        ...,
        .ctx,
        .ns
    ) {

    ## Tracing //
    if (length(as.numeric(getOption("rapp")$trace))) {
      
    }        

    ## Dispatch
    out <- stripFileExtension(
        x=x, 
        do.includedir=do.includedir,
        ...,
        .ctx=new("RappCoreFilesys"), 
        .ns=new("RappCoreFilesys")
    )
      
    ## Return //
    return(out)
      
    }, options=list(suppressAll=TRUE))
)
