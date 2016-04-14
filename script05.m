clear;
cfl=0.1
T1=1
T0=0
L=1
lambda=0.09
Nx=100

%LAMBDA_GEOM Summary of this function goes here
%Detailed explanation goes here
for i=1:Nx
    x(i)=0+(i-1)/(Nx-1);
end
for i=1:Nx
    T(i) = T0 + (x(i)/L)*(T1-T0)+sin(x(i)*((2*pi)/L));
end
T_next(1:Nx)=0.0;
var=1;
n=0;
while var>1e-5
        T_next(1)=T0;
        for i=2:Nx-1
            T_next(i)=T(i)+cfl*(T(i-1)+T(i+1)-2*T(i));
        end
        T_next(Nx)=T1;
        var=max(abs(T-T_next));
        T=T_next;
        
        if n==1
            T_1=T_next
        end
        if n==500
            T_2=T_next
        end
        if n==1000
            T_3=T_next
        end
        
        if n==2000
            T_4=T_next
        end
        if (n<10000)
            T_5=T_next;
        end
        
        n=n+1;
end

dt=(cfl*(1/(Nx-1))^2)/lambda
T_theo(1:Nx)=0.

t=500*dt

for i=1:Nx
    T_theo(i)=T0+((T1-T0)/L)*x(i)+exp(-((2*pi)/L)*t)*sin(((2*pi)/L)*x(i))
end


figure(1)
plot(x,T_5, 'k',x,T_1,'g',x,T_2,'b',x,T_4,'r',x,T_theo,'c'), legend('convergence', 'apres 1 interations', 'apres 500 interations','apres 2000 interations','theorique 500*dt')
xlabel('x')
ylabel('Temperature')

error(1:99)=0.0;
delta(1:99)=0.0;

for i=2:100
   Niter=200;
   Nx=100*i
   [T_next,T_theo,x] = instationnaire(cfl,T1,T0,L,Nx,Niter);
   error(i)=norm(T_theo-T_next,2)/norm(T_theo,2);
   delta(i)=x(2);
end

figure(2)
loglog(delta,error,'*')
xlabel('log delta x')
ylabel('log erreur')
