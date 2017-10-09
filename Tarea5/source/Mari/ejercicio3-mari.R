# *********** Header *********** #
path <- getwd()
path <- paste0(path, "/source")
if (dir.exists(path)) {
    setwd(path)
}

if (file.exists("formulas.R")) {
    source("formulas.R")
} else {
    stop("File required 'formulas.R' not found")
}
# ------------------------------ #

Ns <- c(7000, 5000, 3000, 2000, 100, 300)
Z <- ZValue(0.95)
d <- 0.03
ps <- seq(0, 0.99, 0.0001)
ns <- matrix(NA, nrow = length(Ns), ncol = length(ps))

for (i in 1:length(Ns))
	for(j in 1:length(ps))
		ns[i, j] = SampleSize(Ns[i], Z, ps[j], d)

colors <- rainbow(6)
plot(x = ps, y = ns[1, ], type = "l", col = colors[1], xlab = "", ylab = "", axes = FALSE)
for (i in 2:length(Ns))
    lines(x = ps, y = ns[i, ], type="l", col=colors[i])

x.axis <- seq(0, 1, 0.1)
y.axis <- c(0, 167.9212, 417.6890, 693.6477, 925.9250)
y.axis1 <- seq(0, 1000, 500)
axis(1, at = x.axis)
axis(2, at = y.axis)

title(xlab="Valores de la proporcion (P)", col.lab=rgb(0,0.5,0))
title(ylab = "Tamano de la muestra (n)", col.lab = rgb(0,0.5,0))

abline(v=x.axis, col="lightgray", lty="dotted")
abline(h=y.axis, col="lightgray", lty="dotted")