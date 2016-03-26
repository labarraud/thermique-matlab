clear;
%e(1:100)=0.;
%N=100:100:100000;
%var=0;
%for i=1:100
%    var=floor(N(i));
%    [e(i)] = error2( 0.1,var,1000);
%end
%dx(1:100)=0.0;
%for i=1:100
%    dx(i)=1.0/N(i);
%end
%figure
%loglog(dx,e);
%grid on

cfl=0.5;
tfinal=0.01;
N1=1000;
N2=2000;
N3=4000;

T1=[1:N1];
nt1=0;
[T1,nt1] = schema2( cfl,N1,tfinal);

T2=[1:N2];
nt2=0;
[T2,nt] = schema2( cfl,N2,tfinal);

T3=[1:N3];
nt3=0;
[T3,nt] = schema2( cfl,N3,tfinal);

sum1=0.0;
for i=1:N1
   sum1=sum1+(T1(i)-T2(2*i-1)); 
end
sum1=sum1*(1.0/N2);

sum2=0.0;
for i=1:N2
   sum2=sum2+(T2(i)-T3(2*i-1)); 
end
sum2=sum2*(1.0/N2);

p=log(sum1/sum2)/log(2)


