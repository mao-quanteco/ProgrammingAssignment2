## makeCacheMatrix creates a matrix object with a cacheable inverse  
## in a way that mimcs a class instantiation in a OO Programming language.
## It returns a list of functions to set and get the matrix itself
## and its inverse.

makeCacheMatrix <- function(X = matrix()) {
    invX <- NULL
    set <- function(Y) {
        X <<- Y
        invX <<- NULL       ## changing X's content we set X^-1 to NULL, thus X^-1 must be computed 
                            ## from scratch by cacheSolve
    }
    get <- function(){
        X
    }
    setinv <- function(inv){
        invX <<- inv
    }
    getinv <- function(){
        invX
    }
    list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## cacheSolve finds the inverse of a matrix object created by makeCacheMatrix,
## if the value of the inverse has already been computed it returns its cached value. 
## The matrix X is assumed to be invertible.

cacheSolve <- function(X, ...) {
        ## Return a matrix that is the inverse of 'X'
    invX <- X$getinv()
    if(!is.null(invX)) {            ## if invX != NULL it has been computed before,
                                    ## thus return cached invX        
        message("getting cached data")
        return(invX)
    }
    invX <- solve(X$get(), ...)     ## else compute X^-1 by R's solve
    X$setinv(invX)
    invX
}
