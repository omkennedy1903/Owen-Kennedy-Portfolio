%Owen Kennedy 1/26/2021
%%Setting starting conditions
m=1;
n=2;
hold on
mm(1)=0;
nn(1)=0;
%%creating fractal
for i=1:100000
    q=3*rand(1);
    if q<1
        mm(i)=m/2;
        nn(i)=n/2;
    elseif q<2
        mm(i)=m/2;
        nn(i)=(300+n)/2;
    else 
        mm(i)=(300+m)/2;
        nn(i)=(300+n)/2;
    end
end
hold off
plot(mm,nn,'r.');