#' @param subclass  
#' 		\code{\link{missing}}.
#' @param .ctx \code{\link{missing}}.
#' @param .ns \code{\link{missing}}.  
#' @return 
#' 		Return value of signature \code{character,missing,missing}.
#' @rdname signalCondition_rapp.core.filesys-methods
#' @aliases signalCondition_rapp.core.filesys,missing,missing,missing-method
#' @export

setMethod(
    f="signalCondition_rapp.core.filesys", 
    signature=signature(
        subclass="missing",
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

    ## Default condition classes //
    if (missing(subclass)) {
        subclass <- switch(
            type,
            message="DefaultMessage",
            warning="DefaultWarning",
            error="DefaultError",
            condition="DefaultCondition"
        )    
    }

    ## Dispatch //
    out <- signalCondition_rapp.core.filesys(
        subclass=subclass,
        call=call,
        type=type,
        do.signal=do.signal
    )
    
    ## Return //
    return(out)
    
    }, options=list(suppressAll=TRUE))
)
