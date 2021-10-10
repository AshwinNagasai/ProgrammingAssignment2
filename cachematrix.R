##Pair of functions to cache the inverse of a matrix

## Creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        ## set the matrix
        x <<- y
        i <<- NULL
    }
    get <- function() {
        ## get the matrix
        x
    }
    setInverse <- function(inverse) {
        ## set the inverse of the matrix
        i <<- inverse
    }
    
    getInverse <- function() {
        # get the inverse of the matrix
        i
    }
    
    list(set = set, 
         get = get, 
         setInverse = setInverse, 
         getInverse = getInverse)
}


# Computes the inverse of the special "matrix" returned by makecacheMatrix
# If the inverse has already been calculated (and the matrix has not changed)
# Retrieve the inverse from the cache
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getInverse()
    ## Check if the inverse has already been calculated
    if(!is.null(i)) {
        message("getting cached data")
        ## Return inverse from the cache
        return (i)
    }  else {
        data <- x$get()
        ## Calculate the inverse using solve
        i <- solve(data, ...)
        x$setInverse(i)
        ## Return the inverse
        i
    }
    
}
