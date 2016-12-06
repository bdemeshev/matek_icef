# complex numbers

(5+6i)*(7-3i)
abs(3+4i)
Arg(1+1i)
pi/4
(2+2i)^10
exp(pi*1i)

# probability/statistics
# Tools - Install packages - "quantmod" - enter
library("quantmod")

getSymbols(Symbols = "AAPL",
                   from="2013-01-01",
                   to="2015-03-01",
                   src="google")
head(AAPL)
y <- AAPL$AAPL.Close
head(y)
tail(y)
mean(y)

t.test(y, mu=100)

length(y) # number of elements in vector y

1:10 # numbers from 1 to 10
seq(from=0.1, to=7, by=0.08) # arithmetic progression
t <- 1:length(y)


model <- lm(y~t) # simple regression
summary(model)

library("ggplot2") # graphs
df <- data.frame(time=t, apple=y)
head(df)
qplot(data=df, time, AAPL.Close)
chartSeries(AAPL)
b <- qplot(data=df, time, 
      AAPL.Close, geom="line")  
b + stat_smooth(method="lm")

## linear programming

library("lpSolve")

A <- matrix(
  c(1,2,1,1,2,1,1,1,-1),
  nrow=3)
A

help("lp")

solution <- lp(
  direction = "max",
  objective.in = c(2,3,4),
  const.mat = A,
  const.dir = c("<=","<=","<="),
  const.rhs = c(5,7,4)
)
solution$objval # value of max
solution$solution # point of max

# unconstrained optimisation

library("maxLik")

g <- function(t) {
  message("Natasha, privet!")
  return(t^3+2)
}
g(-1)
g(5) + g(-4)

f <- function(x) {
  return((x[1]-2)^2+(x[2]+3)^2)
}

f(5)

f(c(5,6))

d <- function(a,b) {
  return((a-2)^2+(b+3)^2)
}

d(5,6)

`+` <- function(a,b) {
  return(42)
}

8+9
rm(`+`)
8+9


help("nlm")

solution <- nlm(f, p=c(0,0))
solution
solution$minimum # value of minimum
solution$estimate # point of minimum

numericGradient(f, t0=c(1,-2))
numericHessian(f, t0=c(1,-2))
