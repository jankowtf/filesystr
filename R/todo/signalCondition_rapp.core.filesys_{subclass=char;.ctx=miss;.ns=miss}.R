#' @param subclass  
#' 		\code{\link{character}}. Dimension: any.
#' 		Name(s) of the subclass(es) that will be passed to the condition object's
#' 		class table. 
#' @param .ctx \code{\link{missing}}.
#' @param .ns \code{\link{missing}}.  
#' @return 
#' 		Object of the class(es) that have been provided by \code{subclass} and
#' 		also inheriting from \code{\link{condition}} and depending on
#' 		\code{type} also from \code{\link{message}}, \code{\link{warning}} or
#' 		\code{\link{error}}.
#' @rdname signalCondition_rapp.core.filesys-methods
#' @aliases signalCondition_rapp.core.filesys
#' @export

setMethod(
    f="signalCondition_rapp.core.filesys", 
    signature=signature(
        subclass="character",
        .ctx="missing",
        .ns="missing"
    ), 
    definition=cmpfun(function(
        subclass,
        msg,
        call,
        type,
        do.signal,
        .ctx,
        .ns
    ) {

    ## Match arg //
    type <- match.arg(type, 
        c("message", "warning", "error", "condition")
    )

    pkg <- "rapp.core.filesys"
    
    ## Message line break at end //
    if (length(msg)) {
        msg <- sapply(msg, function(ii) {
            if (!length(grep("\\n$", ii, perl=TRUE))) {
                ii <- paste0(ii, "\n")    
            }     
        })
        if (length(msg) > 1) {
            msg[1] <- gsub("\\n", " //\n", msg[1])
            msg[2:length(msg)] <- paste0(
                "[", seq(along=msg[2:length(msg)]), "] ", 
                "* ", names(msg[2:length(msg)]), ": ", msg[2:length(msg)])
        }
    } else {
        msg <- ""
    }

    ## Add call to message //
    msg <- c(
        paste0(Sys.time(), "/"),
        ifelse(!is.null(pkg), paste0(pkg, "/"), ""),
        ifelse(!is.null(call), paste0(call, "/"), ""),
        subclass, "> \n", msg
    )
    msg <- paste(msg, collapse="")
    msg <- gsub("\\* : ", "", msg)
    
    ## Sub sub condition class //
    subsub <- switch(
        type,
        message=c(type, "condition"),
        warning=c(type, "condition"),
        error=c(type, "condition"),
        condition="condition"
    )
  
    ## Create condition object //
    out <- structure(
        class=unique(c(subclass, subsub)),
        list(message=msg, call=call)
    )
    if (do.signal) {
        switch(
            type,
            message=message(out),
            warning=warning(out),
            error=stop(out),
            condition=signalCondition(out)
        )    
    }
    
    ## Return //
    return(out)
    
    }, options=list(suppressAll=TRUE))
)
