clear; clc; format short;

S0=100; K=100; T=1; r=0.08; sig=0.2; 
m=100;
callprice=size(length(m),2);
putprice=size(length(m),2);

for i=1:length(m)
    M=m(i);
    dt=T/M;
    
    u=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
    d=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
    
    callprice(i,1)=M;
    putprice(i,1)=M;
    
    [callprice(i,2) putprice(i,2)]=asian(S0,K,T,r,sig,M,dt,u,d);
    
end
disp(callprice); disp(putprice);

function [cret pret]=asian(S0,K,T,r,sig,M,dt,u,d)

dt=T/M;
p=(exp(r*dt)-d)/(u-d);
q=1-p;

sp1=zeros(M+1,M+1);
sp2=zeros(M+1,M+1);
stp=zeros(M+1,M+1);

sp1(1,1)=S0; sp2(1,1)=S0;
stp(1,1)=S0;

for j=1:M
    for i=1:j
        stp(i,j+1)=stp(i,j)*u;
        stp(i+1,j+1)=stp(i,j)*d;
    end
end

for i=1:M+1
   j=M+1;
   sp1(i,j)=S0*u^(M+1-i)*d^(i-1);
   sp2(i,j)=S0*u^(M+1-i)*d^(i-1);
end      
        
sp1(:,M+1)=max(sp1(:,M+1)-K,0);
sp2(:,M+1)=max(K-sp2(:,M+1),0);

for j=M:-1:1
    for i=1:j
        sp1(i,j)=max(max(stp(i,j)-K,0),exp(-r*dt)*(p*sp1(i,j+1)+q*sp1(i+1,j+1)));
        sp2(i,j)=max(max(K-stp(i,j),0),exp(-r*dt)*(p*sp2(i,j+1)+q*sp2(i+1,j+1)));
    end
end

cret=sp1(1,1); pret=sp2(1,1);
    
end