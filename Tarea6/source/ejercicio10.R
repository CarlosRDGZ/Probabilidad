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


colors <-  c("#b82c2c", "#066fa9", "#62b7a7", "#f36757", "#ffc87c", "#f8971c")
plot(x = d, y = n[1, ], type = "l", col = colors[1],
     xlab = "Margen de error (d)", ylab = "Muestra (n)")
for (i in 2:length(N)) {
    lines(x = d, y = n[i, ], type="l", col=colors[i])
}
legend("topright",
       legend = c("N = 7000", "N = 5000", "N = 3000", "N = 2000", "N = 100", "N = 300"),
       xpd = TRUE,
       inset = c(0, 0),
       bty = "n",
       fill = colors,
       cex = 0.8,
       x.intersp = 0.5,
       y.intersp = 0.7,
       title = "Poblacion (N)")
par(mar = c(5, 4, 1, 2))
