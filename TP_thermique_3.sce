//TP1 transfert thermique ------------ Question IIa)3-------
clear
    lambda=0.9
    dx=0.01
    n=0
    ntab=[1:10]
        for i=1:100
            x(i)=0+(i-1)/99
        end

    var=1
    cfl=0.999
    
    //for l=1:99
        cfl=cfl+0.0001
        var=1.
        n=0
        T(1:100) =  0.5 
        T_next(1:100)=0.
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
            //niter(l)=n
            //cfli(l)=cfl
        end

        clf(1)
        figure(1)
        plot(x,T_next)
        xlabel('x')
        ylabel('Temperature')
        disp(n,cfl)
    //end
    
    clf(2)
    figure(2)
    plot2d(cfli,[niter],style=[-2,6])
    xlabel('CFL')
    ylabel('nombre d''itérations')
    disp('fin')

