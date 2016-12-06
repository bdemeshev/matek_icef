# complex numbers

(5+6i)*(2-3i)
abs(3+4i)
Arg(2+2i)
pi/4
(2+3i)^5
exp(pi*1i)

# linear programming

library("lpSolve")

help("lp")

A <- matrix(c(1,2,1,1,1,3,1,3,2),
            nrow=3)
A[2,3]
A[2,]
A

answer <- lp(
  direction="max",
  objective.in=c(2,3,4),
  const.mat = A,
  const.dir = c("<=","<=","<="),
  const.rhs = c(10,20,20)
)

answer$solution # point of max
answer$objval # value of max

# repeat something
c("<=","<=","<=")
rep("<=",3)
rep("Олег, привет! ", 20)

library("quantmod")
getSymbols(Symbols = "AAPL",
           from="2014-01-01",
           to="2015-03-02",
           src="google")
head(AAPL)
AAPL$AAPL.Close
chartSeries(AAPL)

y <- AAPL$AAPL.Close
mean(y)
sd(y)
t.test(y, mu=100)

length(y)
head(y)
tail(y,3)

x <- AAPL$AAPL.Open
model <- lm(y~x)
summary(model)

RSS <- deviance(model)
RSS

TSS <- sum( (y-mean(y))^2 )
TSS

# unconstrain opt

library("maxLik")

f <- function(x) {
  return( (x[1]-1)^2 + (x[2] + 5)^2 )
}

f(c(1,2))

help("nlm")
ans <- nlm(f, p=c(-555,-100))
ans$minimum # minimal value
ans$estimate # point of min

numericHessian(f, t0 = c(5,2) )
numericGradient(f, t0 = c(5,2))
