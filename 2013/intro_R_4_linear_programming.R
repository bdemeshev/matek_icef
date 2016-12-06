require(lpSolve)

beta <- 0.1
weights <- c(2,4,5,1)
LHS <- matrix(c(1,0,1,1,-1,1,1/2,-beta),
  nrow=2,byrow=TRUE)
RHS <- c(1,1)

result <- lp("min",
            objective.in=weights,
            const.mat = LHS,
            const.dir=c(">=",">="),
            const.rhs=RHS)
result$solution
result$objval

# more examples
# http://goo.gl/l8BDwT

