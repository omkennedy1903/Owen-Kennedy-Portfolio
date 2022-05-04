%%The function
function Norm = FirstFnorm(x)
r=size(x);
m=r(1);
n=r(2);
frob = 0;
for i=1:m
    for j=1:m
        frob= frob+ (x(i,j))^2;
    end
end
Norm=sqrt(frob);
end


