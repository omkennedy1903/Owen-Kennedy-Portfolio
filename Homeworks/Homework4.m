%Owen Kennedy 1/26/2021
%%Setting starting conditions
m=100;
n=200;
hold on
%%creating fractal
for i=1:100000
    q=3*rand(1);
    if q<1
        m=m/2;
        n=n/2;
    elseif q<2
        m=m/2;
        n=(300+n)/2;
    else 
        m=(300+m)/2;
        n=(300+n)/2;
    end
    plot(m,n,'r.');
end
hold off