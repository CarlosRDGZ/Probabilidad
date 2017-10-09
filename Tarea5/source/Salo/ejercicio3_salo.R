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

colors <- topo.colors(6)

plot(x = ps, y = ns[1, ], type = "l", col = colors[1],
     xlab = "Valor P", ylab = "Muestra")
for (i in 2:length(Ns))
    lines(x = ps, y = ns[i, ], type="l", col=colors[i])