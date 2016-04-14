%Oleoduc
clear

%variable
d=0.1;
e=0.05;
Text=-15;
L=1;
m=6.4;
h=0.01;
q1=0.01;
q2=0.01;
Nx=100;

T1(1)=100;
T2(1)=10;

x(1)=0;
for i=2:Nx
    x(i)=x(i-1)+(L/Nx);
end


%solution num?rique
for i=2:Nx
    T1(i)=T1(i-1)-(L/Nx)*(h/q1)*(T1(i-1)-T2(i-1));
    T2(i)=T2(i-1)-(L/Nx)*(h/q2)*(T2(i-1)-T1(i-1));
end
    

figure(1)
plot(x,T1,'b',x,T2,'r')
xlabel('x')
ylabel('Temperature')

%contre courant
q1=0.004;
q2=-0.012;
T2(1)=10;
%solution num?rique
for i=2:Nx
    T1(i)=T1(i-1)-(L/Nx)*(h/q1)*(T1(i-1)-T2(i-1));
    T2(i)=T2(i-1)-(L/Nx)*(h/q2)*(T2(i-1)-T1(i-1));
end

figure(2)
plot(x,T1,'b',x,T2,'r')
xlabel('x')
ylabel('Temperature')