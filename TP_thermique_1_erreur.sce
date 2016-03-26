clear
disp('début')
R=1.
absc=[1:10]
err=[1:10]
l=0
for niter=100:10:500
    l=l+1
        for i=1:niter
            x(i)=0+(i-1)/(niter-1);
        end
    T(1:niter) =  0.5 
    T_next(1:niter)=0.
            var=1.
            n=0
            while n<500
            T_next(1)=0;
                for i=2:niter-1
                    T_next(i)=(1-R)*T(i)+R*((T(i-1)+T(i+1))/2.);
                end
            T_next(niter)=1;
            T=T_next;
            n=n+1;
            end
    Eh=0
    norme=0
    for i=1:niter
        Eh=Eh+abs(T_next(i)-x(i))^2
    end
Eh=sqrt(Eh)
absc(l)=log10(1/niter)
err(l)=log10(Eh)
end

clf(0)
plot(absc,err,'o')
disp('fin')
figure(2)
