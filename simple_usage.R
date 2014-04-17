## A simple example showing the usage of cacheMatrix.R 

source("cachematrix.R")
A <- makeCacheMatrix(matrix(c(1/3,0,0,2/3),2,2)) #create matrix object A
A$get()                             #display A
cacheSolve(A)                       #compute A^-1 (1st time)
A$getinv()                          #display A^-1
cacheSolve(A)                       #compute A^-1 again, (no computation cached inverse is used) 