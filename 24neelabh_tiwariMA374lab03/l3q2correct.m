clear; clc; format short g

S0=100; T=1; r=0.08; sig=0.2;
m = 1:1:20;

price=size(length(m),2);

for i=1:length(m)
    M=m(i);
    dt=T/M;
    
    u=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
    d=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
    
    price(i,1)=M;
    price(i,2)=loopback(S0,T,r,sig,M,dt,u,d);
    
end
disp(price); 

function oret=loopback(S0,T,r,sig,M,dt,u,d)

dt=T/M;
p=(exp(r*dt)-d)/(u-d);
q=1-p;

stockprice = zeros(2^(M),M+1);

stockprice(1,1)=S0;

for j=1:M
    for i=1:2^(j-1)
        stockprice(2*i-1,j+1)=stockprice(i,j)*u;
        stockprice(2*i,j+1)=stockprice(i,j)*d;
    end
end

optp=stockprice; 

for j=1:M
    for i=1:2^(j-1)
        stockprice(2*i-1,j+1)=max(stockprice(2*i-1,j+1),stockprice(i,j));
        stockprice(2*i,j+1)=max(stockprice(2*i,j+1),stockprice(i,j));
    end
end

optp(:,M+1)=stockprice(:,M+1)-optp(:,M+1);

for j=M:-1:1
    for i=1:1:2^(j-1)
       optp(i,j)=exp(-r*dt)*(p*(optp(2*i-1,j+1))+q*(optp(2*i,j+1))); 
    end
end

if(M==5)
    disp(optp)
end

oret=optp(1,1); 

end