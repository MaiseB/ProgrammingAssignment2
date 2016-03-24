## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a vector is a list containing a function to;
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverted matrix
## 4. get the value of the inverted matrix

## example of how to use this function:
## m <- makeCacheMatrix(matrix(c(12,15,16,17), nrow=2, ncol=2))
## nrow and ncol are 2x2 because this is an invertible matrix (needs to be square)

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function (y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(solve) inv <<- solve
        getinv <- function() inv
        list (set = set, get = get, setinv = setinv, getinv=getinv)
}

## cacheSolve calculates the inverse of the matrix from above function,
## but checks to see if this has already been done. If already calculated,
## it will return the cached value. Otherwise, it will calculate the inverse
## and set the value of the inverse in the setinv function from above. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data)
        x$setinv(inv)
        inv
}