# ------------ Ejercicio a ------------ #
#Muestra
n <- 600

# Probabilidad de personas 
# con daltonismo
p <- 0.005

# En este caso, lambda = np
lambda <- n * p

# Valores para x buscando P(X = x)
print("Ejercicio 2. a)")
for (x in 0:10) {
    print(paste0("Binomial: P(X=", x, ") = ",
    	dbinom(x, n, p, log = FALSE)))

    print(paste0("Poisson: P(X=", x, ") = ",
    	dpois(x, lambda)))

    print(paste0("Diferencia: ",
    	abs(dbinom(x, n, p, log = FALSE) - dpois(x, lambda))))
}
cat("\n")
# ------------------------------------- #

# ------------ Ejercicio c ------------ #
# Muestra
n <- 600

# Probabilidad de personas 
# con daltonismo
p <- 0.005

# En este caso, lambda = np
lambda <- n * p

# Valores para x buscando P(X = x)
print("Ejercicio 2. c)")
for (x in 0:10) {
    print(paste0("Binomial: P(X=", x, ") = ",
    	pbinom(x, n, p, log = FALSE)))

    print(paste0("Poisson: P(X<=", x, ") = ",
    	ppois(x, lambda)))
}
cat("\n")
# ------------------------------------- #

# ------------ Ejercicio e ------------ #
x <- seq(0, 600, 1)

ps <- matrix(NA, nrow = 2, ncol = length(x))

for(i in 1:length(x)) {
    ps[1, i] <- dbinom(i, n, p)
}
for(i in 1:length(x)) {
    ps[2, i] <- dpois(i, lambda)
}

colors <- c("#b82c2c", "#066fa9")

# --- Grafica Binomial --- #
plot(x = x, y = ps[1,], type = "l", col = colors[1],
     xlab = "", ylab = "", axes = FALSE,
     main = "Variable Binomial")

x.axis <- seq(0, 600, 100)
y.axis <- seq(0, 0.25, 0.05)
axis(1, at = x.axis)
axis(2, at = y.axis)

title(xlab="Tamano de la muestra (n)",
	col.lab=rgb(0,0,0))
title(ylab = "Valores de la proporcion (P)",
	col.lab = rgb(0,0,0))

abline(v = x.axis, col = "lightgray", lty = "dotted")
abline(h = y.axis, col = "lightgray", lty = "dotted")

# legend("topright",
#        legend = c("P(X = x)"),
#        xpd = TRUE,
#        inset = c(0, 0),
#        bty = "n",
#        fill = colors[1],
#        cex = 0.8,
#        x.intersp = 0.5,
#        y.intersp = 0.7,
#        title = "Probabilidades puntuales")
par(mar = c(5, 4, 1, 2))
# --- /Grafica Binomial --- #

# --- Grafica Poisson --- #
plot(x = x, y = ps[2,], type = "l", col = colors[2],
     xlab = "", ylab = "", axes = FALSE,
     main = "Variable Poisson")

x.axis <- seq(0, 600, 100)
y.axis <- seq(0, 0.25, 0.05)
axis(1, at = x.axis)
axis(2, at = y.axis)

title(xlab="Tamano de la muestra (n)",
	col.lab=rgb(0,0,0))
title(ylab = "Valores de la proporcion (P)",
	col.lab = rgb(0,0,0))

abline(v = x.axis, col = "lightgray",lty = "dotted")
abline(h = y.axis, col = "lightgray", lty = "dotted")

# legend("topright",
#        legend = c("P(X <= x)"),
#        xpd = TRUE,
#        inset = c(0, 0),
#        bty = "n",
#        fill = colors[2],
#        cex = 0.8,
#        x.intersp = 0.5,
#        y.intersp = 0.7,
#        title = "Probabilidades acumuladas")
par(mar = c(5, 4, 1, 2))
# --- /Grafica Poisson --- #
# par(mfrow=c(1,2), mai = c(0.8, 0.8, 0.2, 0.2))
# ------------------------------------- #

# ------------ Ejercicio f ------------ #
ps <- matrix(NA, nrow = 2, ncol = length(x))

for(i in 1:length(x)) {
    ps[1, i] <- pbinom(i, n, p)
}
for(i in 1:length(x)) {
    ps[2, i] <- ppois(i, lambda)
}

# --- Grafica Binomial --- #
plot(x = x, y = ps[1,], type = "l", col = colors[1],
     xlab = "", ylab = "", axes = FALSE,
     main = "Variable Binomial")

x.axis <- seq(0, 600, 100)
y.axis <- seq(0.2, 1, 0.1)
axis(1, at = x.axis)
axis(2, at = y.axis)

title(xlab="Tamano de la muestra (n)",
	col.lab=rgb(0,0,0))
title(ylab = "Valores de la proporcion (P)",
	col.lab = rgb(0,0,0))

abline(v = x.axis, col = "lightgray", lty = "dotted")
abline(h = y.axis, col = "lightgray", lty = "dotted")
# --- /Grafica Binomial --- #

# --- Grafica Poisson --- #
plot(x = x, y = ps[2,], type = "l", col = colors[2],
     xlab = "", ylab = "", axes = FALSE,
     main = "Variable Poisson")

x.axis <- seq(0, 600, 100)
y.axis <- seq(0.2, 1, 0.1)
axis(1, at = x.axis)
axis(2, at = y.axis)

title(xlab="Tamano de la muestra (n)",
	col.lab=rgb(0,0,0))
title(ylab = "Valores de la proporcion (P)",
	col.lab = rgb(0,0,0))

abline(v = x.axis, col = "lightgray", lty = "dotted")
abline(h = y.axis, col = "lightgray", lty = "dotted")
# --- /Grafica Poisson --- #
par(mfrow=c(1,2), mai = c(0.8, 0.8, 0.2, 0.2))
# ------------------------------------- #