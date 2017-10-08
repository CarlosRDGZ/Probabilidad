Proportion <- function(x, n)
{
	p <- (x / n)
	return(p)
}

ZValue <- function(a)
{
	return(abs(qnorm((1 - a) / 2, 0, 1)))
}

IC <- function(p, n, N, a)
{
	Sp2 = ((N - n) / N) * (p * q / n)
	Z = ZValue(a)
	return(Z * (Sp2 ^ (1 / 2)))
}

Total <- function(N, p)
{
	return(N * p)
}

ICT <- function(p, n, N, a)
{
	return(IC(p, n, N, a) * N)
}

SampleSize <- function(N, Z, p, d) 
{
	q = 1 - p
	n <- (N * (Z ^ 2) * p * q) / ((N * (d ^ 2)) + (Z ^ 2) * p * q)
	return(n)
}