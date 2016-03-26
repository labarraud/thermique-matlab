//TP1 transfert thermique ------------ Question IIa)-------
clear
    R=0.2
    
    for i=1:100
        x(i)=0+(i-1)/99
    end
    
    T(1:100) =  0.5 
    T(1)=0
    T(100)=1
    T_next(1:100)=0.

        var=1.
        n=0
        while var>1e-5
            T_next(1)=0;
            for i=2:99
                T_next(i)=(1-R)*T(i)+R*((T(i-1)+T(i+1))/2.);
            end
            T_next(100)=1;
 
            var=max(abs(T-T_next));
            T=T_next;
            n=n+1;
            if n==10 then
                T1=T_next
            end
            if n==100 then
                T2=T_next
            end
            if n==1000 then
                T3=T_next
            end
        end

clf(1)
figure(1)
plot2d(x,[T_next,T1,T2,T3],style=[6,12,13,14,15])
legends(["solution finale";"solution après 10 itérations";"solution après 100 itérations";"solution après 1000 itérations"],[6,12,13,14,15],opt="lr")
xlabel('x')
ylabel('Temperature')

