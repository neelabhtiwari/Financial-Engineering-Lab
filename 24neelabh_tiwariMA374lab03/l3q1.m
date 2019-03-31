%This code is written by Neelabh Tiwari - 160123024 for MA 374 FE LAB Jan-May 2019

clear
clc
format short

%fix valued part start

Sat0=100; K=100; T=1; r=0.08; sig=0.2; M=100;
dt=T/M;

u2=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
d2=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
p2=(exp(r*dt)-d2)/(u2-d2);

[call_mat,put_mat]=opt_price(Sat0,K,T,r,sig,M,p2,u2,d2,dt);
callp2=call_mat(1,1);
putp2=put_mat(1,1);

fprintf('The American Call price for set 2 is -');disp(callp2);
fprintf('The American Put price for set 2 is -');disp(putp2);

%fix valued part ends 

%2-d Plots start

S0=50:5:150;
K=50:5:150;
r=0.00:0.01:0.2;
sig=0.0:0.01:0.3;
M=50:1:150;
KforM=95:5:105;

S0=50:5:150;
callp2=zeros(1,length(S0)); putp2=zeros(1,length(S0));

for i=1:length(S0)
    
    K=100; T=1; r=0.08; sig=0.2; M=100;
    dt=T/M;
    
    u2=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
    d2=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
    p2=(exp(r*dt)-d2)/(u2-d2);
    [call_mat,put_mat]=opt_price(S0(i),K,T,r,sig,M,p2,u2,d2,dt);
    callp2(i)=call_mat(1,1);
    putp2(i)=put_mat(1,1);
    
end

figure()
plot(S0,callp2,'r');
title('Plot of American Call option at t=0 vs S(0) (50-150)');
xlabel('Stock Price at t = 0');
ylabel('Price of Call option');
figure()
plot(S0,putp2,'g');
title('Plot of American Put option at t=0 vs S(0) (50-150)');
xlabel('Stock Price at t = 0');
ylabel('Price of Put option');

K=50:5:150;
callp2=zeros(1,length(K)); putp2=zeros(1,length(K));

for i=1:length(K)
    
    S0=100; T=1; r=0.08; sig=0.2; M=100;
    dt=T/M;
    
    u2=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
    d2=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
    p2=(exp(r*dt)-d2)/(u2-d2);
    [call_mat,put_mat]=opt_price(S0,K(i),T,r,sig,M,p2,u2,d2,dt);
    callp2(i)=call_mat(1,1);
    putp2(i)=put_mat(1,1);
    
end

figure()
plot(K,callp2,'r');
title('Plot of American Call option at t=0 vs K (50-150)');
xlabel('Strike Price (K)');
ylabel('Price of Call option');
figure()
plot(K,putp2,'g');
title('Plot of American Put option at t=0 vs K (50-150)');
xlabel('Strike Price (K)');
ylabel('Price of Put option');


r=0.00:0.01:0.2;
callp2=zeros(1,length(r)); putp2=zeros(1,length(r));

for i=1:length(r)
    
    S0=100; T=1; K=100; sig=0.2; M=100;
    dt=T/M;
    
    u2=exp(sig*sqrt(dt)+(r(i)-sig*sig/2)*dt);
    d2=exp(-sig*sqrt(dt)+(r(i)-sig*sig/2)*dt);
    p2=(exp(r(i)*dt)-d2)/(u2-d2);
    [call_mat,put_mat]=opt_price(S0,K,T,r(i),sig,M,p2,u2,d2,dt);
    callp2(i)=call_mat(1,1);
    putp2(i)=put_mat(1,1);
    
end

figure()
plot(r,callp2,'r');
title('Plot of American Call option at t=0 vs r (0-0.2)');
xlabel('Interest Rate (r)');
ylabel('Price of Call option');
figure()
plot(r,putp2,'g');
title('Plot of American Put option at t=0 vs r (0-0.2)');
xlabel('Interest Rate (r)');
ylabel('Price of Put option');


sig=0.05:0.01:0.3;
callp2=zeros(1,length(sig)); putp2=zeros(1,length(sig));

for i=1:length(sig)
    
    S0=100; T=1; K=100; r=0.08; M=100;
    dt=T/M;
    
    u2=exp(sig(i)*sqrt(dt)+(r-sig(i)*sig(i)/2)*dt);
    d2=exp(-sig(i)*sqrt(dt)+(r-sig(i)*sig(i)/2)*dt);
    p2=(exp(r*dt)-d2)/(u2-d2);
    [call_mat,put_mat]=opt_price(S0,K,T,r,sig(i),M,p2,u2,d2,dt);
    callp2(i)=call_mat(1,1);
    putp2(i)=put_mat(1,1);
    
end

figure()
plot(sig,callp2,'r');
title('Plot of American Call option at t=0 vs sigma (0-0.3)');
xlabel('Value of Sigma');
ylabel('Price of Call option');
figure()
plot(sig,putp2,'g');
title('Plot of American Put option at t=0 vs sigma (0-0.3)');
xlabel('Value of Sigma');
ylabel('Price of Put option');

M=50:1:150;
K=95:5:105;

for j=1:length(K)
    
    callp2=zeros(1,length(M)); putp2=zeros(1,length(M));
    
    for i=1:length(M)
        
        S0=100; T=1; r=0.08; sig=0.2;
        dt=T/M(i);

        u2=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
        d2=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
        p2=(exp(r*dt)-d2)/(u2-d2);
        [call_mat,put_mat]=opt_price(S0,K(j),T,r,sig,M(i),p2,u2,d2,dt);
        callp2(i)=call_mat(1,1);
        putp2(i)=put_mat(1,1);
        
    end

    figure()
    plot(M,callp2,'r');
    title(sprintf('Plot of American Call option at t=0 vs M (50-150) and K = %d',K(j)));
    xlabel('No. of Steps (M)');
    ylabel('Price of Call option');
    figure()
    plot(M,putp2,'g');
    title(sprintf('Plot of American Put option at t=0 vs M (50-150) and K = %d',K(j)));
    xlabel('No. of Steps (M)');
    ylabel('Price of Put option');
    
end

%End of 2-d Plots

% Backtracking Function for Calculating option prices

function [call_mat,put_mat]=opt_price(Sat0,K,T,r,sig,M,p,u,d,dt)

call_mat=zeros(M+1,M+1);
put_mat=zeros(M+1,M+1);

for i=1:M+1

    Satn=d^(i-1)*u^(M-i+1)*Sat0;
    call_mat(i,M+1)=max(Satn-K,0);
    put_mat(i,M+1)=max(K-Satn,0);
    
end

for j=M:-1:1
    for i=1:j

call_mat(i,j)=max(exp(-r*dt)*(p*call_mat(i,j+1)+(1-p)*call_mat(i+1,j+1)),max(Sat0*u^(j-i)*d^(i-1)-K,0));
put_mat(i,j)=max(exp(-r*dt)*(p*put_mat(i,j+1)+(1-p)*put_mat(i+1,j+1)),max(K-Sat0*u^(j-i)*d^(i-1),0));

    end
end

end

% End of the program