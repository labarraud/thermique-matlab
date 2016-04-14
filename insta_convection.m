function [T_next,x] = insta_convection(fig,cfl,T1,T0,Tinf,L,h,n1,n2,n3)
%LAMBDA_GEOM Summary of this function goes here
%Detailed explanation goes here
e=L/100;
lambda=2.19;
rho=2700;
cp=800;
dx=1./99;
dt=(cfl*rho*cp*dx*dx)/lambda;
for i=1:100
    x(i)=0+(i-1)/99;
end
for i=1:100
    T(i) = T0 + (x(i)/L)*(T1-T0)+sin(x(i)*((2*pi)/L));
end
%save initial
T_1=T;
T_next(1:100)=0.0;
var=1;
n=-1;
while var>1e-5
        n=n+1;
        T_next(1)=T0;
        for i=2:99
            T_next(i)=T(i)+cfl*(T(i-1)+T(i+1)-2*T(i))-((4*h*dt)/(rho*cp*e))*(T(i)-Tinf);
        end
        T_next(100)=T1;
        var=max(abs(T-T_next));
        
        if (n==n1)
          T_2=T_next;
        end
        if (n==n2)
          T_3=T_next;
        end
        if (n==n3)
           T_4=T_next;
        end
        T=T_next;
end
figure(fig)
plot(x,T_next,'k',x,T_1,'g',x,T_2,'b',x,T_3,'r',x,T_4,'c'), legend('convergence', 'initial', ['apres ' num2str(n1) ' interations'], ['apres ' num2str(n2) ' interations'], ['apres ' num2str(n3) ' interations'] )
axis([0,1,-(Tinf/10),Tinf+(Tinf/10)])
xlabel('x')
ylabel('Temperature')