#' Decompose Path
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{decomposePath}}.
#' 
#' @param x \code{\link{character}}. Vector of file paths. 
#' 		Default: files in current directory.
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
#' @example inst/examples/decomposePath.R
#' @seealso \code{
#' 		\link[rapp.core.filesys]{decomposePath},
#' 		\link[rapp.core.filesys]{decomposePath-missing-missing-missing-method}
#' }
#' @aliases decomposePath
#' @aliases decomposePath-character-RappCoreFilesys-RappCoreFilesys-method
#' @importFrom assertive is_not_na
#' @importFrom assertive is_dir
#' @importFrom assertive is_empty
#' @importFrom stringr str_detect
#' @importFrom stringr fixed
#' @importFrom stringr str_match
#' @export

setMethod(
    f="decomposePath", 
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

    ## Early exit if 'x' is empty //
    if(assertive::is_empty(x)) {
        out <- data.frame(
            original=NA_character_,
            dirpath=NA_character_,
            filename=NA_character_,
            extension=NA_character_
        )
        out <- out[-1,]
        out <- structure(out, 
            class=c(
                getClassName(id="decomposed_path", pkg=.ctx, type="s3", 
                    .ctx=.ctx, .ns=.ns), 
                class(out))
        )
        return(out)
    }
    
    ## Original //
    original_x <- x
    
    ## Standardize //
    x <- standardizePath(path, .ctx=.ctx, .ns=.ns)
    
    ## Assert //
    not_missing <- assertive::is_not_na(x)
    is_dir_x <- assertive::is_dir(x)
      
    ## Basenames //
    basename_x <- ifelse(
      not_missing,
      ifelse(is_dir_x, "", basename(x)),
      NA_character_
    )
    
    ## Extensions
    has_extension <- stringr::str_detect(basename_x, stringr::fixed("."))

    # match one or more letters, numbers and allowed punctuation characters
    # (the filename without extension)
    # then a single period
    # then match one of more letters numbers and periods
    # (the file extension)
    rx <- "^([][[:alnum:] `!@#$%^&()_=+{},.;'-]+?)\\.([[:alnum:].]+)$"
    split_name <- stringr::str_match(
      basename_x[not_missing & has_extension], 
      rx
    )

    filename_x <- unname(ifelse(not_missing, basename_x, NA_character_))
    filename_x[not_missing & has_extension] <- split_name[, 2L]
    extension_x <- unname(ifelse(not_missing, "", NA_character_))
    extension_x[not_missing & has_extension] <- split_name[, 3L]

    decomposed_x <- data.frame(
      original=original_x,
      dirpath=unname(ifelse(
        not_missing,
        ifelse(is_dir_x, x, dirname(x)), 
        NA_character_
      )),
      filename=filename_x, 
      extension=extension_x,
      stringsAsFactors=FALSE
    )
   
    ## Return value //
    out <- structure(decomposed_x, 
        class=c(
            getClassName(id="decomposed_path", pkg=.ctx, type="s3", 
                .ctx=.ctx, .ns=.ns), 
            class(decomposed_x)
        )
    )
      
    ## Return //
    return(out)
      
    }, options=list(suppressAll=TRUE))
)
