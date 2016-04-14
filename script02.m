%TP1 transfert thermique ------------ Question IIa)2-------
clear
lambda=0.9
dx=0.01
cfl=0.01
%zoom 
%cfl=0.498
var=1
n=0
for i=1:100
    x(i)=0+(i-1)/99
end

dt=(dx^2*cfl)/lambda

T(1:100) =0.5 
T_next(1:100)=0.

T(1:100) =  0.5 
T1(1:100) =  0.5 
T2(1:100) =  0.5 
T3(1:100) =  0.5 
T_next(1:100)=0.
    
for j=1:199
    T(1:100) =  0.5 ;
    var=1.;
    n=0;
while var>1e-5
            T_next(1)=0;
        for i=2:99
            T_next(i)=T(i)+cfl*(T(i+1)+T(i-1)-2*T(i));
        end
            T_next(100)=1;
            var=max(abs(T-T_next));
            T=T_next;
            
            
        if(j==80) %cfl=0.4   
            if n==10 
                T1=T_next;
            end
            if n==100
                T2=T_next;
            end
            if n==1000 
                T3=T_next;
            end
            if (1000<n) && (n<10000)
                T4=T_next;
            end
        end
            n=n+1;
end
    cfltab(j)=cfl;
    ntab(j)=n
    cfl=cfl+0.005;
    %zoom 0.495 - 0.5
    %cfl=cfl+0.00005

end
figure(1)
plot(x,T4)
xlabel('x')
ylabel('Temperature')

figure(2)
axis manual
axis([-inf,inf,0,40000])
hold on
plot(cfltab,ntab)
xlabel('CFL')
ylabel('nombre d''iterations n')

hold off
figure(3)
plot(x,T4, 'k',x,T1,'g',x,T2,'b',x,T3,'r'), legend('solution final apres convergence', 'apres 10 interations', 'apres 100 interations', 'apres 1000 interations')
xlabel('x')
ylabel('Temperature')