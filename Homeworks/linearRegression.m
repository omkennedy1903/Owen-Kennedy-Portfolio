function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
counter=0;
[xr,xc] = size(x);
fX = x;
fY = y;
%%finding quartiles

[ysort,order]=sort(fY);
xsort=x(order);

q1=ysort(floor((xc+1)/4));
q3=ysort(floor((3*xc+3)/4));
%%find outlier
for i=1:xc 
    if fY(i)>(1.5*q3) || fY(i)<(0.75*q1)
        fY(i) = [];
        fX(i)=[];
        counter = counter+1;
    end
end
fprintf('%f outliers have been removed \n', counter)
%%Constructing the line
xy=x.*y;
sqx=x.^2;
a1=(xc*(sum(xy)))-(sum(x)*sum(y))/(xc*(sum(sqx))-((sum(x))^2));
a0 = mean(y)-(a1*mean(x));
slope = a1;
intercept = a0;
end 


    