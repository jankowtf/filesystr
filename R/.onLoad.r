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
  setOldClass("CopyResult.S3")
  setOldClass("CopyResults.S3")
  setOldClass("Directory.S3")
  setOldClass("File.S3")
}
