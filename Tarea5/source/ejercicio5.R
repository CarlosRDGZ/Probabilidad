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

Ns <- seq(100, 800, 10)
Z <- ZValue(0.95)
ds <- c(0.01, 0.03, 0.05, 0.06, 0.07)
p <- 0.05
ns <- matrix(NA, nrow = length(ds), ncol = length(Ns))

for (i in 1:length(ds))
	for(j in 1:length(Ns))
		ns[i, j] = SampleSize(Ns[j], Z, p, ds[i])

colors <- c("#b82c2c", "#066fa9", "#62b7a7", "#f36757", "#ffc87c", "#f8971c")

plot(x = ds, y = ns[, 1] , type = "l", col = colors[1],
     xlab = "Valores del margen de error (d)", ylab = "Tamanio de la muestra (n)")
for (i in 2:length(ds))
    lines(x = ds, y = ns[ ,i], type="l", col=colors[i])

legend("bottomleft",
	legend = c("N = 7000", "N = 5000", "N = 3000", "N = 2000", "N = 100", "N = 300"),
	cex=0.5, fill = colors, ncol = 2)