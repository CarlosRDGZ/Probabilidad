N <- 500 # as.integer(args[1])
sprintf("N = %s", N)
n <- 80 # as.integer(args[2])
sprintf("n = %s", n)
x <- 20 # as.integer(args[3])
sprintf("x = %s", x)
cat("\n")


# a) estimacion puntal de la proporcion
p <- x/n
sprintf("p = %s", p)
cat("\n")

# b) estimacion por intervalo de la proporción con una confianza de 95%
q <- 1 - p
Sp2 <- ((N - n) / N) * (p * q / n)
Sp <- Sp2 ^ (1 / 2)
Z <- abs(qnorm((1 - 0.95) / 2, 0, 1))
ls <- p + Z * Sp
li <- p - Z * Sp
sprintf("ls = %s", ls)
sprintf("li = %s", li)
cat("\n")

# c) Total de estudiantes que si les gusta el uso de la plataforma
T <- N * p
sprintf("T = %s", T)
cat("\n")

# d) Intervalo de confianza para el total con una confianza de 95%
LS <- ls * N
LI <- li * N
sprintf("LS = %s", LS)
sprintf("LI = %s", LI)
cat("\n")

# e) Tamanio de muestra con un nivel de confianza del 95% y 
# margen de error (d=0.03). 
d <- 0.03

n0 <- (N * (Z ^ 2) * p * q) / ((N * (d ^ 2)) + (Z ^ 2) * p * q)
sprintf("n = %s", n0)
cat("\n")
