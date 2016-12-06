# vectors + matrices

nova <- c(5, 6, 7, 9, -3.4)
beta <- c(1, 5, -3, NA, 42)
nova
beta
nova + beta

nova * beta

max(nova)
min(nova)
mean(nova)
sum(nova)
length(nova)

nova2 <- c(nova, 9)
nova2

A <- matrix(nova2, nrow = 2)
A

B <- matrix(nova2, nrow = 3)
B

A * A # by element product
D <- A %*% B # matrix product
C <- B %*% A # matrix product


C
D
solve(C) # inverse does not exist
solve(D) # inverse matrix

# D * x = b
b <- c(7, -3)
solve(D, b) # x = ...

eigen(D)

S <- matrix(c(5, 1, 1, 9),
            nrow = 2)
S
eigen(S)

SS <- matrix(c(5, 0, 0, 5),
            nrow = 2)
eigen(SS)

SSS <- matrix(c(5, 0, 1, 5),
            nrow = 2)
SSS
eigen(SSS)

det(SSS)
A[2, 1]

# complex numbers
(5 + 6i) * (2 - 3i)
abs(2 - 3i)
Arg(2 - 3i)/pi
(2+3i)^5
exp(pi*(-2+1i))
exp(pi*1i)

# linear programming
help(exp)

a <- c(1, 2, 1, 1, 1, 3, 1, 3, 2)
A <- matrix(a, nrow = 3)
A

library("lpSolve")
korova <- lp(
  direction = "max",
  objective.in = c(2, 3, 4),
  const.mat = A,
  const.dir = c('<=', "=", ">="),
  const.rhs = c(10, 20, 30)
)
help(lp)

# what is a list?
spisok <- list(a = 5, v = c(1, 2, 3))
spisok$a
spisok$v

korova$solution # extremum point
korova$objval # maximal value

# non-linear minimization problem


# (x1 - 5)^2 + (x2 - 3)^2
fun <- function(x) {
  f <- (x[1] - 5)^2 + (x[2] - 3)^2
  return(f)
}
fun( c(3, 4) )
fun( c(2, -3) )

solution <- nlm(fun, p = c(-100, 200))
solution$minimum
solution$iterations
solution$estimate
solution$gradient

library("maxLik")

numericGradient(fun, t0 = c(0, 0))
numericHessian(fun, t0 = c(0, 0))


