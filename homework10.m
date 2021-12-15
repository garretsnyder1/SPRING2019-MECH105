clc
clear
x=[-100:10:100]
y=sqrt((9.81*95/x)).*tanh((sqrt((9.81.*x)/95)*9))-46
plot(x,y)