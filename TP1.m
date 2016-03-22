%TP1 transfert thermique ------------ Question IIa)-------
clear
R=0.1
Rtab=[1:10]
ntab=[1:10]
x=[0:0.01:1]
T(1:101) =  0.5 
T_next(1:101)=0.
for j=1:10
    var=1.
    n=0
    while var>1e-5
        T_next(1)=0;
        T_next(2)=(1-R)*T(2)+R*((0+T(3))/2.);
        for i=3:99
            T_next(i)=(1-R)*T(i)+R*((T(i-1)+T(i+1))/2.);
        end
            T_next(100)=(1-R)*T(100)+R*((T(99)+1)/2.);
        T_next(101)=1; 
        var=max(abs(T-T_next));
        T=T_next;
        n=n+1;
    end
    
    Rtab(j)=R
    ntab(j)=n
    R=R+0.1
    
end
   
%figure(1)
%plot(x,T_next)
%xlabel('x')
%ylabel('Temperature')
%figure(2)
%plot(Rtab,ntab)
%xlabel('R')
%ylabel('n')

%TP1 transfert thermique ------------ Question IIa)2-------
clear
lambda=0.9
dx=0.01
cfl=0.5
Nt=10000

dt=(dx^2*cfl)/lambda
ntab=[1:10]
x=[0:0.01:1]
T(1:101) =  0.5 
T_next(1:101)=0.
for j=1:Nt
        T_next(1)=0;
        T_next(2)=T(2)+cfl*(T(3)+0-2*T(2));
        for i=3:99
            T_next(i)=T(i)+cfl*(T(i+1)+T(i-1)-2*T(i));
        end
            T_next(100)=T(100)+cfl*(1+T(99)-2*T(100));
        T_next(101)=1;
        %pause(0.001)
        %plot(x,T_next)
        %xlabel('x')
        %ylabel('Temperature')
        T=T_next;
end
    
%TP1 transfert thermique ------------ Question IIa)3-------
clear
lambda=0.9
dx=0.01
cfl=0.5
Nt=10000
n=0
dt=(dx^2*cfl)/lambda
ntab=[1:10]
x=[0:0.01:1]
T(1:101) =  0.5 
T_next(1:101)=0.
var=1
while var>1e-5
        %monte
        T_next(1)=0;
        T_next(2)=T(2)+cfl*(T(3)+0-2*T(2));
        for i=3:99
            T_next(i)=T(i)+cfl*(T(i+1)+T_next(i-1)-2*T(i));
        end
            T_next(100)=T(100)+cfl*(1+T_next(99)-2*T(100));
        T_next(101)=1;
        T=T_next;
        %descente
        T_next(100)=T(100)+cfl*(1+T(99)-2*T(100));
        T_next(101)=1;
        for i=99:-1:3
            T_next(i)=T(i)+cfl*(T_next(i+1)+T(i-1)-2*T(i));
        end
        T_next(1)=0;
        T_next(2)=T(2)+cfl*(T_next(3)+0-2*T(2));
        
        var=max(abs(T-T_next));
        T=T_next;
        n=n+1;
        %pause(0.001)
        %plot(x,T_next)
        %xlabel('x')
        %ylabel('Temperature')
        
end
n

%TP1 transfert thermique ------------ Question IIb)-------
clear
a=1.
lambda=[1:101]
c=[1:100]
lambda_0=0.09
dx=0.1
cfl=0.1
Nt=10000
dt=0.0001
ntab=[1:10]
x=[0:0.01:1]
T(1:101) =  0.5 
T_next(1:101)=0.
var=1
while var>1e-5
        lambda=(1+a*T)*lambda_0;
  
       
        for k=1:100
            %c(k)=(dt/(dx^2))*(1./2.)*(lambda(k)+lambda(k+1));
            c(k)=(dt/(dx^2))*(2.)*((1./lambda(k))+(1./lambda(k+1))); 
        end

      
        T_next(1)=0;
        T_next(2)=T(2)+c(2)*(T(3)-T(2))-c(1)*(T(2)-0);
        for i=3:99
            T_next(i)=T(i)+c(i)*(T(i+1)-T(i))-c(i-1)*(T(i)-T(i-1));
        end
            T_next(100)=T(100)+c(100)*(1-T(100))-c(99)*(T(100)-T(99));
            
        T_next(101)=1;
        var=max(abs(T-T_next));
        T=T_next;
        pause(0.001)
        plot(x,T_next)
  xlabel('x')
  ylabel('Temperature')

       
end

T_next
  plot(x,T_next)
  xlabel('x')
  ylabel('Temperature')

  
  
