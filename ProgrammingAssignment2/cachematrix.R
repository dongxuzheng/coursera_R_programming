## Put comments here that give an overall description of what your
## functions do

## In this function, there are four sub-functions within it. It set up the original matrix and the target matrix
## After that,  <<- was used to set the matrix in global enviroment. 
makeCacheMatrix <- function(x = matrix()) {
  ##set the inverse of the original matrix
  x <- NULL
  
  ##set function for original matrix and inverse matrix
  set_original_mat <- function(y){
    original_mat <<- y
    x <- NULL
  }
  
  ## set function to get orginal matrix
  get_original_mat <- function(){
    original_mat
  }
  
  ## set function to set inverse matrix
  set_inverse_mat <- function(inverse_mat){
    x <<- inverse_mat
  }
  
  ## set function to get inverse matrix
  get_inverse_mat <- function(){
    x
  }
  list(set_original_mat = set_original_mat,
       get_original_mat = get_original_mat,
       set_inverse_mat = set_inverse_mat,
       get_inverse_mat = get_inverse_mat)

}


## In this function, the result of the first function was used as input, so we have ways to get the original matrix and calculate the inverse matrix
## solve() function was used to get the inverse matrix

cacheSolve <- function(x, ...) {
  ## get the "get inverse mat" function vis $
  x <- x$get_inverse_mat()
  
  ## check if it is null
  if(!is.null(x)){
    message("getting cached data")
    return(x)
  }
  ## get the original mat
  data <- x$get_original_mat()
  ## get the inverse mat
  inv_mat <- solve(data)
  ## cache the inverse mat
  x$set_inverse_mat(inv_mat)
  ## we got it!
  inv_mat
}

## Here is an example.
x <- matrix(c(1,0,0,1), nrow = 2)
a <- makeCacheMatrix(x)
cacheSolve(a)












