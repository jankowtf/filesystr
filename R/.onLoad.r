#' @title 
#' On Load Hook
#'
#' @description 
#' On load hook.
#' 
#' @param libname 
#' @param pkgname
#' @template author
#' @template references
#' @export .onLoad
.onLoad <- function(libname, pkgname) {
  setOldClass("RappFilesystemCopyResultS3")
  setOldClass("RappFilesystemCopyResultsS3")
  setOldClass("RappFilesystemDirectoryS3")
  setOldClass("RappFilesystemFileS3")
}
