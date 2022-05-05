#Integration

##Simpson
Function that calculates the integral of a set of data points using multiple applications of Simpson's 1/3 rule. If the amount of segments is not even, it will use a single application of the trapezoidal rule to calculate the final segment, and will warn the user when it has done so. 

###Inputs
x - Array storing values of the independent variable
y - Array storing values of the dependent variable
###Outputs
I - An integer representing the estimated integral of the function. 
