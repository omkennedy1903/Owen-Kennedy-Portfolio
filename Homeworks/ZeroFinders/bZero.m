%%Owen Kennedy - 2/22/2022
function zero = bZero(f,x0,x1,err)
%setting some values for later
numIter=0;
mode=0;
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
%Test to determine which value is positive and negative
if f(x0)>0
    mode=1; %Mode 1: the first f(x) is positive
else
    mode=2; %Mode 2: the first f(x) is negative
end
if mode==1
    while epsilon>err
        xold=xtest;
        numIter=numIter+1;
        xtest=(x0+x1)/2;
        ytest=f(xtest);
        if ytest==0 
            flag=1;
            break
        end
        if ytest>0
            x0=xtest;
        else 
            x1=xtest;
        end 
        epsilon=100*abs(((f(xtest)-f(xold))/f(xtest))); 
    end 
end

if mode==2
    while epsilon>err
        xold=xtest;
        numIter=numIter+1;
        xtest=(x0+x1)/2;
        ytest=f(xtest);
        if ytest==0
            flag=1;
            break
        end
        if ytest<0
            x0=xtest;
        else
            x1=xtest;
        end
        epsilon=100*abs(((f(xtest)-f(xold))/f(xtest)));
    end
end

zero=xtest;
fprintf('Estimated zero is at %f\n', zero);
if flag==0
    fprintf('The relative error is %f\n %', epsilon);
else
    disp('There is no error');
end
fprintf('The true value of f(x) at this x is %f\n', f(zero));
fprintf('There were %.0f iterations \n', numIter);
   %Outputs go here         
        
        
        
    