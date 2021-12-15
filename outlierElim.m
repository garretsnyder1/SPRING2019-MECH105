function [x,y,a_0,a_1] = outlierElim(x_r,y_r)
%Function will eliminate outliers in a group of data
coeff=polyfit(x_r,y_r,1); %regression
f=polyval(coeff,x_r); %making "prediction" vector
a_1=coeff(1);
a_0=coeff(2);
residuals=y_r-f; %calculating residuals
figure %plotting
subplot(1,2,1)
plot(x_r,y_r,'bo',x_r,f,'r-')
grid
subplot(1,2,2)
plot(x_r,residuals,'ro')
grid
for i=1:length(x_r); %for loop for removing ouliers using residuals
    if abs(residuals(i))>1;
        x_r(i)=[];
        y_r(1)=[];
    end
end
x=x_r;
y=y_r;
end

