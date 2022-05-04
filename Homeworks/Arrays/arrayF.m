function [L,U,P] = luFactor(A)
P=eye(3);
%%error checking
sizeA=size(A);
sizeB=size(B);
if sizeA(1) ~= 3 || sizeA(2) ~= 3
    error('invalid dimensions for arrays, A array must be 3x3, B array must be 3x1');
end 
if  sizeB(1) ~= 3 || sizeB(2) ~= 1
    error('invalid dimensions for arrays, A array must be 3x3, B array must be 3x1');
end 
%%First Pivoting
if A(1,1) < A(2,1)
    temp = [A(1,1),A(1,2),A(1,3)];
    A(1,1)=A(2,1);
    A(1,2)=A(2,2);
    A(1,3)=A(2,3);
    %
    A(2,1) = temp(1);
    A(2,2) = temp(2);
    A(2,3) = temp(3);
    %
    temp = B(1);
    B(1)=B(2);
    B(2)=temp;
    %
    temp=P(2,:);
    P(2,:) = P(1,:);
    P(1,:)=temp;
end 
%%first forward elimination
factor1= (A(2,1)/A(1,1));
A(2,1) = (A(1,1)*factor1)-(A(2,1));
A(2,2) = (A(1,2)*factor1)-(A(2,2));
A(2,3) = (A(1,3)*factor1)-(A(2,3));
B(1) = (B(1)*factor1)-B(2);
%%second Pivoting
if A(1,1) < A(3,1)
    temp = [A(1,1),A(1,2),A(1,3)];
    A(1,1)=A(3,1);
    A(1,2)=A(3,2);
    A(1,3)=A(3,3);
    %
    A(3,1) = temp(1);
    A(3,2) = temp(2);
    A(3,3) = temp(3);
    %
    temp = B(1);
    B(1) = B(3);
    B(3) = temp;
    %
    temp=P(3,:);
    P(3,:) = P(1,:);
    P(1,:)=temp;
end 
%%Second forward elimination
factor2= (A(3,1)/A(1,1));
A(3,1) = (A(1,1)*factor2)-(A(3,1));
A(3,2) = (A(1,2)*factor2)-(A(3,2));
A(3,3) = (A(1,3)*factor2)-(A(3,3));
B(3) = (B(1)*factor2)-B(3);
%First factor eliminated

%%Second factor pivoting
if A(2,2) < A(3,2)
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
A(3,2) = (A(2,2)*factor3)-A(3,2);
A(3,3) = (A(2,3)*factor3)-A(3,3);
B(3)=(B(2)*factor3)-B(3);
%%Solving for the variables
%known variable
x3=B(3)/A(3,3);
x2=((B(2)-(x3*A(2,3)))/A(2,2));
x1=((B(1)-(x2*A(1,2))-(x3*A(1,3)))/A(1,1));
%%Factors found
fprintf('The factors are... %f/n');
disp(x1)
disp(x2)
disp(x3)
U=A;
%%making the L matrix
L=eye(3);
L(2,1) = factor1;
L(3,1) = factor2;
L(3,2) = factor3;
end 
