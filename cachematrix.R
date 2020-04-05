## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  #lastig; first have to understeand what an inverted matrix is
  #https://masterr.org/r/how-to-cache-a-matrix-inversion-in-r/  
  # change  1 2 3
  #         4 5 6
  #         7 8 9
  # to
  #         1 4 7
  #         2 5 8
  #         3 6 9
  # is this what we are talking about?
  #no, this is totally not interesting :(
  
  ## @x: a square invertible matrix
  ## return: a list containing functions to
  ##              1. set the matrix -> meaning assign the parameter
  ##              2. get the matrix -> meaning getting the stored parameter
  ##              3. set the inverse -> storing the parameter inversed
  ##              4. get the inverse -> getting the inversed stored parameter
  ##         this list is used as the input to cacheSolve()
  m <- NULL
  
  # Define function to set the value of the matrix. 
  # It also clears the old inverse from the cache
  set <- function(y) {
    x <<- y    # Set the value
    m <<- NULL # Clear the cache
  }
  
  # Define function to get the value of the matrix
  get <- function() x
  
  # Define function to set the inverse. This is only used by getinverse() when
  # there is no cached inverse
  setInverse <- function(inverse) m <<- inverse
  # Define function to get the inverse
  getInverse <- function() m
  
  # Return a list with the above four functions
  # this is what i understand :)
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)  
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  # here we have to do something about finding what matrixes are available?
  ## @x: output of makeCacheMatrix()
  ## return: inverse of the original matrix input to makeCacheMatrix()
  
  inv = x$getInverse() #check if the object is gettable 
  
  # if the inverse has already been calculated
  if (!is.null(inv)){
    # get it from the cache and skips the computation. 
    message("getting cached data")
    return(inv)
  }
  
  # otherwise, calculates the inverse 
  mat.data = x$get()
  inv = solve(mat.data, ...)
  
  # sets the value of the inverse in the cache via the setinv function.
  x$setInverse(inv)
  
  return(inv)  
}

#this is the description of the assignment copied from the website
#Matrix inversion is usually a costly computation and there may be some 
#benefit to caching the inverse of a matrix rather than compute it repeatedly 
#(there are also alternatives to matrix inversion that we will not discuss here). Your assignment is to write a pair of functions that cache the inverse of a matrix.

#Write the following functions:
  
#makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
#cacheSolve: This function computes the inverse of the special "matrix" returned 
#by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), 
#then the cachesolve should retrieve the inverse from the cache.

#Computing the inverse of a square matrix can be done with the solve function in R. 
#For example, if X is a square invertible matrix, then solve(X) returns its inverse.
#For this assignment, assume that the matrix supplied is always invertible.

inv_mat_test_frame = function(mat){
  ## @mat: an invertible matrix
  
  temp = makeCacheMatrix(mat)
  
  start.time = Sys.time()
  cacheSolve(temp)
  dur = Sys.time() - start.time
  print(dur)
  
  start.time = Sys.time()
  cacheSolve(temp)
  dur = Sys.time() - start.time
  print(dur)
}
