#' @title 
#' Copy Directory/Directories
#' 
#' @description 
#' Copies the contents of a directory, possibly recursively.
#' 
#' @note Target directories that don't exist are created, silently (assuming  
#' write permission).
#' 
#' @param from \strong{Signature argument}.
#' 		Object containing source directory information.
#' @param to \strong{Signature argument}.
#' 		Object containing target directory information.
#' @param pattern \strong{Signature argument}. 
#' 		Filter for matching directory specific directory content.
#' @param ensure_to \code{\link{logical}}. Dimension: 1.
#' 		\code{TRUE} means non-existing target directories in \code{to} are 
#' 		created, \code{FALSE} means they will trigger an error.
#' @param overwrite \code{\link{logical}}. Dimension: 1.
#' 		\code{TRUE} means existing directories are overwritten, 
#' 		\code{FALSE} means they are not.
#' @param recursive \code{\link{logical}}. 
#' 		\code{TRUE} means subdirectories and their content are copied, 
#' 		\code{FALSE} means they are not. 
#' @template threedot
#' @example inst/examples/copyDirectory.r
#' @seealso \code{
#' 		\link[filesystr]{copyDirectory-character-character-character-method}
#' }
#' @template author
#' @template references
#' @export
setGeneric(
  name = "copyDirectory",
  signature = c(
    "from", 
    "to", 
    "pattern"
  ),
  def = function(
    from,
    to,
    pattern, 
    ensure_to = FALSE,
    overwrite = FALSE,
    recursive = TRUE,
    ...
  ) {
    standardGeneric("copyDirectory")       
  }
)

#' @title 
#' Copy Directory/Directories
#'
#' @description 
#' See generic: \code{\link[filesystr]{copyDirectory}}
#' 
#' @inheritParams copyDirectory
#' @param from \code{\link{character}}. 
#'    Source directory.
#' @param to \code{\link{character}}. 
#'    Target directory.
#' @param pattern \code{\link{character}}. 
#'    Filter for matching specific  directory content.
#' @param overwrite \code{\link{logical}}.
#' 		Overwrite existing directory (\code{TRUE}) or not (\code{FALSE}, default).
#' @param recursive \code{\link{logical}}. 
#' 		Copy subdirectories and their content (\code{TRUE}) or not (\code{FALSE}).
#' @return \code{\link{logical}}. A vector, values correspond to whether or 
#'    not each file was successfully copied is invisibly returned.
#' @example inst/examples/copyDirectory.r
#' @seealso \code{
#' 		\link[filesystr]{copyDirectory}
#' }
#' @template author
#' @template references
#' @export
## @import assertive 
## @import plyr
#' @import conditionr
setMethod(
  f = "copyDirectory", 
  signature = signature(
    from = "character",
    to = "character",
    pattern = "missing"
  ), 
  definition= function(
    from,
    to,
    pattern,
    ensure_to,
    overwrite,
    recursive,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Check //
  if (!ensure_to & any(idx <- !file.exists(to))) {
    signalCondition(
      condition = "DirectoryDoesNotExist",
      msg = c(
        "Target directory does not exist",
        path = to[idx]
      ),
      ns = "filesystr",
      type="error"
    )
  } else {
    sapply(to, dir.create, showWarnings=FALSE, recursive=TRUE)    
  }
  
  ## Standardize //
  from 	<- standardizePath(path = from)
  to 		<- standardizePath(path = to)
  
  .file.copy <- function(from, to, overwrite, recursive) {
    if (!file.exists(to)) {
      dir.create(to, showWarnings=FALSE, recursive=TRUE)
    }
    
    out <- withRestarts(
    {
      wd_0 <- setwd(from)     
      from_this <- "."
      if (!recursive) {
        from_this <- list.files(from_this)
      }     
      tmp <- sapply(from_this, file.copy, to=to, 
                    overwrite = overwrite, recursive = recursive)  
      if (!recursive) {
        ## Directory candidates //
        dir_cands <- names(tmp[!tmp])
        if (length(dir_cands)) {
          dirs <- dir_cands[idx <- which(file.info(dir_cands)$isdir)]
          if (length(dirs)) {
            ## Create empty directories //
            lapply(file.path(to, dirs), 
                   dir.create, showWarnings=FALSE)
            tmp[dir_cands[idx]] <- TRUE
          }
        }
      }
      setwd(wd_0)
      if (!all(tmp)) {
        warning(
          "The files ",
          toString(sQuote(names(tmp[!tmp]))),
          " were not copied successfully."
        )
      }
      out <- list(from = from, to = to, elements = tmp)
      out <- filesystr::addClassAttribute(obj = out, 
        class_name = "RappFilesystemCopyResultS3")
    },
    warning = function(cond) {
      setwd(wd_0)
      warning(cond)
      invokeRestart("muffleWarning")
    },
    error = function(cond) {
      setwd(wd_0)
      stop(cond)
    })
    out 
  }     
  
  out <- mapply(
    .file.copy,
    from = from, 
    to = to,
    overwrite = overwrite, 
    recursive = recursive,
    SIMPLIFY = FALSE,
    USE.NAMES = FALSE
  )
  out <- filesystr::addClassAttribute(
    obj = out, 
    class_name = "RappFilesystemCopyResultsS3"
  )
  
  ## Return //
  return(out)

  }
)
