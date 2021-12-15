TF = 32:3.6:93.2;
TC = 5/9*(TF-32);
rho = 5.5289e-8*TC.^3-8.5016e-6*TC.^2+6.5622e-5*TC+0.99987
%plot(TC,rho)
%xlabel('Temperature (Celcius)')
%ylabel('Density [g/cm^3]')
%title('Temperature vs Water Density')
qo=10;
r=60;
l=9;
c=.00005;
t=0:.01:.8;
qt=qo*exp((-r.*t)/(2*l)).*cos(sqrt(1/(l*c)-((r/(2*l))^2)).*t);
%plot(t,qt)
%xlabel('Time')
%ylabel('Charge')
%title('Capacitor Charge Over Time')

z=-5:.01:5;
f=(1/(2*pi)).*exp((-2*z.^2)/2);
plot(z,f)
xlabel('Z')
ylabel('Frequency')
title('Frequency Dependent on Z')