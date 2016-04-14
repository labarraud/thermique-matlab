%TP1 transfert thermique ------------ Question IIa)-------
clear
    %R=0.01;
    %zoom 0.999 - 1
    R=0.99;
    Rtab=[1:10]
    ntab=[1:10]
    for i=1:100
        x(i)=0+(i-1)/99
    end
    T(1:100) =  0.5 
    T1(1:100) =  0.5 
    T2(1:100) =  0.5 
    T3(1:100) =  0.5 
    T_next(1:100)=0.
    
    for j=1:199
        T(1:100) =  0.5 
        var=1.;
        n=0;
        while var>1e-5
            T_next(1)=0;
            for i=2:99
                T_next(i)=(1-R)*T(i)+R*((T(i-1)+T(i+1))/2.);
            end
            T_next(100)=1;
 
            var=max(abs(T-T_next));
            T=T_next;
            n=n+1;
            
            if(j==40)
                if (n==10)  
                    T1=T_next;
                end
                if (n==100)
                    T2=T_next;
                end
                if (n==1000)
                    T3=T_next;
                end
            end
        end
        
    Rtab(j)=R;
    ntab(j)=n;
    %R=R+0.005;
    %zoom 0.999 - 1
    R=R+0.000050
    end

figure(1)
plot(x,T_next)
xlabel('x')
ylabel('Temperature')

figure(2)

plot(Rtab,ntab)
xlabel('parametre de relaxation R')
ylabel('nombre d''iterations n')

figure(3)
plot(x,T_next, 'k',x,T1,'g',x,T2,'b',x,T3,'r'), legend('solution final apres convergence', 'apres 10 interations', 'apres 100 interations', 'apres 1000 interations')
xlabel('x')
ylabel('Temperature')