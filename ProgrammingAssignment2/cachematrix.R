makeCacheMatrix <- function(x = matrix()) {
  # sets x equal to an empty matrix
  I <- NULL
  # Set the inverse equal to NULL
  
  set <- function(y){
    x <<- y
    # set function assigns the argument to x
    I <<- NULL
    # Once the set function is called, Inverse is re-set to NULL (this is important if you redefine the matrix, x)
  }
  get <- function() x
  # get function returns the matrix
  
  setInverse <- function(solve) I <<- solve
  # setInverse overrides the previous value of I and assigns the argument to Inverse (which is supposed to be the inverse of matrix x)
  
  getInverse <- function() I
  # getInverse returns the Inverse
  
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
  # creates a list of the functions
  
}

# Part 2: cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  I <- x$getInverse()
  # Retrives the most recent value for the inverse
  
  if(!is.null(I)){
    message("getting cached data")
    return(I)
    # If cached value exists return the value        
  }
  # If the value of Inverse is NULL, then you retrive matrix x and calculate the inverse with the solve() function
  message("Calculating Inverse..")
  data <- x$get()
  I <- solve(data, ...)
  x$setInverse(I)
  # Sets Inverse to the newly calculated value   
  I #Returns the new Inverse value
}

