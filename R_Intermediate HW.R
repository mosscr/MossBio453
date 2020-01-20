data(iris)
head(iris)

## create unique vector of species names
sp_ids = unique(iris$Species)

## creates a blank 3x4 matrix
output = matrix(0, nrow=length(sp_ids), ncol=ncol(iris)-1)

## assign species ids as rownames 
rownames(output) = sp_ids
## assigns column names (sepal.length, sepal.width, petal.length, petal.width)
colnames(output) = names(iris[ , -ncol(iris)])

## loop through species names
for(i in seq_along(sp_ids)) {
  ## subsetting the data for Species to equal sp_ids, and if that is true, don't select species, only the trait.
  iris_sp = subset(iris, subset=Species == sp_ids[i], select=-Species)
  ## going through the columns and if there are more than 0 columns, run the function.
  for(j in 1:(ncol(iris_sp))) {
    x = 0
    y = 0
    if (nrow(iris_sp) > 0) {
      ## iris_sp[k, j] refers to a specific data point, where k is rows and j is columns.There are 50 rows and 4 columns.
      for(k in 1:nrow(iris_sp)) {
        ## add the value of the specific data point [k, j] to the value of x in the matrix, which is zero.
        x = x + iris_sp[k, j]
        ## add one to y as the rows are cycled through.
        y = y + 1
      }
      ## Take the ratio of the x values and y values in the output matrix. 
      output[i, j] = x / y 
    }
  }
}
## outputs filled in matrix. 
output


#3. The variables in the loop were named so as to be vague. How can the objects output, x, and y could be renamed such that it is clearer what is occurring in the loop.
   ##Y can be named 'Row Number' and x can be named 'Sum of Traits'. The overall output can be named "Average Traits".  
#4. It is possible to accomplish the same task using fewer lines of code. Please suggest one other way to calculate output that decreases the number of loops by 1.
   ## You can remove the loop that is coded: 
       ## for(j in 1:(ncol(iris_sp))) {
          ## x = 0
          ## y = 0
          ## if (nrow(iris_sp) > 0)
  ## You can remove this because we already know that there is more than 0 rows, so you can just run the next part of the code for 1:50, as there are 50 rows. 
#5. You have a vector x with the numbers 1:10. Write a for loop that will produce a vector y that contains the sum of x up to that index of x. So for example the elements of x are 1, 2, 3, and so on and the elements of y would be 1, 3, 6, and so on.
   ## y <- cumsum(1:10)
   ## for (x in 1:10) {
        ## print (y)
## }
#6. Modify your for loop so that if the sum is greater than 10 the value of y is set to NA
   ## for (x in 1:10) {
    ## (print(y))
    ## if(x > 9) (print('NA'))
## }
#7. Place your for loop into a function that accepts as its argument any vector of arbitrary length and it will return y.
    ## eval_class <- function(x){
        ## for (x in 1:10) {
        ## print(y)
        ## }
        ## return(x)
     ## } 
    ## eval_class(x)
