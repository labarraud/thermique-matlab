
//TP1 transfert thermique ------------ Question IIa)2-------
clear
for i=1:100
    x(i)=0+(i-1)/99
end

lambda=0.9
dx=0.01
var=1


    cfl=0
    for l=1:100
    T(1:100) =  0.5 
    T_next(1:100)=0.
    cfl=cfl+0.01
    n=0
    var=1
    while var>1e-5
        T_next(1)=0;
        for i=2:99
            T_next(i)=T(i)+cfl*(T(i+1)+T(i-1)-2*T(i));
        end
            T_next(100)=1;
            var=max(abs(T-T_next));
            T=T_next;
            n=n+1;
    end
    cfli(l)=cfl
    niter(l)=n
    disp(n)
end
//disp(cfli,niter)
clf(2)
figure(2)
plot2d(cfli,[niter],style=[6])
xlabel('CFL')
ylabel('nombre d''itérations')
