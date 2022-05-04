function [L,A,P]=luFactor(A)
[r,c]=size(A);

if r~=c
    error('invalid dimensions')
end 
P=eye(r);
L=P;
for i=1:c-1
    
    for j=i:r-1
        if abs(A(j+1,i)) > abs(A(i,i))
            temp = A(i,:);
            A(i,:) = A(j+1,:);
            A(j+1,:) = temp;
            clear temp
            
            temp = P(i,:);
            P(i,:) = P(j+1,:);
            P(j+1,:) = temp;
            flag=1;
            clear temp
        end
        L(j+1,i) = (A(j+1,i)/A(i,i));
        factor = A(j+1,i)/A(i,i);
        A(j+1,:) =  (-A(j+1,:))+((A(i,:).*factor));
        disp(A)
    end 
end
end 
        
    