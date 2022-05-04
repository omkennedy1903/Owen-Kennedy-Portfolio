%%The function
function Norm = Fnorm(x)
frob=x.^2;
frob2=sum(frob,'all');
Norm=sqrt(frob2);
end


