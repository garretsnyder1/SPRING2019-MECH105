function [L,U,P]=luFactor(A)
%By: Garret Snyder
%Created:3-29-2019
%Last Modified:4-3-2019
%luFactor takes an matrix, the sole input, and decomposes it into an L
%matrix and a U matrix using gauss elimination and pivoting. It also
%outputs the final pivot matrix.
%   INPUTS:
%       A - the array you wish to decompose (the ONLY input)
%   OUTPUTS:
%       L - the lower triangular matrix as a result of gaussian elimination
%       U - the upper triangular matrix as a result of gaussian elimination
%       P - the final pivoted identity matrix

[n,m]=size(A);
if n~=m
    error('Array dimensions must be square')
elseif nargin~=1
    error('Must be only 1 input')
end
P=eye(n);   %creating matrices to work with
L=eye(n);
U=A;
for i=1:n-1
    [~,piv]=max(abs(U(i:n,i))); %first for loop takes the max abs
    modPiv=piv+(i-1);           %value and swaps it into the first row    
    maxRow=U(modPiv,1:n);
    swapRow=U(i,1:n);
    U(i,1:n)=maxRow;
    U(modPiv,1:n)=swapRow;
    maxPiv=P(modPiv,1:n);       %utilizes the index of the max from
    swapPiv=P(i,1:n);           %above and pivots P accordingly
    P(i,1:n)=maxPiv;
    P(modPiv,1:n)=swapPiv;
    for j=i:n-1                 %second for loop finds the ratios and
        ratio=(U(1+j,i))/(U(i,i));   %uses them to edit U
        U(1+j,i:n)=U(1+j,i:n)-(ratio*U(i,i:n));    
        L(1+j,i)=ratio;         %ratio is placed in L
    end
    if i>1 && modPiv>i          %this if statement insures no swapping
        for k=1:i-1             %occurs on the first iteration
            modPivL=L(modPiv,(i-k));
            swapL=L(i,(i-k));   %for loop uses the pivoting index from 
            L(i,(i-k))=modPivL; %above to swap the L values 1 row at a time
            L(modPiv,(i-k))=swapL;
        end
    end
end
