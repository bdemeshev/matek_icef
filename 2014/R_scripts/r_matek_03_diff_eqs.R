library("deSolve")
library("ggplot2")

y_start <- c(y1=1, y2=4)
y_start

de_sys <- function(t,y,param) {
  answer <- list(c(y[2],y[1]+cos(y[2])))
  return(answer)
}

t <- seq(0,10, by=0.01)
head(t)

solution <- ode(y=y_start, times=t, func=de_sys)
head(solution)

sol_df <- data.frame(solution)
qplot(data=sol_df, time, y1)
qplot(data=sol_df, time, y1, 
      geom="line")
