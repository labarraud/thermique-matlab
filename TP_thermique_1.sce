
//TP1 transfert thermique ------------ Question IIa)-------
clear
R=0.1
Rtab=[1:10]
ntab=[1:10]
for i=1:100
    x(i)=0+(i-1)/99
end
T(1:100) =  0.5 
T_next(1:100)=0.
for j=1:10
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
    end
    
    Rtab(j)=R
    ntab(j)=n
    R=R+0.1
    
end
   
figure(1)
plot(x,T_next)
xlabel('x')
ylabel('Temperature')
figure(2)
plot(Rtab,ntab)
xlabel('R')
ylabel('n')
