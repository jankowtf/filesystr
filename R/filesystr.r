#' @title
#' Functionality for handling paths of file system ressources
#'
#' @description
#' Complements base functionality with respect to handling paths of 
#' file system ressources. This packages is a fundamental building block 
#' of the \code{rapp} framework/package.
#' 
#' @seealso The core functions/methods of this package: 
#'    \itemize{
#'      \item{\code{\link[filesystr]{standardizePath}}: }{
#'          Extends the features of \code{\link[base]{normalizePath}}.
#'      }
#'      \item{\code{\link[filesystr]{decomposePath}}: }{
#'          Decomposes directory and file paths into three components: 
#'          \emph{directory}, \emph{filename} and \emph{extension}
#'      }
#'      \item{\code{\link[filesystr]{recomposePath}}: }{
#'          Recomposes objects as returned by 
#'          \code{\link[filesystr]{decomposePath}} back into 
#'          a \code{\link{character}} vector.
#'      }
#'      \item{\code{\link[filesystr]{copyDirectory}}: }{
#'          Extends the features of \code{\link[base]{file.copy}}.
#'      }
#'      \item{\code{\link[filesystr]{asDirectoryPathPath}}: }{
#'          Clearly denotes a path to a directory ressource 
#'          (provided as \code{\link{character}}) as an actual \emph{directory path}
#'          of class \code{RappFilesystemDirectoryPathS3}. The main reason behind
#'          this is to enable method dispatch based on this class.
#'      }
#'      \item{\code{\link[filesystr]{asFilePathPath}}: }{
#'          Clearly denotes a path to a file ressource 
#'          (provided as \code{\link{character}}) as an actual \emph{file path}
#'          of class \code{RappFilesystemFilePathS3}. The main reason behind
#'          this is to enable method dispatch based on this class.
#'      }
#'    }
#'    
#' @template author
#' @template references
#' @docType package
#' @name filesystr
NULL