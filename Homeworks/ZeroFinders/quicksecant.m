%%secant Quick!!!
ep = 0.05;
x1=0.5825;
it=0;
while it<22
    it=it+1;
    x2=x1-((ep*x1*func2(x1))/(func2(x1+(x1*ep))-func2(x1)));
    x1=x2;
    disp(x1)
end 