source("Formulas.R")

args = commandArgs(trailingOnly = TRUE)
if(length(args) != 3)
{
	print("Not enough argumets, setting default.")
    args[1] <- 2000
    args[2] <- 5000
    args[3] <- 10000
}

n <- 80
x <- 20

p <- Proportion(x, n)
Z <- ZValue(0.95)
d <- 0.03

for(i in 1:3)
{
	sprintf("n%s = ", SampleSize(as.double(args[i]), Z, p, d))
	print(SampleSize(as.double(args[i]), Z, p, d))
}