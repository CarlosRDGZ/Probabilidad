# x axis #
d <- seq(0.00001, 0.2, 0.0001)
##########
set.seed(3)
y <- rpois(10,5)
y.lgth <- length(y)
lambda <- sum(y)/y.lgth
Z <- abs(qt((1 - 0.95) / 2, y.lgth - 1))
N <- c(7000, 5000, 3000, 2000, 100, 300)
# y axis #
n <- matrix(NA, nrow = length(N), ncol = length(d))
##########

for (i in 1:length(N)) {
    for(j in 1:length(d)) {
        n[i, j] = (N[i] * Z ^ 2 * lambda)/((N[i] * d[j] ^ 2) + (Z ^ 2 * lambda))
    }
}


colors <-  rainbow(length(N))

plot(x = d, y = n[1, ], type = "l", col = colors[1],
     xlab = "", ylab = "", axes = FALSE)
for (i in 2:length(N)) {
    lines(x = d, y = n[i, ], type="l", col=colors[i])
}

x.axis <- seq(0, 0.2, 0.05)
y.axis <- seq(1000, 7000, 1000)
axis(1, at = x.axis)
axis(2, at = y.axis)

title(xlab="Valores del margen de error (d)", col.lab=rgb(0,0,0))
title(ylab = "Tamano de la muestra (n)", col.lab = rgb(0,0,0))

abline(v=x.axis, col="lightgray", lty="dotted")
abline(h=y.axis, col="lightgray", lty="dotted")