## I implement two functions that (1) creates a special "matrix" object which can also catch its inverse. 
## (2) another function that compute the inverse of a matrix. This functions checks for the existence of the inverse of a matrix, 
## if one is found, the catched inverse is returned, otherwise, a new inverse is computed

## the function creates a special "matrix" object which can also catch its inverse

makeCacheMatrix <- function(x = matrix()) {
	
	inverseMatrix <- NULL
	
	setMatrix <- function(y) {
		x <<- y
		inverseMatrix <<- NULL
	}
	
	getMatrix <- function() {
		x 
	}
	
	setInverseMatrix <- function(invMatrix) {
		
		inverseMatrix <<- invMatrix
	}
	
	getInverseMatrix <- function() {
		
		inverseMatrix
	}
	
	list(setMatrix = setMatrix, getMatrix = getMatrix, 
	     setInverseMatrix = setInverseMatrix, getInverseMatrix = getInverseMatrix)
}


## this function uses the makeCacheMatrix function to check existence of the inverse of a matrix in the cache or compute a new inverse
## if not found 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        inverseMatrix <- x$getInverseMatrix()
        
        if(!is.null(inverseMatrix)){
        	   message("getting cached matrix")
        	   return (inverseMatrix)
        }
        
        originalMatrix <- x$getMatrix()
        inverseMatrix <- solve(originalMatrix)
        x$setInverseMatrix(inverseMatrix)
        inverseMatrix
}