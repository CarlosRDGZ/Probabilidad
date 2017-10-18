# x axis #
N <- seq(100, 8000, 10)
##########
set.seed(3)
y <- rpois(10,5)
y.lgth <- length(y)
lambda <- sum(y)/y.lgth
Z <- abs(qt((1 - 0.95) / 2, y.lgth - 1))
d <- c(0.01, 0.03, 0.05, 0.06, 0.07)
# y axis #
n <- matrix(NA, nrow = length(d), ncol = length(N))
##########

for (i in 1:length(d)) {
	for(j in 1:length(N)) {
		n[i, j] = (N[j] * Z ^ 2 * lambda)/((N[j] * d[i] ^ 2) + (Z ^ 2 * lambda))
	}
}


colors <-  rainbow(length(d))

plot(x = N, y = n[1, ], type = "l", col = colors[1],
     xlab = "", ylab = "", axes = F)
for (i in 2:length(d)) {
    lines(x = N, y = n[i, ], type="l", col=colors[i])
}

x.axis <- seq(0, 8000, 2000)
y.axis <- seq(0, 8000, 2000)
axis(1, at = x.axis)
axis(2, at = y.axis)

title(xlab="Tamano de la poblacion (N)", col.lab=rgb(0,0,0))
title(ylab = "Tamano de la muestra (n)", col.lab = rgb(0,0,0))

abline(v=x.axis, col="lightgray", lty="dotted")
abline(h=y.axis, col="lightgray", lty="dotted")
