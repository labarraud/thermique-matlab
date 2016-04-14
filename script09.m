%Oleoduc
clear

%variable
Cp=840;
lambda=0.042;
T0=-4;
T1=4
rho=1700;
Nx=100;
a=lambda/(rho*Cp)
L=0.1;
x(1)=0;


for i=2:Nx
    x(i)=x(i-1)+(L/Nx);
end




%solution theorique
for i=1:Nx
    T_theo(i)=(T1-T0)*erf(x(i)/(2*sqrt(a*12*3600)))+T0;
end


figure(1)
plot(x,T_theo,'b',x,0)
xlabel('x')
ylabel('Temperature')

x0=sqrt(a*12*3600)