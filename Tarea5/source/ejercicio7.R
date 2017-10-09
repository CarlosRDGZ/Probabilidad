lamda = 2
p.s <- c()
# latex <- "$$P(X=x)=\\frac{e^{-\\Lambda}\\Lambda^{x}}{x!}$$"
# latex.exp <- paste0("$$P(X=",x,")=\\frac{e^{-",lamda,"}",lamda,"^{",x,"}}{",x,"!}=",p,"$$")
cat("\n")

for (x in 1:20) {
	p = dpois(x, 2)
	exp <- paste0("P(X = ",x,") = (e ^ -",lamda," * ",lamda," ^ ",x,") / ",x,"! = ",p)
	cat(exp)
	cat("\n")
}

cat("\n")

for (x in 1:7) {
	p = ppois(x, 2)
	exp <- paste0("P(X <= ",x,") = (e ^ -",lamda," * ",lamda," ^ ",x,") / ",x,"! = ",p)
	cat(exp)
	cat("\n")
}