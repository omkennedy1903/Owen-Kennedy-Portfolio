function [L,U,P] = luFactor555(A)
P=eye(3);
%%error checking
sizeA=size(A);
if sizeA(1) ~= 3 || sizeA(2) ~= 3
    error('invalid dimensions for arrays, A array must be 3x3, B array must be 3x1');
end 
%%First Pivoting
if abs(A(1,1)) < abs(A(2,1))
    temp = [A(1,1),A(1,2),A(1,3)];
    A(1,1)=A(2,1);
    A(1,2)=A(2,2);
    A(1,3)=A(2,3);
    %
    A(2,1) = temp(1);
    A(2,2) = temp(2);
    A(2,3) = temp(3);
    %
    temp=P(2,:);
    P(2,:) = P(1,:);
    P(1,:)=temp;
end 
%%first forward elimination
factor1= (A(2,1)/A(1,1));
A(2,1) = (A(2,1))-(A(1,1)*factor1);
A(2,2) = (A(2,2))-(A(1,2)*factor1);
A(2,3) = (A(2,3))-(A(1,3)*factor1);
%%second Pivoting
if abs(A(1,1)) < abs(A(3,1))
    temp = [A(1,1),A(1,2),A(1,3)];
    A(1,1)=A(3,1);
    A(1,2)=A(3,2);
    A(1,3)=A(3,3);
    %
    A(3,1) = temp(1);
    A(3,2) = temp(2);
    A(3,3) = temp(3);
    %
    temp=P(3,:);
    P(3,:) = P(1,:);
    P(1,:)=temp;
end 
%%Second forward elimination
factor2= (A(3,1)/A(1,1));
A(3,1) = (A(3,1))-(A(1,1)*factor2);
A(3,2) = (A(3,2))-(A(1,2)*factor2);
A(3,3) = (A(3,3))-(A(1,3)*factor2);
%First factor eliminated

%%Second factor pivoting
if abs(A(2,2)) < abs(A(3,2))
    temp = [A(2,2) , A(3,3)];
    A(2,2) = A(3,2);
    A(2,3) = A(3,3);
    %
    A(3,2) = temp(1);
    A(3,3) = temp(2);
    %
    temp=P(2,:);
    P(2,:) = P(3,:);
    P(3,:)=temp;
end 
%% Second factor elimination 
factor3=(A(3,2)/A(2,2));
A(3,2) = A(3,2)-(A(2,2)*factor3);
A(3,3) = A(3,3)-(A(2,3)*factor3);
%Elimination complete
U=A;
%%making the L matrix
L=P;
temp=P(1,:);
temp2=P(2,:);
temp3=P(3,:);
if temp(3) == 1
    L(1,1) = factor2;
    L(2,2) = factor3;
elseif temp2(3)==1
    L(2,1) = factor2;
    L(2,2) = factor3;
else
    L(3,1) = factor2;
    L(3,2) = factor3;
end
if temp(2)==1
    L(1,1) = factor1;
elseif temp2(2) == 1
    L(2,1) = factor1;
else
    L(3,1) = factor1;
end
end 
