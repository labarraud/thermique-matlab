function [T_next,T_theo,x] = instationnaire(cfl,T1,T0,L,Nx,Niter)
%LAMBDA_GEOM Summary of this function goes here
%Detailed explanation goes here
lambda=0.09;
for i=1:Nx
    x(i)=0+(i-1)/(Nx-1);
end
for i=1:Nx
    T(i) = T0 + (x(i)/L)*(T1-T0)+sin(x(i)*((2*pi)/L));
end
T_next(1:Nx)=0.0;
var=1;
n=0;
for i=1:Niter
        T_next(1)=T0;
        for i=2:Nx-1
            T_next(i)=T(i)+cfl*(T(i-1)+T(i+1)-2*T(i));
        end
        T_next(Nx)=T1;
        var=max(abs(T-T_next));
        T=T_next;
end

dt=(cfl*(1/(Nx-1))^2)/lambda;
T_theo(1:Nx)=0.0;

t=2000*dt;

for i=1:Nx
    T_theo(i)=T0+((T1-T0)/L)*x(i)+exp(-((2*pi)/L)*t)*sin(((2*pi)/L)*x(i));
end

end

