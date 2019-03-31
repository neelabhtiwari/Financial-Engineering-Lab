%This code is written by Neelabh Tiwari - 160123024 for MA 374 FE LAB Jan-May 2019

clear
clc
format short

%fix valued part start

Sat0=100; K=100; T=1; r=0.08; sig=0.2; M=100;
dt=T/M;

u1=exp(sig*sqrt(dt));
d1=exp(-sig*sqrt(dt));
p1=(exp(r*dt)-d1)/(u1-d1);

u2=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
d2=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
p2=(exp(r*dt)-d2)/(u2-d2);

[call_mat,put_mat]=opt_price(Sat0,K,T,r,sig,M,p1,u1,d1,dt);
callp1=call_mat(1,1);
putp1=put_mat(1,1);

[call_mat,put_mat]=opt_price(Sat0,K,T,r,sig,M,p2,u2,d2,dt);
callp2=call_mat(1,1);
putp2=put_mat(1,1);

fprintf('The Call price for set 1 is -');disp(callp1);
fprintf('The Put price for set 1 is -');disp(putp1);
fprintf('The Call price for set 2 is -');disp(callp2);
fprintf('The Put price for set 2 is -');disp(putp2);

%fix valued part ends 

%2-d Plots start

S0=50:5:150;
K=50:5:150;
r=0.00:0.01:0.2;
sig=0.0:0.01:0.3;
M=50:1:150;
KforM=95:5:105;

S0=50:5:150;
callp1=zeros(1,length(S0)); putp1=zeros(1,length(S0));
callp2=zeros(1,length(S0)); putp2=zeros(1,length(S0));

for i=1:length(S0)
    
    K=100; T=1; r=0.08; sig=0.2; M=100;
    dt=T/M;
    
    u1=exp(sig*sqrt(dt));
    d1=exp(-sig*sqrt(dt));
    p1=(exp(r*dt)-d1)/(u1-d1);
    [call_mat,put_mat]=opt_price(S0(i),K,T,r,sig,M,p1,u1,d1,dt);
    callp1(i)=call_mat(1,1);
    putp1(i)=put_mat(1,1);
    
    u2=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
    d2=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
    p2=(exp(r*dt)-d2)/(u2-d2);
    [call_mat,put_mat]=opt_price(S0(i),K,T,r,sig,M,p2,u2,d2,dt);
    callp2(i)=call_mat(1,1);
    putp2(i)=put_mat(1,1);
    
end

figure()
plot(S0,callp1,'r');
title('Plot of Call option at t=0 vs S(0) (50-150) for Set 1 ');
xlabel('Stock Price at t = 0');
ylabel('Price of Call option');
figure()
plot(S0,putp1,'g');
title('Plot of Put option at t=0 vs S(0) (50-150) for Set 1 ');
xlabel('Stock Price at t = 0');
ylabel('Price of Put option');
figure()
plot(S0,callp2,'r');
title('Plot of Call option at t=0 vs S(0) (50-150) for Set 2 ');
xlabel('Stock Price at t = 0');
ylabel('Price of Call option');
figure()
plot(S0,putp2,'g');
title('Plot of Put option at t=0 vs S(0) (50-150) for Set 2 ');
xlabel('Stock Price at t = 0');
ylabel('Price of Put option');

K=50:5:150;
callp1=zeros(1,length(K)); putp1=zeros(1,length(K));
callp2=zeros(1,length(K)); putp2=zeros(1,length(K));

for i=1:length(K)
    
    S0=100; T=1; r=0.08; sig=0.2; M=100;
    dt=T/M;
    
    u1=exp(sig*sqrt(dt));
    d1=exp(-sig*sqrt(dt));
    p1=(exp(r*dt)-d1)/(u1-d1);
    [call_mat,put_mat]=opt_price(S0,K(i),T,r,sig,M,p1,u1,d1,dt);
    callp1(i)=call_mat(1,1);
    putp1(i)=put_mat(1,1);
    
    u2=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
    d2=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
    p2=(exp(r*dt)-d2)/(u2-d2);
    [call_mat,put_mat]=opt_price(S0,K(i),T,r,sig,M,p2,u2,d2,dt);
    callp2(i)=call_mat(1,1);
    putp2(i)=put_mat(1,1);
    
end

figure()
plot(K,callp1,'r');
title('Plot of Call option at t=0 vs K (50-150) for Set 1 ');
xlabel('Strike Price (K)');
ylabel('Price of Call option');
figure()
plot(K,putp1,'g');
title('Plot of Put option at t=0 vs K (50-150) for Set 1 ');
xlabel('Strike Price (K)');
ylabel('Price of Put option');
figure()
plot(K,callp2,'r');
title('Plot of Call option at t=0 vs K (50-150) for Set 2 ');
xlabel('Strike Price (K)');
ylabel('Price of Call option');
figure()
plot(K,putp2,'g');
title('Plot of Put option at t=0 vs K (50-150) for Set 2 ');
xlabel('Strike Price (K)');
ylabel('Price of Put option');


r=0.00:0.01:0.2;
callp1=zeros(1,length(r)); putp1=zeros(1,length(r));
callp2=zeros(1,length(r)); putp2=zeros(1,length(r));

for i=1:length(r)
    
    S0=100; T=1; K=100; sig=0.2; M=100;
    dt=T/M;
    
    u1=exp(sig*sqrt(dt));
    d1=exp(-sig*sqrt(dt));
    p1=(exp(r(i)*dt)-d1)/(u1-d1);
    [call_mat,put_mat]=opt_price(S0,K,T,r(i),sig,M,p1,u1,d1,dt);
    callp1(i)=call_mat(1,1);
    putp1(i)=put_mat(1,1);
    
    u2=exp(sig*sqrt(dt)+(r(i)-sig*sig/2)*dt);
    d2=exp(-sig*sqrt(dt)+(r(i)-sig*sig/2)*dt);
    p2=(exp(r(i)*dt)-d2)/(u2-d2);
    [call_mat,put_mat]=opt_price(S0,K,T,r(i),sig,M,p2,u2,d2,dt);
    callp2(i)=call_mat(1,1);
    putp2(i)=put_mat(1,1);
    
end

figure()
plot(r,callp1,'r');
title('Plot of Call option at t=0 vs r (0-0.2) for Set 1 ');
xlabel('Interest Rate (r)');
ylabel('Price of Call option');
figure()
plot(r,putp1,'g');
title('Plot of Put option at t=0 vs r (0-0.2) for Set 1 ');
xlabel('Interest Rate (r)');
ylabel('Price of Put option');
figure()
plot(r,callp2,'r');
title('Plot of Call option at t=0 vs r (0-0.2) for Set 2 ');
xlabel('Interest Rate (r)');
ylabel('Price of Call option');
figure()
plot(r,putp2,'g');
title('Plot of Put option at t=0 vs r (0-0.2) for Set 2 ');
xlabel('Interest Rate (r)');
ylabel('Price of Put option');


sig=0.0:0.01:0.3;
callp1=zeros(1,length(sig)); putp1=zeros(1,length(sig));
callp2=zeros(1,length(sig)); putp2=zeros(1,length(sig));

for i=1:length(sig)
    
    S0=100; T=1; K=100; r=0.08; M=100;
    dt=T/M;
    
    u1=exp(sig(i)*sqrt(dt));
    d1=exp(-sig(i)*sqrt(dt));
    p1=(exp(r*dt)-d1)/(u1-d1);
    [call_mat,put_mat]=opt_price(S0,K,T,r,sig(i),M,p1,u1,d1,dt);
    callp1(i)=call_mat(1,1);
    putp1(i)=put_mat(1,1);
    
    u2=exp(sig(i)*sqrt(dt)+(r-sig(i)*sig(i)/2)*dt);
    d2=exp(-sig(i)*sqrt(dt)+(r-sig(i)*sig(i)/2)*dt);
    p2=(exp(r*dt)-d2)/(u2-d2);
    [call_mat,put_mat]=opt_price(S0,K,T,r,sig(i),M,p2,u2,d2,dt);
    callp2(i)=call_mat(1,1);
    putp2(i)=put_mat(1,1);
    
end

figure()
plot(sig,callp1,'r');
title('Plot of Call option at t=0 vs sigma (0-0.3) for Set 1 ');
xlabel('Value of Sigma');
ylabel('Price of Call option');
figure()
plot(sig,putp1,'g');
title('Plot of Put option at t=0 vs sigma (0-0.3) for Set 1 ');
xlabel('Value of Sigma');
ylabel('Price of Put option');
figure()
plot(sig,callp2,'r');
title('Plot of Call option at t=0 vs sigma (0-0.3) for Set 2 ');
xlabel('Value of Sigma');
ylabel('Price of Call option');
figure()
plot(sig,putp2,'g');
title('Plot of Put option at t=0 vs sigma (0-0.3) for Set 2 ');
xlabel('Value of Sigma');
ylabel('Price of Put option');

M=50:1:150;
K=95:5:105;

for j=1:length(K)
    
    callp1=zeros(1,length(M)); putp1=zeros(1,length(M));
    callp2=zeros(1,length(M)); putp2=zeros(1,length(M));
    
    for i=1:length(M)
        
        S0=100; T=1; r=0.08; sig=0.2;
        dt=T/M(i);

        u1=exp(sig*sqrt(dt));
        d1=exp(-sig*sqrt(dt));
        p1=(exp(r*dt)-d1)/(u1-d1);
        [call_mat,put_mat]=opt_price(S0,K(j),T,r,sig,M(i),p1,u1,d1,dt);
        callp1(i)=call_mat(1,1);
        putp1(i)=put_mat(1,1);

        u2=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
        d2=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
        p2=(exp(r*dt)-d2)/(u2-d2);
        [call_mat,put_mat]=opt_price(S0,K(j),T,r,sig,M(i),p2,u2,d2,dt);
        callp2(i)=call_mat(1,1);
        putp2(i)=put_mat(1,1);
        
    end
    
    figure()
    plot(M,callp1,'r');
    title(sprintf('Plot of Call option at t=0 vs M (50-150) for Set 1 and K = %d',K(j)));
    xlabel('No. of Steps (M)');
    ylabel('Price of Call option');
    figure()
    plot(M,putp1,'g');
    title(sprintf('Plot of Put option at t=0 vs M (50-150) for Set 1 and K = %d',K(j)));
    xlabel('No. of Steps (M)');
    ylabel('Price of Put option');
    figure()
    plot(M,callp2,'r');
    title(sprintf('Plot of Call option at t=0 vs M (50-150) for Set 2 and K = %d',K(j)));
    xlabel('No. of Steps (M)');
    ylabel('Price of Call option');
    figure()
    plot(M,putp2,'g');
    title(sprintf('Plot of Put option at t=0 vs M (50-150) for Set 2 and K = %d',K(j)));
    xlabel('No. of Steps (M)');
    ylabel('Price of Put option');
    
end

%End of 2-d Plots

% 3-d Scatter Plots start

%Varying S(0) and K for Set 1

S0=randi([1 300],1,600);
K=randi([1 300],1,600);
r=0+(0.2-0)*rand(1,600);
sig=0+(0.35-0)*rand(1,600);
M=randi([1 300],1,600);

S0=randi([1 300],1,600); K=randi([1 300],1,600);
callp1=zeros(1,length(K)); putp1=zeros(1,length(K));
callp2=zeros(1,length(K)); putp2=zeros(1,length(K));
for i=1:length(S0)
     T=1; r=0.08; sig=0.2; M=100;
     u1=exp(sig*sqrt(dt));
     d1=exp(-sig*sqrt(dt));
     p1=(exp(r*dt)-d1)/(u1-d1);
     
     [call_mat,put_mat]=opt_price(S0(i),K(i),T,r,sig,M,p1,u1,d1,dt);
     callp1(i)=call_mat(1,1);
     putp1(i)=put_mat(1,1);
     
    u2=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
    d2=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
    p2=(exp(r*dt)-d2)/(u2-d2);
    [call_mat,put_mat]=opt_price(S0(i),K(i),T,r,sig,M,p2,u2,d2,dt);
    callp2(i)=call_mat(1,1);
    putp2(i)=put_mat(1,1);

     
end
figure();
scatter3(S0,K,callp1);
title('Scatter Plot of Initial Option Price with S(0) and K (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Strike Price (K)');
zlabel('Price of European Call Option');
figure();
scatter3(S0,K,putp1);
title('Scatter Plot of Initial Option Price with S(0) and K (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Strike Price (K)');
zlabel('Price of European Put Option');
figure();
scatter3(S0,K,callp2);
title('Scatter Plot of Initial Option Price with S(0) and K (Set 2)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Strike Price (K)');
zlabel('Price of European Call Option');
figure();
scatter3(S0,K,putp2);
title('Scatter Plot of Initial Option Price with S(0) and K (Set 2)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Strike Price (K)');
zlabel('Price of European Put Option');

S0=randi([1 300],1,600); r=0+(0.2-0)*rand(1,600);
callp1=zeros(1,length(S0)); putp1=zeros(1,length(S0));
for i=1:length(S0)
     T=1; K=100; sig=0.2; M=100;
     u1=exp(sig*sqrt(dt));
     d1=exp(-sig*sqrt(dt));
     p1=(exp(r(i)*dt)-d1)/(u1-d1);
     
     [call_mat,put_mat]=opt_price(S0(i),K,T,r(i),sig,M,p1,u1,d1,dt);
     callp1(i)=call_mat(1,1);
     putp1(i)=put_mat(1,1);
     
     u2=exp(sig*sqrt(dt)+(r(i)-sig*sig/2)*dt);
    d2=exp(-sig*sqrt(dt)+(r(i)-sig*sig/2)*dt);
    p2=(exp(r(i)*dt)-d2)/(u2-d2);
    [call_mat,put_mat]=opt_price(S0(i),K,T,r(i),sig,M,p2,u2,d2,dt);
    callp2(i)=call_mat(1,1);
    putp2(i)=put_mat(1,1);
     
end
figure();
scatter3(S0,r,callp1);
title('Scatter Plot of Initial Option Price with S(0) and r (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Interest Rate (r)');
zlabel('Price of European Call Option');
figure();
scatter3(S0,r,putp1);
title('Scatter Plot of Initial Option Price with S(0) and r (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Interest Rate (r)');
zlabel('Price of European Put Option');
figure();
scatter3(S0,r,callp2);
title('Scatter Plot of Initial Option Price with S(0) and r (Set 2)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Interest Rate (r)');
zlabel('Price of European Call Option');
figure();
scatter3(S0,r,putp2);
title('Scatter Plot of Initial Option Price with S(0) and r (Set 2)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Interest Rate (r)');
zlabel('Price of European Put Option');

S0=randi([1 300],1,600); sig=0.1+(0.3-0.1)*rand(1,600);
callp1=zeros(1,length(S0)); putp1=zeros(1,length(S0));
for i=1:length(S0)
     T=1; K=100; r=0.08; M=100;
     u1=exp(sig(i)*sqrt(dt));
     d1=exp(-sig(i)*sqrt(dt));
     p1=(exp(r*dt)-d1)/(u1-d1);
     
     [call_mat,put_mat]=opt_price(S0(i),K,T,r,sig(i),M,p1,u1,d1,dt);
     callp1(i)=call_mat(1,1);
     putp1(i)=put_mat(1,1);
     
     u2=exp(sig(i)*sqrt(dt)+(r-sig(i)*sig(i)/2)*dt);
    d2=exp(-sig(i)*sqrt(dt)+(r-sig(i)*sig(i)/2)*dt);
    p2=(exp(r*dt)-d2)/(u2-d2);
    [call_mat,put_mat]=opt_price(S0(i),K,T,r,sig(i),M,p2,u2,d2,dt);
    callp2(i)=call_mat(1,1);
    putp2(i)=put_mat(1,1);
     
end
figure();
scatter3(S0,sig,callp1);
title('Scatter Plot of Initial Option Price with S(0) and Sigma (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Value of Sigma');
zlabel('Price of European Call Option');
figure();
scatter3(S0,sig,putp1);
title('Scatter Plot of Initial Option Price with S(0) and Sigma (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Value of Sigma');
zlabel('Price of European Put Option');
figure();
scatter3(S0,sig,callp2);
title('Scatter Plot of Initial Option Price with S(0) and Sigma (Set 2)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Value of Sigma');
zlabel('Price of European Call Option');
figure();
scatter3(S0,sig,putp2);
title('Scatter Plot of Initial Option Price with S(0) and Sigma (Set 2)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Value of Sigma');
zlabel('Price of European Put Option');

S0=randi([1 300],1,600); M=randi([1 300],1,600);
callp1=zeros(1,length(S0)); putp1=zeros(1,length(S0));
for i=1:length(S0)
     T=1; K=100; r=0.08; sig=0.3;
     u1=exp(sig*sqrt(dt));
     d1=exp(-sig*sqrt(dt));
     p1=(exp(r*dt)-d1)/(u1-d1);
     
     [call_mat,put_mat]=opt_price(S0(i),K,T,r,sig,M(i),p1,u1,d1,dt);
     callp1(i)=call_mat(1,1);
     putp1(i)=put_mat(1,1);
     
     u2=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
    d2=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
    p2=(exp(r*dt)-d2)/(u2-d2);
    [call_mat,put_mat]=opt_price(S0(i),K,T,r,sig,M(i),p2,u2,d2,dt);
    callp2(i)=call_mat(1,1);
    putp2(i)=put_mat(1,1);
     
end
figure();
scatter3(S0,M,callp1);
title('Scatter Plot of Initial Option Price with S(0) and M (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('No. of subintervals (M)');
zlabel('Price of European Call Option');
figure();
scatter3(S0,M,putp1);
title('Scatter Plot of Initial Option Price with S(0) and M (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('No. of subintervals (M)');
zlabel('Price of European Put Option');
figure();
scatter3(S0,M,callp2);
title('Scatter Plot of Initial Option Price with S(0) and M (Set 2)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('No. of subintervals (M)');
zlabel('Price of European Call Option');
figure();
scatter3(S0,M,putp2);
title('Scatter Plot of Initial Option Price with S(0) and M (Set 2)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('No. of subintervals (M)');
zlabel('Price of European Put Option');
        
r=0+(0.2-0)*rand(1,600); sig=0.1+(0.3-0.1)*rand(1,600);
callp1=zeros(1,length(r)); putp1=zeros(1,length(r));
for i=1:length(r)
     T=1; K=100; S0=100; M=100;
     u1=exp(sig(i)*sqrt(dt));
     d1=exp(-sig(i)*sqrt(dt));
     p1=(exp(r(i)*dt)-d1)/(u1-d1);
     
     [call_mat,put_mat]=opt_price(S0,K,T,r(i),sig(i),M,p1,u1,d1,dt);
     callp1(i)=call_mat(1,1);
     putp1(i)=put_mat(1,1);
     
     u2=exp(sig(i)*sqrt(dt)+(r(i)-sig(i)*sig(i)/2)*dt);
    d2=exp(-sig(i)*sqrt(dt)+(r(i)-sig(i)*sig(i)/2)*dt);
    p2=(exp(r(i)*dt)-d2)/(u2-d2);
    [call_mat,put_mat]=opt_price(S0,K,T,r(i),sig(i),M,p2,u2,d2,dt);
    callp2(i)=call_mat(1,1);
    putp2(i)=put_mat(1,1);
     
end
figure();
scatter3(r,sig,callp1);
title('Scatter Plot of Initial Option Price with r and Sigma (Set 1)');
xlabel('Interest Rate (r)');
ylabel('Value of Sigma');
zlabel('Price of European Call Option');
figure();
scatter3(r,sig,putp1);
title('Scatter Plot of Initial Option Price with r and Sigma (Set 1)');
xlabel('Interest Rate (r)');
ylabel('Value of Sigma');
zlabel('Price of European Put Option');
figure();
scatter3(r,sig,callp2);
title('Scatter Plot of Initial Option Price with r and Sigma (Set 2)');
xlabel('Interest Rate (r)');
ylabel('Value of Sigma');
zlabel('Price of European Call Option');
figure();
scatter3(r,sig,putp2);
title('Scatter Plot of Initial Option Price with r and Sigma (Set 2)');
xlabel('Interest Rate (r)');
ylabel('Value of Sigma');
zlabel('Price of European Put Option');

%3-d Plots End

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
        
call_mat(i,j)=exp(-r*dt)*(p*call_mat(i,j+1)+(1-p)*call_mat(i+1,j+1));
put_mat(i,j)=exp(-r*dt)*(p*put_mat(i,j+1)+(1-p)*put_mat(i+1,j+1));

    end
end

end

% End of the program
