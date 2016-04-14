clear
% question a
T0=0
T1=1
Text=10

[T_next1,x] = insta_convection(1,0.1,T1,T0,Text,1,1,100,300,700)

%question b
[ T_next2,x ] = insta_ray(2,0.1,T1,T0,Text,1,1,0.5,100,300,700)

%comparaison avec un Text important
Text=1000
[T_next1,x] = insta_convection(3,0.1,T1,T0,Text,1,1,200,500,700)

%question b
[ T_next2,x ] = insta_ray(4,0.1,T1,T0,Text,1,1,0.5,5,15,20)

figure(5)
plot(x,T_next1,'k',x,T_next2,'b'), legend('convection', 'convection+rayonnement')
axis([0,1,-inf,1100])
xlabel('x')
ylabel('Temperature')

%[ T_next2,x ] = insta_ray(3,0.1,10,0,1000,1,30,0.5)
%figure(4)
%plot(x,T_next1,'k',x,T_next2,'b'), legend('pour T1=1', 'pour T1=5')
%xlabel('x')
%ylabel('Temperature')