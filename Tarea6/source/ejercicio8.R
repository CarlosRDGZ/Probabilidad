lambda = 2
# a)
dpois(1:20, lambda)
for (x in 1:20) {
    p = dpois(x, lambda)
    latex.exp <- paste0("$$P(X=",x,")=\\frac{e^{-",lambda,"}",lambda,"^{",x,"}}{",x,"!}=",p,"$$")
    cat(latex.exp)
    cat("\n")
}

# b)
ppois(8, lambda)
p.1 = 0
for (x in 0:8) {
    p <- dpois(x, lambda)
    p.1 <- p.1 + p
    latex.exp <- paste0("$$P(X=",x,")=\\frac{e^{-",lambda,"}",lambda,"^{",x,"}}{",x,"!}=",p,"$$")
    cat(latex.exp)
    cat("\n")
}
latex <- paste0("$$P(X\\leq",x,")=",p.1,"$$")
cat(latex)
cat("\n")

# c)
sum(dpois(2:21, lambda))
p.1 = 0
for (x in 2:21) {
    p <- dpois(x, lambda)
    p.1 <- p.1 + p
    latex.exp <- paste0("$$P(X=",x,")=\\frac{e^{-",lambda,"}",lambda,"^{",x,"}}{",x,"!}=",p,"$$")
    cat(latex.exp)
    cat("\n")
}
latex <- paste0("$$P(2\\leq X \\leq",x,")=",p.1,"$$")
cat(latex)
cat("\n")

# d)
p.leq.10 = ppois(10, lambda)
print(p.leq.10)
1 - p.leq.10

p.1 = 0
for (x in 0:10) {
    p <- dpois(x, lambda)
    p.1 <- p.1 + p
    latex.exp <- paste0("$$P(X=",x,")=\\frac{e^{-",lambda,"}",lambda,"^{",x,"}}{",x,"!}=",p,"$$")
    cat(latex.exp)
    cat("\n")
}
latex <- paste0("$$P(X\\leq",x,")=",p.1,"$$")
cat(latex)
cat("\n")
latex <- paste0("$$P(X>",x,")=",1 - p.1,"$$")
cat(latex)
cat("\n")

# e)
dpois(0, lambda)
for (x in 0) {
    p <- dpois(x, lambda)
    p.1 <- p.1 + p
    latex.exp <- paste0("$$P(X=",x,")=\\frac{e^{-",lambda,"}",lambda,"^{",x,"}}{",x,"!}=",p,"$$")
    cat(latex.exp)
    cat("\n")
}

lambda = 14
# f)
dpois(0, lambda)
for (x in 0) {
    p <- dpois(x, lambda)
    p.1 <- p.1 + p
    latex.exp <- paste0("$$P(X=",x,")=\\frac{e^{-",lambda,"}",lambda,"^{",x,"}}{",x,"!}=",p,"$$")
    cat(latex.exp)
    cat("\n")
}

# g)
ppois(5, lambda)
p.1 <- 0
for (x in 0:5) {
    p <- dpois(x, lambda)
    p.1 <- p.1 + p
    latex.exp <- paste0("$$P(X=",x,")=\\frac{e^{-",lambda,"}",lambda,"^{",x,"}}{",x,"!}=",p,"$$")
    cat(latex.exp)
    cat("\n")
}
latex <- paste0("$$P(X\\leq",x,")=",p.1,"$$")
cat(latex)
cat("\n")