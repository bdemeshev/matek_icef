require(erer)
require(deSolve)

# starting v
y.start <- c(y1=0,y2=1)

kot <- function(t,y,param) {
  return(list(c(
    y[2],
    -cos(t)*y[2]-5*t*y[1]^2+sin(t)
    )))  
}

time <- seq(0,3.5,by=0.01)
time

?ode
solution <- ode(y.start,time,kot)
solution <- data.frame(solution)
head(solution)
qplot(time,y1,data=solution)



B <- matrix(c(2,2,1,3),nrow=2)
B
eigen(B)
1/sqrt(2)
