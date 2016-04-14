clear;
T0=0;
T1=1000;
cfl=0.1;
T_theo(1:100)=0.
T_theo18(1:100)=0.



a=0.005
[T_arithm,x,Req_arth]=lambda_arithmetique(a,cfl,T1,T0);
[T_geom,x,Req_geo]=lambda_geom(a,cfl,T1,T0);
%calcul T theorique a=0.005
for i=1:100
   T_theo(i)=sqrt(((1+a*T1)^2-(1+a*T0)^2)*(x(i))+(1+a*T0)^2)/a-1/a;
end

a=0.018
[T_arithm18,x,Req_arth18]=lambda_arithmetique(a,cfl,T1,T0);
[T_geom18,x,Req_geo18]=lambda_geom(a,cfl,T1,T0);
%calcul T theorique a=0.018
for i=1:100
   T_theo18(i)=sqrt(((1+a*T1)^2-(1+a*T0)^2)*(x(i))+(1+a*T0)^2)/a-1/a;
end



figure(1)
plot(x,T_arithm,'b',x,T_geom,'c',x,T_arithm18,'m',x,T_geom18,'r',x,T_theo,'k',x,T_theo18,'g'),legend('moyenne arithmetique lambda, a=0.005','moyenne geometrique lambda a=0.005','moyenne arithmetique lambda, a=0.018','moyenne geometrique lambda a=0.018','theorique lambda a=0.005','theorique lambda a=0.018')
xlabel('x')
ylabel('Temperature')
T_arithm18
T_geom18

figure(2)
plot(x,T_arithm-T_geom,'b',x,T_arithm18-T_geom18,'r'),legend('pour a=0.005','pour a=0.018')
xlabel('x')
ylabel('Tarithm-Tgeo')

figure(3)
plot(x,T_arithm-T_theo,'b',x,T_geom-T_theo,'c',x,T_arithm18-T_theo18,'m',x,T_geom18-T_theo18,'r'),legend('moyenne arithmetique lambda, a=0.005','moyenne geometrique lambda a=0.005','moyenne arithmetique lambda, a=0.018','moyenne geometrique lambda a=0.018')
xlabel('x')
ylabel('Tcompute-Ttheo')

figure(4)
plot(x,T_arithm-T_theo,'b',x,T_geom-T_theo,'c',x,T_arithm18-T_theo18,'m'),legend('moyenne arithmetique lambda, a=0.005','moyenne geometrique lambda a=0.005','moyenne arithmetique lambda, a=0.018','moyenne geometrique lambda a=0.018')
xlabel('x')
ylabel('Tcompute-Ttheo')

Req_arth
Req_geo
Req_arth18
Req_geo18