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
ds <- seq(0.0001, 0.2, 0.00001)
p <- 0.05
ns <- matrix(NA, nrow = length(Ns), ncol = length(ds))

for (i in 1:length(Ns))
	for(j in 1:length(ds))
		ns[i, j] = SampleSize(Ns[i], Z, p, ds[j])

colors <- rainbow(6)

plot(x = ds, y = ns[1, ] , type = "l", col = colors[1],
     xlab = "", ylab = "", axes = FALSE)
for (i in 2:length(Ns))
    lines(x = ds, y = ns[i, ], type="l", col=colors[i])

x.axis <- c(0.000100, 0.050075, 0.100050, 0.150025, 0.200000)
y.axis <- seq(0, 7000, 1000)
axis(1, at = x.axis)
axis(2, at = y.axis)

# title(xlab="Valores del margen de error (d)", col.lab=rgb(0,0,0))
title(xlab="Margen de error", col.lab=rgb(0,0,0))
# title(ylab = "Tamanio de la muestra (n)", col.lab = rgb(0,0,0))
title(ylab = "Muestra", col.lab = rgb(0,0,0))
# 
# abline(v=x.axis, col="lightgray", lty="dotted")
# abline(h=y.axis, col="lightgray", lty="dotted")