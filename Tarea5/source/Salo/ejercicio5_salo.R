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

colors <- cm.colors(6)

plot(x = Ns, y = ns[1, ], type = "l", col = colors[1],
     xlab = "Poblacion", ylab = "Muestra")
for (i in 3:length(ds))
    lines(x = Ns, y = ns[i, ], type="l", col=colors[i])