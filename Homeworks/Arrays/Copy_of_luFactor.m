function [L,A,P]=Copy_of_luFactor(A)
[r,c]=size(A);

if r~=c
    error('invalid dimensions')
end 
P=eye(r);
L=P;
for i=1:c-1
    
    for j=i+1:r
        if abs(A(j,i)) >= abs(A(i,i))
            for t=i:c
                
                temp = A(i,t);
                A(i,t) = A(j,t);
                A(j,t) = temp;
                
                temp = P(i,t);
                P(i,t) = P(j,t);
                P(j,t) = temp;
                flag=1;
            end
        end
        L(j,i) = (A(j,i)/A(i,i));
        factor = A(j,i)/A(i,i);
        for l=i:c
            A(j,l)=(A(j,l)-(A(i,l).*factor));
        end
        disp(A)
    end 
end
end 
        
    