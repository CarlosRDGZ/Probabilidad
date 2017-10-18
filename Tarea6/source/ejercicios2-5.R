# Ejercicio 2
N = 50
m = 45
n = 10
x = 2

dhyper(x, m, (N - m), n)

# Ejercicio 3
N = 17
m = 12
n = 8
x = 7

dhyper(x, m, (N - m), n)

#Ejercicio 4
p = 12/17
q = 5/17
n = 8
x = 7

choose(8, 7) * p ^ x * q ^ (n - x)
dbinom(x, n, p, log = F)

# Ejercicio 5
p = 8/20
q = 12/20
n = 5
x = 0:1
x.ac = 1

dbinom(x, n, p, log = F)
sum(dbinom(x, n, p, log = F))
pbinom(x.ac, n, p, lower.tail = T, log.p = F)

