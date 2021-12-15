function [root,fx,ea,iter] = falsePosition(func,xL,xU,es,maxiter)
%falsePosition estimates the root of a given function using the false
%position method. The user must input two x-values that surround the root,
%an upper and a lower bound, before the calculation can be made. The
%function then uses the value of the function at those two x-values and
%creates a linear function that satisfies both points. The root of the
%linear function is calculated and used as the estimate of the root of the
%initial function. If the sign of the initial function at the root estimate
%is the same as the sign of the upper bound, then the root estimate becomes
%the new upper bound, otherwise it becomes the new lower bound. The
%approximate error is then calculated and the calculation is repeated using
%the new upper or lower bound until the maximum number of iterations
%specified is met or the maximum approximate error is met.
%   INPUTS:
%       func: The function of which you want to determine the root. Must be
%       entered in the form: '@(x) FUNCTION'
%       xL: The lower bound of the root, as close to the true root as can
%       be estimated graphically
%       xU: The upper bound of the root
%       es: (defaults to 0.0001%) The stopping criteria for percent
%       approximate error of the root estimates. Each time a root is
%       estimated, the previous root estimate is subtracted from the
%       current. This value is then divided by the current estimate and
%       multiplied by 100 to get a percent error approximation. When this
%       approximation falls below the value of es, the program terminates
%       and the root is given at its most recent approximation
%       maxiter: (defaults to 200) Each time a root is estimated is
%       considered an iteration. Once the number of iterations reaches the
%       value of maxiter, the program terminates and the root is given at
%       its most recent
%       approximation
%   OUTPUTS:
%       root: The most recent approximation of the root of the function
%       when the stopping criteria was met
%       fx: The value of the function at the estimated root
%       ea: The most recent percent approximate error calculated before the
%       stopping criteria was met
%       iter: The iteration on which the program was terminated.

if nargin<3 %to insure the inputs are correct and default properly if needed
    error('Not enough input arguments')
elseif nargin==3
    es=0.0001;
    maxiter=200;
elseif nargin==4
    maxiter=200;
else
end

if (func(xL)*(xU))>0 %to insure the bounds surround a root
    error('Improper bounds')
end

iter=0; %iteration counter at 0 to start

while iter<maxiter %to insure iter doesn't exceed maxiter
    root=xU-((func(xU)*(xL-xU))/(func(xL)-func(xU))); %finds root estimate
    if sign(func(root))==sign(func(xU)) %check signs of outputs to see which bound to replace
        ea=((root-xU)/root)*100; %calculating error from the newly calculated root and the old bound
        xU=root; %replacing the bound with the root
    else
        ea=((root-xL)/root)*100;
        xL=root;
    end
    iter=iter+1;
    if ea<es %insuring that the code terminated when the error is below the stopping criteria
        break
    end
end
fx=func(root); %defining fx for the output
end

