%%Owen Kennedy - 2/22/2022
function zero = hw11(func,x1,xu,es,maxit)
%setting some values for later
numIter=0;
xtest=x1;
flag=0;
if nargin<4
    maxit=200;
    es=0.0001;
elseif nargin<5
    maxit=200;
else 
    es=abs(es);
    maxit=abs(maxit);
end
epsilon=es+1;
%is the bracket correct?
if (func(x1)*func(xu))>0
    error('Invalid bracket; either no zeros, invalid zero, or more than one zero. Please check bounds and try again.');
elseif (func(x1)*func(xu))==0
    error('There is a zero at one of the specified x values')
end
while epsilon>es
    numIter=numIter+1;
    %some fancy math to find x intercept from slope
    xold=xtest;
    slope = (func(xu)-func(x1))/(xu-x1);
    yint = func(x1)-(slope*x1);
    xtest = (-yint)/slope;
    if func(xtest)==0
        flag = 1;
        break
    end 
    %finding the error
    epsilon=100*abs(((xtest-xold)/xtest)); 
    %setting new bounds
    if func(x1)*func(xtest) > 0 
        x1=xtest;
    else 
        xu=xtest;
    end 
    if numIter==maxit
        disp('Maximum number of iterations reached');
        break
    end
end 
zero=xtest;
fprintf('Estimated zero is at %f\n', zero);
if flag==0
    fprintf('The relative error is %f percent \n', epsilon);
else
    fprintf('The relative error is %f percent \n', epsilon);
    disp('This is a true zero');
end
fprintf('The true value of f(x) at this x is %f\n', func(zero));
fprintf('There were %.0f iterations \n', numIter);
   
        
        
        
    