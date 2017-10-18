set.seed(3)
y <- rpois(10,5)
y.lgth <- length(y)
lambda <- sum(y)/y.lgth
N <- c(5000, 2000, 500)
Z <- abs(qt((1 - 0.95) / 2, y.lgth - 1))
d <- 0.03
n <- c()

latex.l <- "$$\\lambda=("
for(i in 1:y.lgth) {
    latex.l <- paste0(latex.l, y[i])
    if(i < y.lgth) {
        latex.l <- paste0(latex.l, "+")
    }
}
latex.l <- paste0(latex.l,")/",y.lgth,"=",lambda,"$$")
cat(latex.l)
cat("\n")
latex.z <- paste0("$$Z=",Z,"$$")
cat(latex.z)
cat("\n")
latex.d <- paste0("$$d=",d,"$$")
cat(latex.d)
cat("\n")

for(i in 1:3){
    n.i <- (N[i] * Z ^ 2 * lambda)/((N[i] * d ^ 2) + (Z ^ 2 * lambda))
    n <- append(n, n.i)
    latex <- paste0("$$n=\\frac{(",N[i],")(",Z^2,"^{2})(",lambda,")}{(",N[i],")(",d^2,"^{2})+(",Z^2,"^{2})(",lambda,")}=",n.i,"$$")
    cat(latex)
    cat("\n")
}
n