%%Owen Kennedy 2/3/22
flag=0;
e=1;
e=abs(e);
olde=e;
while (1)
    e=e/2;
    
    if e==0
        break
    else
        olde=e;
    end
end

disp(olde)