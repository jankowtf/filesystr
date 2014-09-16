#' @title 
#' Get Name of Lock File
#'
#' @description 
#' Returns the name of the dummy file used for locking a file system ressource.
#' 
#' @param path \strong{Signature argument}. 
#' 		Object containing file path information.
#' @param lock_suffix \code{\link{character}}. 
#' 		Suffix to denote the lock dummy.
#' @template threedot 	
#' @example inst/examples/getLockFileName.r
#' @seealso \code{
#'    \link[rapp.core.filesys]{getLockFileName-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "getLockFileName", 
  signature = c(
    "path"
  ),
  def = function(
    path,
    lock_suffix = "_LOCK",
    ...
  ) {
    standardGeneric("getLockFileName")
  }
)

#' @title 
#' Get Name of Lock File
#' 
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{getLockFileName}}
#' 
#' @inheritParams getLockFileName
#' @param path \code{\link{character}}. File path. 
#' @return \code{\link{character}}. Lock file name.
#' @example inst/examples/getLockFileName.r
#' @seealso \code{
#'    \link[rapp.core.filesys]{getLockFileName}
#' }
#' @template author
#' @template references
#' @export 
setMethod(
  f = "getLockFileName", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    lock_suffix
  ) {

  type <- switch(
    as.character(file.info(path)$isdir),
    "TRUE" = "_DIR",
    "FALSE" = "_FILE",
    "NA" = ""
  )
  return(gsub(basename(path), 
    sprintf("%s%s%s", basename(path), type, lock_suffix), basename(path)))
    
  }
)

