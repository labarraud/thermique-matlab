
//TP1 transfert thermique ------------ Question IIa)3-------
clear
lambda=0.9
dx=0.01
cfl=0.5
n=0
dt=(dx^2*cfl)/lambda
ntab=[1:10]
for i=1:100
    x(i)=0+(i-1)/99
end
T(1:100) =  0.5 
T_next(1:100)=0.
var=1
while var>1e-5
        //monte
        T_next(1)=0;
        for i=2:99
            T_next(i)=T(i)+cfl*(T(i+1)+T_next(i-1)-2*T(i));
        end
        T_next(100)=1;
        T=T_next;
        //descente
        T_next(100)=1
        for i=99:-1:2
            T_next(i)=T(i)+cfl*(T_next(i+1)+T(i-1)-2*T(i));
        end
        T_next(1)=0;
        var=max(abs(T-T_next));
        T=T_next;
        n=n+1;
end
disp(n)
plot(x,T_next)
xlabel('x')
ylabel('Temperature')
