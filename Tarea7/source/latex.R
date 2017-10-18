laTeXBinom <- function(x, n, p) {
    return (paste0("$${",n," \\choose ",x,"}",p,"^{",x,"}",(1-p),"^{",(n-x),"}$$"))
}

laTeXPois <- function(x, lambda) {
    return (paste0("$$P(X=",x,")=\\frac{e^{-",lambda,"}",lambda,"^{",x,"}}{",x,"!}$$"))
}