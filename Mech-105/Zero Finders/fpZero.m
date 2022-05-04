%%Owen Kennedy - 2/22/2022
function zero = fpZero(f,x0,x1,err)
%setting some values for later
numIter=0;
xtest=x0;
flag=0;
if nargin<4
    err=0.001;
else 
    err=abs(err);
end
epsilon=err+1;
%is the bracket correct?
if (f(x0)*f(x1))>0
    error('Invalid bracket; either no zeros, invalid zero, or more than one zero. Please check bounds and try again.');
elseif (f(x0)*f(x1))==0
    error('There is a zero at one of the specified x values')
end
while epsilon>err
    numIter=numIter+1;
    %some fancy math to find x intercept from slope
    xold=xtest;
    slope = (f(x1)-f(x0))/(x1-x0);
    yint = f(x0)-(slope*x0);
    xtest = (-yint)/slope;
    if f(xtest)==0
        flag = 1;
        break
    end 
    %finding the error
    epsilon=100*abs(((f(xtest)-f(xold))/f(xtest))); 
    %setting new bounds
    if f(x0)*f(xtest) > 0 
        x0=xtest;
    else 
        x1=xtest;
    end 
end 
zero=xtest;
fprintf('Estimated zero is at %f\n', zero);
if flag==0
    fprintf('The relative error is %f\n %', epsilon);
else
    disp('There is no error; this is a true zero');
end
fprintf('The true value of f(x) at this x is %f\n', f(zero));
fprintf('There were %.0f iterations \n', numIter);
   
        
        
        
    