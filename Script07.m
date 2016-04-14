%Laplace-------
clear
t=0.1;

for i=1:100
    x(i)=0+(i-1)/99;
end

%solution matlab


%solution exact
for i=1:100 
    T_theo(i)=exp(-((2*pi)^2)*t)*sin(2*pi*x(i));
end


%formule de Stehfest
V(1:10)=0.;

V(1)=1./12;
V(2)=-385./12;
V(3)=1279;
V(4)=-46871./3;
V(5)=505465./6;
V(6)=-473915./2;
V(7)=1127735./3;
V(8)=-1020215./3;
V(9)=328125./2;
V(10)=-65625./2;

for i=1:100
    var=0.;
    ln2=0.69314718056;
    for j=1:10
       var=var+V(j)*(sin(2*pi*x(i))/((j*(ln2/t))+(2*pi)^2));
    end
    T_iter(i)=(ln2/t)*var;
end    

figure(1)
plot(x,T_theo,'b',x,T_iter,'k'), legend('theorique','iteratif')
xlabel('x')
ylabel('Temperature')
    
figure(2)
plot(x,abs(T_iter-T_theo),'r')
xlabel('x')
ylabel('abs(T_iter-T_theo)')
    