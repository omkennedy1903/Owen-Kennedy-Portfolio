function [I] = Simpson(x,y)
[xr,xc] = size(x);
[yr,yc] = size(y);
flag=0;
%%error checker
if xr~=1 || yr~=1
    error('Inputs must be row vectors, not arrays');
end 
if xc~=yc
    error('x and y vectors must be same length');
end 
h=(x(xc)-x(1))/(xc-1);
for p=2:xc
    if x(p)-x(p-1)~=h
        error('x vector is not equally spaced');
    end 
end 
%%now we can solve the problem
if floor((xc-1)/2) ~= (xc-1)/2
    flag=1; %determines if we must use trap rule
end 
I=0;
t=1;
for i=1:floor((xc-1)/2)
    I=I+((x(t+2)-x(t))*(y(t)+4*(y(t+1))+y(t+2)))/6;
    t=2+t;
end
if flag==1
    I=I+(h*(y(yc)-y(yc-1))/2);
    disp('Warning: trapezoid rule was used for last interval')
end
end 
