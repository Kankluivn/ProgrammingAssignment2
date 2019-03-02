## Following are a pair of functions that cache the inverse of a matrix.
## The cached inverse is returned whenever required instead of having it computed repeatedly.

##This function creates a special matrix object that can cache it's inverse

makeCacheMatrix <- function(x = matrix()) {
mi <- NULL
            set <- function(y) {
                    x <<- y
                    mi <<- NULL
            }
            get <- function() x
            setmatrixinverse <- function(solve) mi <<- solve
            getmatrixinverse <- function() mi
            list(set = set, get = get,
                 setmatrixinverse = setmatrixinverse,
                 getmatrixinverse = getmatrixinverse)
}


## This function computes the inverse of the matrix created above.
## If the inverse has already by computed, the function cacheSolve simply retrieves the catched data.

cacheSolve <- function(x, ...) {

mi <- x$getmatrixinverse()
            if(!is.null(mi)) {
                    message("getting cached data")
                    return(mi)
            }
            data <- x$get()
            mi <- solve(data, ...)
            x$setmatrixinverse(mi)
            mi



        ## Return a matrix that is the inverse of 'x'
}
