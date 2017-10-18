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


colors <-  c("#b82c2c", "#066fa9", "#62b7a7", "#f36757", "#ffc87c", "#f8971c")

plot(x = N, y = n[1, ], type = "l", col = colors[1],
     xlab = "Poblacion (N)", ylab = "Muestra (n)")
for (i in 2:length(d)) {
    lines(x = N, y = n[i, ], type="l", col=colors[i])
}
legend("topleft",
       legend = c("d = 0.01", "d = 0.03", "d = 0.05", "d = 0.06", "d = 0.07"),
       xpd = TRUE,
       inset = c(0, 0),
       bty = "n",
       fill = colors,
       cex = 0.8,
       x.intersp = 0.5,
       y.intersp = 0.7,
       title = "Margen de error (d)")
par(mar = c(5, 4, 1, 2))
