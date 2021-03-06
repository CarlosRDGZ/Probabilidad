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

Ns <- seq(100, 800, 10)
Z <- ZValue(0.95)
ds <- c(0.01, 0.03, 0.05, 0.06, 0.07)
p <- 0.05

ns <- matrix(NA, nrow = length(ds), ncol = length(Ns))

for (i in 1:length(ds))
	for(j in 1:length(Ns))
		ns[i, j] = SampleSize(Ns[j], Z, p, ds[i])

colors <- c("#b82c2c", "#066fa9", "#62b7a7", "#f36757", "#ffc87c", "#f8971c")

plot(x = Ns, y = ns[1, ] , type = "l", col = colors[1],
     xlab = "Margen de error (d)", ylab = "Muestra (n)")
for (i in 2:length(ds))
    lines(x = Ns, y = ns[i, ], type="l", col=colors[i])

legend("topleft",
	legend = c("d = 0.01", "d = 0.03", "d = 0.05", "d = 0.06", "d = 0.07"),
	xpd = TRUE, inset = c(0, 0), bty = "n", fill = colors, cex = 0.8,
	x.intersp = 0.5, y.intersp = 0.7, title = "Margen de error (d)")
par(mar = c(5, 4, 1, 2))