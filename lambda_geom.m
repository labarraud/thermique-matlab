function [ T_next,x,Req ] = lambda_geom( a,cfl,T1,T0 )
%LAMBDA_GEOM Summary of this function goes here
%   Detailed explanation goes here

lambda=[1:100];
c=[1:99];
lambda_0=0.09;
for i=1:100
    x(i)=0+(i-1)/99;
end
T(1:100) =  0.5 ;
T_next(1:100)=0.;
var=1;
Req=0;
while var>1e-5
        lambda=(1+a*T)*lambda_0;
        for k=1:99
            lambda_demi=(2.)/((1/lambda(k))+(1/lambda(k+1)));
            c(k)=cfl*lambda_demi;
            %Req=Req+(1./99)/(lambda_demi*pi*0.0001);
            Req=Req+(1/99)/(lambda_demi*((1/100)^2));
        end
        T_next(1)=T0;
        for i=2:99
            T_next(i)=T(i)+c(i)*(T(i+1)-T(i))-c(i-1)*(T(i)-T(i-1));
        end
        T_next(100)=T1;
        var=max(abs(T-T_next));
        T=T_next;
        %n=n+1;
end
end