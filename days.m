function [nd] = days(mo,da,leap)
%This function will tell you how many days have elapsed since the start of
%the year. mo is an input of 1-12 representing the current month. da is an
%input of 1-31 representing the current day. leap should be input as 1 if
%it is a leap year and 0 if it is not.
if leap==1
    monthdays=[31,29,31,30,31,30,31,31,30,31,30,31];
elseif leap==0
    monthdays=[31,28,31,30,31,30,31,31,30,31,30,31];
else
    disp('Error, enter a 1 if it is a leap year and a 0 if it is not')
end
nd=sum(monthdays(1:(mo-1)))+da;
disp(nd)
end

