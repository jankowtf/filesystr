#' @title
#' Functionality for processing file system ressources
#'
#' @description
#' Complements base functionality with respect to handling paths of 
#' file system ressources. 
#' 
#' @section Classes and constructors:
#' 
#' \itemize{
#'    \item{\code{\link[filesystr]{Directory.S3}}: }{
#'    
#'      Constructor function for instances of class 
#'      \code{\link[filesystr]{Directory.S3}}
#'    }
#'    \item{\code{\link[filesystr]{File.S3}}: }{
#'    
#'      Constructor function for instances of class 
#'      \code{\link[filesystr]{File.S3}}
#'    }
#'    \item{\code{\link[filesystr]{DecomposedPath.S3}}: }{
#'    
#'      Constructor function for instances of class 
#'      \code{\link[filesystr]{DecomposedPath.S3}}
#'    }
#'    \item{\code{\link[filesystr]{DirectoryCopyResult.S3}}: }{
#'    
#'      Constructor function for instances of class 
#'      \code{\link[filesystr]{DirectoryCopyResult.S3}}
#'    }
#'    \item{\code{\link[filesystr]{DirectoryCopyResults.S3}}: }{
#'    
#'      Constructor function for instances of class 
#'      \code{\link[filesystr]{DirectoryCopyResults.S3}}
#'    }
#' }
#' 
#' @section Coercing functions/methods:
#' 
#' \itemize{
#'    \item{\code{\link[filesystr]{asDirectoryPath}}: }{
#'    
#'        Clearly denotes a path to a directory ressource 
#'        (provided as \code{\link{character}}) as an actual \emph{directory path}
#'        of class \code{Directory.S3}. The main reason behind
#'        this is to enable method dispatch based on this class.
#'    }
#'    \item{\code{\link[filesystr]{asFilePath}}: }{
#'    
#'        Clearly denotes a path to a file ressource 
#'        (provided as \code{\link{character}}) as an actual \emph{file path}
#'        of class \code{File.S3}. The main reason behind
#'        this is to enable method dispatch based on this class.
#'    }
#'    \item{\code{\link[filesystr]{asDecomposedPath}}: }{
#'    
#'        Clearly denotes a path to a file system ressource 
#'        (provided as \code{\link{character}}) as an actual \emph{decomposed path}
#'        of class \code{DecomposedPath.S3}. The main reason behind
#'        this is to enable method dispatch based on this class.
#'    }
#'  }
#' 
#' @section Main functions/methods: 
#' 
#' \itemize{
#'    \item{\code{\link[filesystr]{decomposePath}}: }{
#'    
#'        Decomposes directory and file paths into three components: 
#'        \emph{directory}, \emph{filename} and \emph{extension}
#'    }
#'    \item{\code{\link[filesystr]{recomposePath}}: }{
#'    
#'        Recomposes objects as returned by 
#'        \code{\link[filesystr]{decomposePath}} back into 
#'        a \code{\link{character}} vector.
#'    }
#'    \item{\code{\link[filesystr]{copyDirectory}}: }{
#'    
#'        Extends the features of \code{\link[base]{file.copy}}.
#'    }
#' }
#'    
#' @section Path component selectors and path standardization: 
#'  
#' \itemize{
#'    \item{\code{\link[filesystr]{getDirectoryPath}}: }{
#'    
#'      Based on the output of \code{\link[filesystr]{decomposePath}} the 
#'      \emph{directory} component is selected.
#'    }
#'    \item{\code{\link[filesystr]{getFileName}}: }{
#'    
#'      Based on the output of \code{\link[filesystr]{decomposePath}} the 
#'      \emph{filename} component is selected.
#'    }
#'    \item{\code{\link[filesystr]{getFileExtension}}: }{
#'    
#'      Based on the output of \code{\link[filesystr]{decomposePath}} the 
#'      \emph{extension} component is selected.
#'    }
#'    \item{\code{\link[filesystr]{standardizePath}}: }{
#'    
#'      Extends the features of \code{\link[base]{normalizePath}}.
#'    }
#' }
#' 
#' @section File and directory locking:
#' 
#' The following functions can be used to lock and unlock files and directories.
#' \itemize{
#'    \item{\code{\link[filesystr]{lockRessource}}: }{
#'    
#'      Locks a file system ressource by creating a temporary dummy file
#'      that denotes a \emph{is locked} state.
#'    }
#'    \item{\code{\link[filesystr]{tryLockRessource}}: }{
#'    
#'      Tries a certain amount of times to lock a file system ressource until
#'      it times out.
#'    }
#'    \item{\code{\link[filesystr]{unlockRessource}}: }{
#'    
#'      Unlocks a file system ressource previously locked by 
#'      \code{\link[filesystr]{lockRessource}}.
#'    }
#'    \item{\code{\link[filesystr]{tryunLockRessource}}: }{
#'    
#'      Tries a certain amount of times to unlock a file system ressource until
#'      it times out.
#'    }
#'    \item{\code{\link[filesystr]{isLockedkRessource}}: }{
#'    
#'      Checks if a file system ressource is locked.
#'    }
#' }
#' 
#' @section Convenience functions/methods:
#' \itemize{
#'    \item{\code{\link[filesystr]{openRessource}}: }{
#'    
#'      Opens a ressource with a suitable application. For \emph{directories}
#'      this is the system's default file system browser. For \emph{files} 
#'      the user is asked to select a suitable application 
#'      (\strong{only tested on Windows so far}).
#'    }
#' }
#'    
#' @template author
#' @template references
#' @docType package
#' @name filesystr
NULL
