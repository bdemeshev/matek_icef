# hit ctrl+enter of cmd+enter to execute a line

# basic arithmetics
5 + 6
1/0
atan(Inf)
factorial(10)
choose(10,5) # C_n^k

# vectors
x <- c(5,6,2,-4)
y <- c(7,2,3,9)

x[3] # third element

mean(x)
max(x)
sd(x)
cor(x,y)
lm(y~x) # regression

A <- matrix(x, nrow=2) # pack the vector x into a matrix with 2 rows
A

det(A) # determinant
solve(A) # inverse of A
t(A) # transpose of A
eigen(A) # eigen vectors and values

