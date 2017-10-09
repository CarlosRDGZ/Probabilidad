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
N <- 700
Con <- seq(50, 99, 0.5)
Zs <- seq(50, 99, 0.5)
for (i in 1:length(Zs))
	Zs[i] <- ZValue(Zs[i] / 100)
ds <- c(0.01, 0.03, 0.05, 0.06, 0.07)
p <- 0.05
ns <- matrix(NA, nrow = length(ds), ncol = length(Zs))

for (i in 1:length(ds))
	for(j in 1:length(Zs))
		ns[i, j] = SampleSize(N, Zs[j], p, ds[i])

colors <- c("#b82c2c", "#066fa9", "#62b7a7", "#f36757", "#ffc87c", "#f8971c")

plot(x = Con, y = ns[2,], type = "l", col = colors[2],
     xlab = "Nivel de confianza (Z)", ylab = "Muestra (n)")
for (i in 3:length(ds))
    lines(x = Con, y = ns[i, ], type="l", col=colors[i])
lines(x = Con, y = ns[1, ], type="l", col=colors[1])

legend("left",
	legend = c("d = 0.01", "d = 0.03", "d = 0.05", "d = 0.06", "d = 0.07"),
	xpd = TRUE, inset = c(0, 0), bty = "n", fill = colors, cex = 0.9,
	x.intersp = 0.5, y.intersp = 0.7, title = "Margen de error (d)")
par(mar = c(5, 4, 1, 2))