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

Ns <- seq(100, 8000, 10)
Z <- ZValue(0.95)
ds <- c(0.01, 0.03, 0.05, 0.06, 0.07)
p <- 0.05
ns <- matrix(NA, nrow = length(ds), ncol = length(Ns))

for (i in 1:length(ds))
	for(j in 1:length(Ns))
		ns[i, j] = SampleSize(Ns[j], Z, p, ds[i])

colors <- rainbow(5)

plot(x = ds, y = ns[, 1] , type = "l", col = colors[1],
	xlab = "", ylab = "", axes = FALSE)
for (i in 2:length(ds))
    lines(x = ds, y = ns[ ,i], type="l", col=colors[i])

x.axis <- ds
y.axis <- seq(20, 100, 10)
axis(1, at = x.axis)
axis(2, at = y.axis)

title(xlab="Valores del margen de error (d)", col.lab=rgb(0,0.5,0))
title(ylab = "Tamano de la muestra (n)", col.lab = rgb(0,0.5,0))

abline(v=x.axis, col="lightgray", lty="dotted")
abline(h=y.axis, col="lightgray", lty="dotted")