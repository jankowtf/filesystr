#' Recompose Path Components
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{recomposePath}}.
#' See linked method: \code{\link[rapp.core.filesys]{recomposePath-RappCoreFilesysDecomposedPathS3-RappCoreFilesys-RappCoreFilesys-method}} 
#' 
#' @param x \code{\link{RappCoreFilesysDecomposedPathS3}}.
#' @param use.shortform \code{\link{logical}}. Dimension: 1.
#' 		\code{TRUE} means the short forms for \code{getwd()} (i.e. \code{"."}, 
#' 		\code{dirname(getwd()} (i.e. \code{".."} and \code{HOME} (i.e. \code{"~"})
#' 		are used, \code{FALSE} means they are not used.
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \code{\link{missing}}. 
#' @param .ns \code{\link{missing}}.   
#' @return See \code{\link[rapp.core.filesys]{recomposePath-RappCoreFilesysDecomposedPathS3-RappCoreFilesys-RappCoreFilesys-method}}
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/recomposePath.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{recomposePath},
#' 		\link[rapp.core.filesys]{recomposePath-RappCoreFilesysDecomposedPathS3-RappCoreFilesys-RappCoreFilesys-method},
#' 		\link[rapp.core.filesys]{decomposePath}
#' }
#' @aliases recomposePath
#' @aliases recomposePath-RappCoreFilesysDecomposedPathS3-missing-missing-method
#' @export

setMethod(
    f="recomposePath", 
    signature=signature(
        x="RappCoreFilesysDecomposedPathS3",
        .ctx="missing",
        .ns="missing"
    ), 
    definition=cmpfun(function(
        x,
        use.shortform=FALSE,
        ...,
        .ctx,
        .ns
    ) {

    ## Tracing //
    if (length(as.numeric(getOption("rapp")$trace))) {
      
    }        

    ## Dispatch
    out <- recomposePath(
        x=x,
        use.shortform=use.shortform,
        ...,
        .ctx=new("RappCoreFilesys"), 
        .ns=new("RappCoreFilesys")
    )
      
    ## Return //
    return(out)
      
    }, options=list(suppressAll=TRUE))
)
