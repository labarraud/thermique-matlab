//TP1 transfert thermique ------------ Question IIb)-------
clear
a=1.
lambda=[1:100]
c=[1:99]
lambda_0=0.09
dx=0.1
cfl=0.1
dt=0.01 // selon la definition de c, il faut changer la valeur de dt ex pour la premiere dt=0.01 ou 0.02 vonviennent, pour la deuxieme, dt=0.001 convient
// on peut aussi prendre lambda=(1+aT) avec dt=0.1 et jouer avec a<5 pour retrouver le profil d'une fonction racine
for i=1:100
    x(i)=0+(i-1)/99
end
T(1:100) =  0.5 
T_next(1:100)=0.
var=1
n=0
while var>1e-5
        lambda=(1+a*T)*lambda_0;
        for k=1:99
            c(k)=(dt/(dx^2))*0.5*(lambda(k)+lambda(k+1));
            //c(k)=(dt/(dx^2))*(2.)*((1/lambda(k))+(1/lambda(k+1))); 
            //c=lambda
        end
        T_next(1)=0;
        for i=2:99
            T_next(i)=T(i)+c(i)*(T(i+1)-T(i))-c(i-1)*(T(i)-T(i-1));
        end
        T_next(100)=1;
        var=max(abs(T-T_next));
        T=T_next;
        n=n+1
end
disp(n)
clf(2)
plot(x,T_next)
xlabel('x')
ylabel('Temperature')
plot(x,sqrt(x),"r")
