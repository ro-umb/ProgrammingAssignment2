## Overall these functions cache the inverse of a matrix 

## The "makeCacheMatrix" function creates a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
u <- NULL
set <- function(y) {
  x <<- y
  u <<- NULL
}
get <- function() x
setinverse <- function(inverse) u <<- inverse
getinverse <- function() u
list(set = set, get = get, setinverse = setinverse,
     getinverse = getinverse)
}

## The "cacheSolve" function computes the inverse of the matrix returned by "makeCacheMatrix" function

cacheSolve <- function(x, ...) {
u <- x$getinverse()
if(!is.null(u)) {
  message("getting cached data")
  return(u)
}
data <- x$get()
u <- solve(data, ...)
x$setinverse(u)
u
}
