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
  setOldClass("DirectoryCopyResult.S3")
  setOldClass("DirectoryCopyResults.S3")
  setOldClass("Directory.S3")
  setOldClass("File.S3")
}
