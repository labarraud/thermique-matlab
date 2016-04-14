%Oleoduc
clear

%variable
d=0.1;
e=0.05;
Text=-15;
L=10000;
m=6.4;
h=30;
Cp=2100;
lambda=0.042;
T0=50;
C=(1./(2*pi*h*((d/2)+e)))+(log(((d/2)+e)/(d/2))/(2*pi*lambda))
Nx=100;

x(1)=0;
for i=2:Nx*10
    x(i)=x(i-1)+(L/Nx);
end

%solution theorique
for i=1:Nx*10
    T_theo(i)=(T0-Text)*exp(-x(i)/(C*m*Cp))+Text;
end



%solution num?rique
T_euler(1:Nx*10)=0.0;
T_euler(1)=50;
for i=2:Nx*10
    T_euler(i)=T_euler(i-1)-(L/Nx)*(1./(C*m*Cp))*(T_euler(i-1)-Text);
end
    

figure(1)
plot(x,T_theo,'b',x,T_euler,'g'), legend('theorique','euler')
xlabel('x')
ylabel('Temperature')

figure(2)
plot(x,abs(T_theo-T_euler),'k')
xlabel('x')
ylabel('Erreur')