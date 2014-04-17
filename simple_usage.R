## A simple example showing the usage of cacheMatrix.R 

source("cachematrix.R")

A <- makeCacheMatrix(matrix(c(1/3,0,0,2/3),2,2)) #create matrix object A

print(A$get())                             #display A

print(cacheSolve(A))                       #compute A^-1 (1st time)

print(cacheSolve(A))                       #compute A^-1 again, (no computation cached inverse is used) 