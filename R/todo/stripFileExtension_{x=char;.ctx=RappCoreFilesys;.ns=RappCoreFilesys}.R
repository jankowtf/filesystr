#' Get File Extension
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{stripFileExtension}}.
#' See convenience method: \code{\link[rapp.core.filesys]{stripFileExtension-character-missing-missing-method}} 
#' 
#' @param x \code{\link{character}}. Vector of file paths. 
#' 		Default: see \code{\link[rapp.core.filesys]{stripFileExtension-missing-RappCoreFilesys-RappCoreFilesys-method}}.
#' @param do.includedir \code{\link{logical}}. Dimension: 1.
#' 		\code{TRUE} means directory path is included, \code{FALSE} means it is
#' 		not.
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
#' @example inst/examples/stripFileExtension.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{stripFileExtension},
#' 		\link[rapp.core.filesys]{stripFileExtension-character-missing-missing-method},
#' 		\link[rapp.core.filesys]{stripFileExtension-missing-RappCoreFilesys-RappCoreFilesys-method
#' }
#' @aliases stripFileExtension
#' @aliases stripFileExtension-character-RappCoreFilesys-RappCoreFilesys-method
#' @export

setMethod(
    f="stripFileExtension", 
    signature=signature(
        x="character",
        .ctx="RappCoreFilesys",
        .ns="RappCoreFilesys"
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

    ## Decompose //
    decomposed <- decomposePath(
        x, 
        .ctx=.ctx, 
        .ns=.ns
    )
    if (do.includedir) {
        out <- ifelse(
            is.na(x),
            NA_character_,
            file.path(decomposed[, "dirpath"], decomposed[, "filename"])
        )
    } else {
        out <- decomposed[, "filename"]
    }
    
    if (is.logical(out)) {
        out <- character()
    }
    
    ## Return //
    return(out)
      
    }, options=list(suppressAll=TRUE))
)
