clear
lambda=0.9
dx=0.01
%cfl=0.01
%zoom 
cfl=0.995
var=1
n=0
for i=1:100
    x(i)=0+(i-1)/99
end

dt=(dx^2*cfl)/lambda

T(1:100) =0.5 ;
T_next(1:100)=0.;

T(1:100) =  0.5 ;
T1(1:100) =  0.5 ;
T2(1:100) =  0.5 ;
T3(1:100) =  0.5 ;
T_next(1:100)=0.;
    
for j=1:198
    T(1:100) =  0.5 ;
    var=1.;
    n=0;
while var>1e-5
            
    %monte
    T_next(1)=0;
    for i=2:99
        T_next(i)=T(i)+cfl*(T(i+1)+T_next(i-1)-2*T(i));
    end
    T_next(100)=1;
    T=T_next;
    
    %descente
    T_next(100)=1;
    for i=99:-1:2
        T_next(i)=T(i)+cfl*(T_next(i+1)+T(i-1)-2*T(i));
    end
    T_next(1)=0;
    var=max(abs(T-T_next));
    T=T_next;
    
    
    if(j==160) %cfl=0.4
        if n==1
            T1=T_next
        end
        if n==2
            T2=T_next
        end
        if n==3
            T3=T_next
        end
        if (n<10000)
            T4=T_next;
        end
    end
    n=n+1;
end
    cfltab(j)=cfl;
    ntab(j)=n;
    %cfl=cfl+0.005
    %zoom 0.95 - 1
    cfl=cfl+0.000025

end
figure(1)
plot(x,T_next)
xlabel('x')
ylabel('Temperature')

figure(2)
plot(cfltab,ntab)
xlabel('CFL')
ylabel('nombre d''iterations n')

hold off
figure(3)
plot(x,T4, 'k',x,T1,'g',x,T2,'b',x,T3,'r'), legend('solution final apres convergence', 'apres 1 interations', 'apres 2 interations', 'apres 3 interations')
xlabel('x')
ylabel('Temperature')