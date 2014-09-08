#' Get File Extension
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{getFileExtension}}.
#' See convenience method: \code{\link[rapp.core.filesys]{getFileExtension-character-missing-missing-method}} 
#' 
#' @param x \code{\link{character}}. Vector of file paths. 
#' 		Default: see \code{\link[rapp.core.filesys]{getFileExtension-missing-RappCoreFilesys-RappCoreFilesys-method}}.
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \code{\link{RappCoreFilesys}}. 
#' @param .ns \code{\link{RappCoreFilesys}}.   
#' @return character matrix with three 
#' columns named \code{"dirname"}, \code{"filename"} and \code{"extension"}.
#' \code{strip_extension} returns a character vector of the second column,
#' and \code{get_extension} returns a character vector of the third column.
#' \code{recompose_path} returns a character vector of paths.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/getFileExtension.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getFileExtension},
#' 		\link[rapp.core.filesys]{getFileExtension-character-missing-missing-method},
#' 		\link[rapp.core.filesys]{getFileExtension-missing-RappCoreFilesys-RappCoreFilesys-method
#' }
#' @aliases getFileExtension
#' @aliases getFileExtension-character-RappCoreFilesys-RappCoreFilesys-method
#' @export

setMethod(
    f="getFileExtension", 
    signature=signature(
        x="character",
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

    ## Get file extensions //
    out <- decomposePath(x=x, .ctx=.ctx, .ns=.ns)[["extension"]]
      
    ## Transform //
    if (is.null(out) || !length(out)) {
        out <- character()
    }
    
    ## Return //
    return(out)
      
    }, options=list(suppressAll=TRUE))
)
