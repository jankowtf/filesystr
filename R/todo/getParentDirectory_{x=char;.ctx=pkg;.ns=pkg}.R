#' Get Path of Parent Directory (Vectorized)
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{getParentDirectory}}.
#' See convenience method: 
#' \code{\link[rapp.core.filesys]{getParentDirectory-character-missing-missing-method}}.
#' 
#' @note 
#' The function is multi-vectorized: arguments \code{x} and \code{up}
#' (see \code{\link[base]{mapply}}. 
#' 
#' @param x \code{\link{character}}. Dimension: any. Directories.
#' @param up \code{\link{numeric}}. Dimension: 1
#' 		Number of levels to go up (relative to the initial directory).
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \code{\link{RappCoreFilesys}}. 
#' @param .ns \code{\link{RappCoreFilesys}}.   
#' @return \code{\link{character}}. A vector containing paths of parent
#' 		directories based on \code{up}.
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/getParentDirectory.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getParentDirectory},
#' 		\link[rapp.core.filesys]{getParentDirectory-character-missing-missing-method}
#' }
#' @aliases getParentDirectory
#' @aliases getParentDirectory-character-RappCoreFilesys-RappCoreFilesys-method
#' @export


setMethod(
    f="getParentDirectory", 
    signature=signature(
        x="character",
        .ctx="RappCoreFilesys",
        .ns="RappCoreFilesys"
    ), 
    definition=cmpfun(function(
        x,
        up,
        ...,
        .ctx,
        .ns
    ) {
    # Easier, but introduces dependency //
#    stringr::str_count(string=x, pattern="/")
            
    ## Tracing //
    if (length(as.numeric(getOption("rapp")$trace))) {
        
    }  
    .getParentDirectory <- function(x, up) {            
        idx <- unlist(gregexpr("/", x))
        if (all(is.na(idx))) {
            out <- character()
        } else {
            idx <- length(idx)
            if (up > (idx + 1)) {
                signalCondition_rapp.core.filesys(
                    subclass="InvalidParentDirectoryScope",
                    msg=c(
                        "Parent directory scope exceeds path components",
                        "Path"=x,
                        "Up"=up
                    ),
                    type="error"
                )
            }
            out <- x
            for (ii in 1:up) {
                out <- dirname(out)
            }
        }
        out
    }
    out <- mapply(
        .getParentDirectory,
        x=x,
        up=up,
        ...,
        USE.NAMES=FALSE
    )
    return(out)
    
    }, options=list(suppressAll=TRUE))
)
