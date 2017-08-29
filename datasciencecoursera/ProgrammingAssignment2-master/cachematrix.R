## Below are two functions that are used to create a
## special object that stores a matrix and caches its inverse.

## this function creates a list containing a function to

## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  set the value of the inverse
## 4.  get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {

    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get
         ,
         setinverse = setinverse,
         getinverse = getinverse)
  
  

}


## this function will return the inverse of a matrix passed in an input. it checks if it has 
## been cached already. if so, it returned the cached inverse, if not, it computes the inverse
## and then caches it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  
    m <- x$getinverse()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
  
  
}
