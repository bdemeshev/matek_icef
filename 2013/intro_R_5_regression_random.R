require(lpSolve)
?lp

answer <- lp(
  direction="max",
  objective.in=c(1,2,1),
  const.mat=matrix(c(2,1,1,3,3,2),nrow=2),
  const.dir=c("<=","<="),
  const.rhs=c(3,4))

answer$solution # vector of x
answer$objval # objective function

# linear regression
require(erer)
h <- diamonds
qplot(carat,price,data=h)
str(h)
qplot(log(carat),log(price),data=h)

model1 <- lm(log(price)~log(carat),data=h)
summary(model1)

summary(h$clarity)
model2 <- lm(log(price)~log(carat)+clarity,data=h)
summary(model2)
levels(h$clarity)

h[10:30,1:5]
# how to read data from excel
# save file as CSV (comma separated values) in excel
# read it
estella <- read.csv("demo.csv",sep=",",header=TRUE)
# maybe sep="," should be replaced by sep=";"
summary(estella)



# Find the probability P(X1+X2/2>6) if X1 and X2 ~ U[0;10]

x1 <- runif(10^6,min=0,max=10)
x1[1:20]
x2 <- runif(10^6,min=0,max=10)
cond <- (x1+x2)/2>6
?runif
cond[1:30]
sum(cond)/10^6

