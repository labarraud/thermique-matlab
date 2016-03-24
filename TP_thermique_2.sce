
//TP1 transfert thermique ------------ Question IIa)2-------
clear
lambda=0.9
dx=0.01
cfl=0.5
Nt=5000
for i=1:100
    x(i)=0+(i-1)/99
end
dt=(dx^2*cfl)/lambda
ntab=[1:10]
T(1:100) =  0.5 
T_next(1:100)=0.
for j=1:Nt
        T_next(1)=0;
        for i=2:99
            T_next(i)=T(i)+cfl*(T(i+1)+T(i-1)-2*T(i));
        end
            T_next(100)=1;
            T=T_next;
end
disp('fin')
        clf(2)
        figure(2)
        plot(x,T_next)
        xlabel('x')
        ylabel('Temperature')
