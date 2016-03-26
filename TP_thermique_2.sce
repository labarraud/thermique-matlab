//TP1 transfert thermique ------------ Question IIa)2-------
clear
lambda=0.9
dx=0.01
cfl=0.5
var=1
n=0
for i=1:100
    x(i)=0+(i-1)/99
end

dt=(dx^2*cfl)/lambda

T(1:100) =0.5 
T_next(1:100)=0.

while var>1e-5
        T_next(1)=0;
        for i=2:99
            T_next(i)=T(i)+cfl*(T(i+1)+T(i-1)-2*T(i));
        end
            T_next(100)=1;
            var=max(abs(T-T_next));
            T=T_next;
            
            if n==10 then
                T1=T_next
            end
            if n==100 then
                T2=T_next
            end
            if n==1000 then
                T3=T_next
            end
            
            n=n+1
end

//clf(1)
//figure(1)
//plot(x,T_next)
disp(T_next)
plot2d(x,[T_next,T1,T2,T3],style=[6,12,13,14])
legends(["solution finale";"solution après 10 itérations";"solution après 100 itérations";"solution après 1000 itérations"],[6,12,13,14],opt="lr")
xlabel('x')
ylabel('Temperature')
