#Array Functions

##luFactor.m
- Function that will factor a n by n matrix into LU form, producing upper and lower triangular matricies. The function is capable of partial pivoting and will do so if appropriate. The function is **only** capable of preforming this for functions with size 4x4 or less, otherwise results may not be accurate. 

###Inputs
A - the matrix to be factored 
###Outputs
L - matrix containing coefficients for factorization
U - matrix containing the factored form of the matrix
P - matrix responsible for storing the data of how the array was pivoted
