# *********** Includes *********** #
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
# -------------------------------- #

Ns <- c(7000, 5000, 3000, 2000, 100, 300)
Z <- ZValue(0.95)
ds <- seq(0.0001, 0.2, 0.00001)
p <- 0.05
ns <- matrix(NA, nrow = length(Ns), ncol = length(ds))

for (i in 1:length(Ns))
	for(j in 1:length(ds))
		ns[i, j] = SampleSize(Ns[i], Z, p, ds[j])

colors <- c("#b82c2c", "#066fa9", "#62b7a7", "#f36757", "#ffc87c", "#f8971c")

plot(x = ds, y = ns[1, ] , type = "l", col = colors[1],
     xlab = "Margen de error (d)", ylab = "Muestra (n)")
for (i in 2:length(Ns))
    lines(x = ds, y = ns[i, ], type="l", col=colors[i])

legend("topright",
	legend = c("N = 7000", "N = 5000", "N = 3000", "N = 2000", "N = 100", "N = 300"),
	xpd = TRUE, inset = c(0, 0), bty = "n", fill = colors, cex = 0.8,
	x.intersp = 0.5, y.intersp = 0.7, title = "Poblacion (N)")
par(mar = c(5, 4, 1, 2))