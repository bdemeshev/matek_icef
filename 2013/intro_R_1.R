# create two matrices
A <- matrix(c(5,7,6,8),nrow=2)
A
B <- matrix(c(1,2,4,5,6,7,4,3,2),nrow=3)

det(A) # determinant of A
det(B)

solve(A) # inverse of A

eigen(A) # eigenvalues and eigenvectors of A

eigen(A)$values # eigenvalues only 
eigen(A)$values[2] # second eigenvalue
eigen(A)$vectors[,1] # first eigenvector

eigen(B)

# Привет людям, сидящим на первой парте! :)

# define NEW function ksusha
ksusha <- function(x) {
  answ <- exp(-x^2)*cos(x)
  return(answ)
}

# use new function
ksusha(2)

# integral from 0 to 20
integrate(ksusha,0,20)

# arctan(+infinity)
atan(+Inf)
# pi/2
pi/2






