#' Recompose Path Components
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{recomposePath}}.
#' See convenience method: \code{\link[rapp.core.filesys]{recomposePath-RappCoreFilesysDecomposedPathS3-missing-missing-method}} 
#' 
#' @param x \code{\link{RappCoreFilesysDecomposedPathS3}}. 
#' 		Decomposed path object as returned by 
#' 		\code{\link[rapp.core.filesys]{decomposePath}}.
#' @param use.shortform \code{\link{logical}}. Dimension: 1.
#' 		\code{TRUE} means the short forms for \code{getwd()} (i.e. \code{"."}, 
#' 		\code{dirname(getwd()} (i.e. \code{".."} and \code{HOME} (i.e. \code{"~"})
#' 		are used, \code{FALSE} means they are not used.
#' @param ... Further arguments to be passed to subsequent functions.
#' @param .ctx \code{\link{RappCoreFilesys}}. 
#' @param .ns \code{\link{RappCoreFilesys}}.   
#' @return \code{\link{character}}. Vector of paths (directories and/or 
#' 		files).
#' @author Janko Thyson \email{janko.thyson@@rappster.de}
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/recomposePath.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{recomposePath},
#' 		\link[rapp.core.filesys]{recomposePath-RappCoreFilesysDecomposedPathS3-missing-missing-method},
#' 		\link[rapp.core.filesys]{decomposePath}
#' }
#' @aliases recomposePath
#' @aliases recomposePath-RappCoreFilesysDecomposedPathS3-RappCoreFilesys-RappCoreFilesys-method
#' @importFrom assertive is_not_na
#' @export

setMethod(
    f="recomposePath", 
    signature=signature(
        x="RappCoreFilesysDecomposedPathS3",
        .ctx="RappCoreFilesys",
        .ns="RappCoreFilesys"
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

    not_missing <- assertive::is_not_na(x[, "filename"])
    
    has_an_extension <- nzchar(x[not_missing, "extension"])
    has_dirpath <- nzchar(x[not_missing, "dirpath"])
    out <- rep.int(NA_character_, nrow(x))
    base_x <- ifelse(
        has_an_extension,
        paste(x[not_missing, "filename"], x[not_missing, "extension"], sep = "."),
        x[not_missing, "filename"]
    )
    has_base <- nzchar(base_x)
#    out[not_missing] <- file.path(x[not_missing, "dirpath"], base_x)
    out[not_missing] <- ifelse(
        has_base,
        file.path(x[not_missing, "dirpath"], base_x),
        ifelse(
            has_dirpath,
            x[not_missing, "dirpath"],
            ""
        )
    )
    if (use.shortform) {
        out[which(out == getwd())] <- "."
        out[which(out == dirname(getwd()))] <- ".."
        out <- gsub(paste0("^", getwd(), "/"), "", out)
        out <- gsub(paste0("^", normalizePath(path.expand("~"), 
            winslash="/"), "/"), "~/", out)
    }
    ## Return //
    return(out)
      
    }, options=list(suppressAll=TRUE))
)
