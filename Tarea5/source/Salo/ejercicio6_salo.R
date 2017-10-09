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

colors <- heat.colors(6)

plot(x = Con, y = ns[2,], type = "l", col = colors[2],
     xlab = "Nivel de confianza", ylab = "Muestra")
for (i in 3:length(ds))
    lines(x = Con, y = ns[i, ], type="l", col=colors[i])
lines(x = Con, y = ns[1, ], type="l", col=colors[1])