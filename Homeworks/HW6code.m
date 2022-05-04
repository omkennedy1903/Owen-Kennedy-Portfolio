clear;
clc;
a=.999999;
exp=-1;
r(1)=0;
place=1;
while(1)
    curv=2^(exp);
    if curv<a
        a=a-curv;
        r(place)=1;
    elseif curv==a
        a=a-curv;
        r(place)=1;
        break 
    else
        r(place)=0;
    end
    place=place+1;
    exp=exp-1;
    if place>64
        error('too many digits')
    end 
end 
    
        
    