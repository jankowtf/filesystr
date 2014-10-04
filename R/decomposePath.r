## TODO:
## - remove dependencies from 'assertive' and 'stringr'

#' @title 
#' Decompose Path
#' 
#' @description
#' Splits a path into the following components: \emph{directory name}, 
#' \emph{filename} (without extension), and \emph{file extension}. 
#' \code{strip_extension} and 
#' \code{get_extension} provide shortcuts to the second and third parts
#' of the filename. \code{recompose_path} takes the result of 
#' \code{decompose_path} and returns complete paths. 
#' 
#' @section Processing of paths of non-existing directories:
#' 
#' By default, a path of a non-existing directory (e.g. \code{"c:/nonexisting"}) 
#' would most likely often be treated as a \emph{file path} as 
#' \code{file.info("c:/nonexisting")$isdir} would return with \code{NA}. 
#' However, this function implements a different convention: a path whose 
#' basename does not containing any dots are considered as being 
#' \emph{directory} path instead of a file path. You can control the way 
#' paths are treated by using \code{dir_slash} as follows:
#' 
#' Consider \emph{directory} path \code{"C:/nonexisting"}:
#' \itemize{
#'    \item{\code{dir_slash = TRUE} } 
#'    {the method would decompose this into directory \code{"C:/"},
#'    filname \code{"nonexisting"} and extension \code{""}}
#'    \item{\code{dir_slash = FALSE} } 
#'    {the method would decompose this into directory \code{"C:/nonexisting"},
#'    filname \code{""} and extension \code{""}}
#' }
#' 
#' Consider \emph{directory} path \code{"C:/nonexisting/"}:
#' \itemize{
#'    \item{\code{dir_slash = TRUE} }
#'    {the method would decompose this into directory \code{"C:/nonexisting"},
#'    filname \code{""} and extension \code{""}}
#'    \item{\code{dir_slash = FALSE} }
#'    {the method would decompose this into directory \code{"C:/"},
#'    filname \code{"nonexisting"} and extension \code{""}}
#' }
#' 
#' @param path \strong{Signature argument}.
#' 		Object containing path information.
#' @param dir_slash \code{\link{logical}}.
#'    Are directory paths denoted by a trailing slash (\code{TRUE}) or 
#'    not (\code{FALSE}, default). See details.
#' @param shortform \code{\link{logical}}. Dimension: 1.
#'     Use shortforms (\code{TRUE}) for \code{getwd()} (i.e. \code{"."}, 
#' 		\code{dirname(getwd()} (i.e. \code{".."} and \code{HOME} (i.e. \code{"~"})
#' 		or not (\code{FALSE}, default).
#' @param ... Further arguments passed to:
#'    \code{\link[filesystr]{standardizePath}}
#' @example inst/examples/decomposePath.r
#' @seealso \code{
#'    \link[filesystr]{decomposePath-character-method}
#' }
#' @template author
#' @template references
#' @export
setGeneric(
  name = "decomposePath",
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    dir_slash = FALSE,
    shortform = FALSE,
    ...
  ) {
    standardGeneric("decomposePath")       
  }
)

#' @title 
#' Decompose Path
#'
#' @description 
#' See generic: \code{\link[filesystr]{decomposePath}}.
#' 
#' @inheritParams decomposePath
#' @param path \code{\link{missing}}.
#' @return See method 
#'    \code{\link[filesystr]{decomposePath-character-method}}.
#' @example inst/examples/decomposePath.r
#' @seealso \code{
#' 		\link[filesystr]{decomposePath},
#' 		\link[filesystr]{decomposePath-character--method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "decomposePath", 
  signature=signature(
    path = "missing"
  ), 
  definition = function(
    path,
    dir_slash,
    shortform, 
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Dispatch //
  out <- decomposePath(
    path = path,
    dir_slash = dir_slash,
    shortform = shortform,
    ...
  )
  
  ## Return //
  return(out)
    
  }
)


#' @title Decompose Path
#'
#' @description 
#' See generic: \code{\link[filesystr]{decomposePath}}.
#' 
#' @inheritParams decomposePath
#' @param path \code{\link{character}}. Vector of file paths. 
#'   	Default: files in current directory.
#' @return character \code{matrix} with three 
#'    columns named \code{"dirname"}, \code{"filename"} and \code{"extension"}.
#'    \code{strip_extension} returns a character vector of the second column,
#'    and \code{get_extension} returns a character vector of the third column.
#'    \code{recompose_path} returns a character vector of paths.
#' @example inst/examples/decomposePath.r
#' @seealso \code{
#' 		\link[filesystr]{decomposePath},
#' 		\link[filesystr]{decomposePath-missing-method}
#' }
#' @template author
#' @template references
#' @export
#' @importFrom assertive is_not_na
#' @importFrom assertive is_dir
#' @importFrom assertive is_empty
#' @importFrom stringr str_detect
#' @importFrom stringr fixed
#' @importFrom stringr str_match
setMethod(
  f = "decomposePath", 
  signature=signature(
    path = "character"
  ), 
  definition = function(
    path,
    dir_slash,
    shortform,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Early exit if 'path' is empty //
  if (assertive::is_empty(path)) {
    out <- data.frame(
      directory = NA_character_,
      filename = NA_character_,
      extension = NA_character_
    )
    out <- out[-1,]
#     out <- structure(out, 
#      class=c(
#        getClassName(id="RappFilesystemDecomposedPathS3", pkg=.ctx, type="s3"), 
#        class(out))
#     )
    out <- addClassAttribute(obj = out, 
       class_name = "RappFilesystemDecomposedPathS3")
    return(out)
  }
  
  ## Original //
  path_0 <- path
  
  ## Standardize //
  path <- standardizePath(path, shortform = shortform, ...)
  
  ## Assert //
  idx_notna   <- assertive::is_not_na(path)
  idx_isthere <- file.exists(path) 
  idx_dir     <- assertive::is_dir(path)
#   file.info(path)$isdir

  ## Process not-yet-existing directories //
  rx <- "^([][[:alnum:] `!@#$%^&()_=+{},.;'-]+?)\\.([[:alnum:].]+)$"
  idx_notthere_dir <- !grepl(rx, basename(path[!idx_isthere]))
  
  ## Process non-existing directories //
  if (any(idx_notthere_dir)) {
    if (!dir_slash) {
      idx_dir[!idx_isthere][idx_notthere_dir] <- TRUE    
    } else {
      ## Ensure they are recognized as directories
      idx_slash <- grepl(".*/$", path_0[!idx_isthere][idx_notthere_dir])
      idx_dir[!idx_isthere][idx_notthere_dir][idx_slash] <- TRUE
    }
  }

#   ## Ensure trailing slashes are remove //
#   path <- gsub("/$", "", path)
  
  ## Basenames //
  basename_path <- ifelse(
    idx_notna,
    ifelse(idx_dir, "", basename(path)),
    NA_character_
  )
  
  ## Extensions
  has_extension <- stringr::str_detect(basename_path, stringr::fixed("."))
  idx_notna_ext <- which(idx_notna & has_extension)
  
  ## match one or more letters, numbers and allowed punctuation characters
  ## (the filename without extension)
  ## then a single period
  ## then match one of more letters numbers and periods
  ## (the file extension)
  rx <- "^([][[:alnum:] `!@#$%^&()_=+{},.;'-]+?)\\.([[:alnum:].]+)$"
  split_name <- stringr::str_match(
    basename_path[idx_notna_ext], 
    rx
  )

  ## Container //
  filename_path <- unname(ifelse(idx_notna, basename_path, NA_character_))
  ## Assign filenames //
  if (length(idx_notna_ext)) {
    filename_path[idx_notna_ext] <- split_name[, 2L]
  }

  ## Container //
  extension_path <- unname(ifelse(idx_notna, "", NA_character_))
  ## Assign file extensions //
  if (length(idx_notna_ext)) {
    extension_path[idx_notna_ext] <- split_name[, 3L]
  }

  dir_path <- unname(ifelse(
      idx_notna,
      ifelse(idx_dir, path, dirname(path)), 
      NA_character_
    ))
  if (shortform) {
    dir_path <- standardizePath(path = dir_path, shortform = shortform, ...)
  }
# print(dir_path)  
  decomposed_path <- data.frame(
    directory = dir_path,
    filename = filename_path, 
    extension = extension_path,
    stringsAsFactors = FALSE,
    row.names = NULL
  )
  
  ## Return value //
#   out <- structure(decomposed_path, 
#    class=c(
#      getClassName(id="decomposed_path", pkg=.ctx, type="s3"), 
#      class(decomposed_path)
#    )
#   )
  out <- filesystr::addClassAttribute(
    obj = decomposed_path, 
    class_name = "RappFilesystemDecomposedPathS3")
  
  ## Return //
  return(out)
    
  }
)
