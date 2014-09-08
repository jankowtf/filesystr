#' Get Parent Directory
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{getParentDirectory}}.
#' See linked method: 
#' \code{\link[rapp.core.filesys]{getParentDirectory-character--RappCoreFilesys-RappCoreFilesys-method}}.
#' 
#' @note 
#' The function is multi-vectorized: arguments \code{x} and \code{up}
#' (see \code{\link[base]{mapply}}.
#' 
#' @param x \code{\link{character}}. Source directory.
#' @param up \code{\link{numeric}}. Dimension: 1
#' 		Number of levels to go up (relative to the initial directory).
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \code{\link{missing}}. 
#' @param .ns \code{\link{missing}}.   
#' @return See linked method: \code{\link[rapp.core.filesys]{getParentDirectory-character--RappCoreFilesys-RappCoreFilesys-method}}.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/getParentDirectory.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getParentDirectory},
#' 		\link[rapp.core.filesys]{getParentDirectory-character--RappCoreFilesys-RappCoreFilesys-method}
#' }
#' @aliases getParentDirectory
#' @aliases getParentDirectory-character--missing-missing-method
#' @export

setMethod(
    f="getParentDirectory", 
    signature=signature(
        x="character",
        .ctx="missing",
        .ns="missing"
    ), 
    definition=cmpfun(function(
        x,
        up,
        ...,
        .ctx,
        .ns
    ) {

    ## Tracing //
    if (length(as.numeric(getOption("rapp")$trace))) {
        
    }        
    
    ## Dispatch //
    out <- getParentDirectory(
        x=x,
        up=up,
        ...,
        .ctx=new("RappCoreFilesys"),
        .ns=new("RappCoreFilesys")
    )
    
    ## Return //
    return(out)
    
    }, options=list(suppressAll=TRUE))
)
