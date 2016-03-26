function [T,nt] = schema2( cfl,N,tfinal)
%UNTITLED Summary of this function goes here
%   schema order 2
lambda=0.9;
dx=1/N;
dt=(dx^2*cfl)/lambda;
t=0;
T(1:N+1) =0.5;
T_next(1:N+1)=0.0;
nt=0;
x=[0:(1.0/N):1];
while t<tfinal
        T_next(1)=0;
        T_next(2)=T(2)+cfl*(T(3)+0-2*T(2));
        for i=3:N-1
            T_next(i)=T(i)+cfl*(T(i+1)+T(i-1)-2*T(i));
        end
        T_next(N)=T(100)+cfl*(1+T(99)-2*T(100));
        T_next(N+1)=1;
        T=T_next;
        t=t+dt;
        nt=nt+1;
end
end

