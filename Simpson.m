function I=Simpson(x,y)
%The Simpson function uses the 1/3 Simpson rule of integration to evaluate
%the integral of an array of inputs and an array of outputs. It checks to
%make sure the input array is evenly spaced and of the same length as the
%output array. It then uses either the 1/3 Simpson rule to integral numerically
%or the 1/3 rule in conjunction with the trapezoid rule, depending on if
%the number of intervals is even or odd, respectively.
%           INPUTS: x - the input array
%                   y - the output array
%           OUTPUTS: I - the computed value of the integral

len=length(x);
leny=length(y);
spaceCheck=linspace(min(x),max(x),len); %makes a spacing array for logical
logic=spaceCheck==x                     %comparison

if nargin ~=2           %series of error checks
    error('Must be 2 inputs, an array of input and an array of outputs')
elseif len~=leny
    error('Input and output arrays must be the same length')
elseif len~=sum(logic)
    error('Improper spacing on first input, must be equally spaced')
end

h=x(2)-x(1);   %obtains the spacing
if rem(len,2)~=0      %checks if even number of intervals
    chunk=y(2:len-1); %obtains the 'middle' section of data points
    I=(h/3)*(y(1)+4*sum(chunk)+y(len));   %application of 1/3 rule
else
    chunk=y(2:len-2);
    I=(h/3)*(y(1)+4*sum(chunk)+y(len-1));
    trap=h*((y(len)+y(len-1))/2);    %obtains area of trailing trapezoid
    I=I+trap;
end
    
    
    