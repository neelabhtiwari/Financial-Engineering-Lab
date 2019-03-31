%This code is written by Neelabh Tiwari - 160123024 for MA 374 FE LAB Jan-May 2019

clear
clc
format short

%fix valued part start

S0=100; K=100; T=1; r=0.08; sig=0.2; M=10;
dt=T/M;

u1=exp(sig*sqrt(dt));
d1=exp(-sig*sqrt(dt));
prices_tmp=opt_price(S0,K,r,u1,d1,T,M,1);
callp1=prices_tmp;
prices_tmp=opt_price(S0,K,r,u1,d1,T,M,-1);
putp1=prices_tmp;


fprintf('The Asian Call price for set 1 is -');disp(callp1);
fprintf('The Asian Put price for set 1 is -');disp(putp1);

%fix valued part ends 

%2-d Plots start

S0=50:5:150;
K=50:5:150;
r=0.00:0.01:0.2;
sig=0.1:0.01:0.35;
M=1:1:10;
KforM=95:5:105;

S0=50:5:150;
callp1=zeros(1,length(S0)); putp1=zeros(1,length(S0));

for i=1:length(S0)
    
    K=100; T=1; r=0.08; sig=0.2; M=10;
    dt=T/M;
    
    u1=exp(sig*sqrt(dt));
    d1=exp(-sig*sqrt(dt));
    
    prices_tmp=opt_price(S0(i),K,r,u1,d1,T,M,1);
    callp1(i)=prices_tmp;
    prices_tmp=opt_price(S0(i),K,r,u1,d1,T,M,-1);
    putp1(i)=prices_tmp;
    
end

figure()
plot(S0,callp1,'r');
title('Plot of Asian Call option at t=0 vs S(0) (50-150) for Set 1 ');
xlabel('Stock Price at t = 0');
ylabel('Price of Call option');
figure()
plot(S0,putp1,'g');
title('Plot of Asian Put option at t=0 vs S(0) (50-150) for Set 1 ');
xlabel('Stock Price at t = 0');
ylabel('Price of Put option');


K=50:5:150;
callp1=zeros(1,length(K)); putp1=zeros(1,length(K));

for i=1:length(K)
    
    S0=100; T=1; r=0.08; sig=0.2; M=10;
    dt=T/M;
    
    u1=exp(sig*sqrt(dt));
    d1=exp(-sig*sqrt(dt));
    
    prices_tmp=opt_price(S0,K(i),r,u1,d1,T,M,1);
    callp1(i)=prices_tmp;
    prices_tmp=opt_price(S0,K(i),r,u1,d1,T,M,-1);
    putp1(i)=prices_tmp;
    
end

figure()
plot(K,callp1,'r');
title('Plot of Asian Call option at t=0 vs K (50-150) for Set 1 ');
xlabel('Strike Price (K)');
ylabel('Price of Call option');
figure()
plot(K,putp1,'g');
title('Plot of Asian Put option at t=0 vs K (50-150) for Set 1 ');
xlabel('SStrike Price (K)');
ylabel('Price of Put option');

r=0.00:0.01:0.2;
callp1=zeros(1,length(r)); putp1=zeros(1,length(r));

for i=1:length(r)
    
    S0=100; T=1; K=100; sig=0.2; M=10;
    dt=T/M;
    
    u1=exp(sig*sqrt(dt));
    d1=exp(-sig*sqrt(dt));
    
    prices_tmp=opt_price(S0,K,r(i),u1,d1,T,M,1);
    callp1(i)=prices_tmp;
    prices_tmp=opt_price(S0,K,r(i),u1,d1,T,M,-1);
    putp1(i)=prices_tmp;
    
end

figure()
plot(r,callp1,'r');
title('Plot of Asian Call option at t=0 vs r (0-0.2) for Set 1 ');
xlabel('Interest Rate (r)');
ylabel('Price of Call option');
figure()
plot(r,putp1,'g');
title('Plot of Asian Put option at t=0 vs r (0-0.2) for Set 1 ');
xlabel('Interest Rate (r)');
ylabel('Price of Put option');


sig=0.1:0.01:0.35;
callp1=zeros(1,length(sig)); putp1=zeros(1,length(sig));

for i=1:length(sig)
    
    S0=100; T=1; K=100; r=0.08; M=10;
    dt=T/M;
    
    u1=exp(sig(i)*sqrt(dt));
    d1=exp(-sig(i)*sqrt(dt));
    
    prices_tmp=opt_price(S0,K,r,u1,d1,T,M,1);
    callp1(i)=prices_tmp;
    prices_tmp=opt_price(S0,K,r,u1,d1,T,M,-1);
    putp1(i)=prices_tmp;
    
end

figure()
plot(sig,callp1,'r');
title('Plot of Asian Call option at t=0 vs sigma (0.1-0.35) for Set 1 ');
xlabel('Value of Sigma');
ylabel('Price of Call option');
figure()
plot(sig,putp1,'g');
title('Plot of Asian Put option at t=0 vs sigma (0.1-0.35) for Set 1 ');
xlabel('Value of Sigma');
ylabel('Price of Put option');


M=1:1:10;
K=95:5:105;

for j=1:length(K)
    
    callp1=zeros(1,length(M)); putp1=zeros(1,length(M));
    callp2=zeros(1,length(M)); putp2=zeros(1,length(M));
    
    for i=1:length(M)
        
        S0=100; T=1; r=0.08; sig=0.2;
        dt=T/M(i);

        u1=exp(sig*sqrt(dt));
        d1=exp(-sig*sqrt(dt));
        
        prices_tmp=opt_price(S0,K(j),r,u1,d1,T,M(i),1);
        callp1(i)=prices_tmp;
        prices_tmp=opt_price(S0,K(j),r,u1,d1,T,M(i),-1);
        putp1(i)=prices_tmp;

    end
    
    figure()
    plot(M,callp1,'r');
    title(sprintf('Plot of Asian Call option at t=0 vs M (50-150) for Set 1 and K = %d',K(j)));
    xlabel('No. of Steps (M)');
    ylabel('Price of Call option');
    figure()
    plot(M,putp1,'g');
    title(sprintf('Plot of Asian Put option at t=0 vs M (50-150) for Set 1 and K = %d',K(j)));
    xlabel('No. of Steps (M)');
    ylabel('Price of Put option');
    
end
%End of 2-d Plots


% 3-d Plots start

S0=randi([1 300],1,600); K=randi([1 300],1,600);
callp1=zeros(1,length(K)); putp1=zeros(1,length(K));
for i=1:length(S0)
     T=1; r=0.08; sig=0.2; M=10;
     
     u1=exp(sig*sqrt(dt));
     d1=exp(-sig*sqrt(dt));
     
     prices_tmp=opt_price(S0(i),K(i),r,u1,d1,T,M,1);
     callp1(i)=prices_tmp;
     prices_tmp=opt_price(S0(i),K(i),r,u1,d1,T,M,-1);
     putp1(i)=prices_tmp;
     
end
figure();
scatter3(S0,K,callp1);
title('Scatter Plot of Initial Asian Option Price with S(0) and K (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Strike Price (K)');
zlabel('Price of Asian Call Option');
figure();
scatter3(S0,K,putp1);
title('Scatter Plot of Initial Asian Option Price with S(0) and K (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Strike Price (K)');
zlabel('Price of Asian Put Option');

S0=randi([1 300],1,600); r=0+(0.2-0)*rand(1,600);
callp1=zeros(1,length(S0)); putp1=zeros(1,length(S0));
for i=1:length(S0)
     T=1; K=100; sig=0.2; M=10;
     
     u1=exp(sig*sqrt(dt));
     d1=exp(-sig*sqrt(dt));
     
     prices_tmp=opt_price(S0(i),K,r(i),u1,d1,T,M,1);
     callp1(i)=prices_tmp;
     prices_tmp=opt_price(S0(i),K,r(i),u1,d1,T,M,-1);
     putp1(i)=prices_tmp;
     
end
figure();
scatter3(S0,r,callp1);
title('Scatter Plot of Initial Asian Option Price with S(0) and r (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Interest Rate (r)');
zlabel('Price of Asian Call Option');
figure();
scatter3(S0,r,putp1);
title('Scatter Plot of Initial Asian Option Price with S(0) and r (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Interest Rate (r)');
zlabel('Price of Asian Put Option');

S0=randi([1 300],1,600); sig=0.1+(0.3-0.1)*rand(1,600);
callp1=zeros(1,length(S0)); putp1=zeros(1,length(S0));
for i=1:length(S0)
     T=1; K=100; r=0.08; M=10;
     
     u1=exp(sig(i)*sqrt(dt));
     d1=exp(-sig(i)*sqrt(dt));
     
     prices_tmp=opt_price(S0(i),K,r,u1,d1,T,M,1);
     callp1(i)=prices_tmp;
     prices_tmp=opt_price(S0(i),K,r,u1,d1,T,M,-1);
     putp1(i)=prices_tmp;
     
end
figure();
scatter3(S0,sig,callp1);
title('Scatter Plot of Initial Asian Option Price with S(0) and Sigma (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Value of Sigma');
zlabel('Price of Asian Call Option');
figure();
scatter3(S0,sig,putp1);
title('Scatter Plot of Initial Asian Option Price with S(0) and Sigma (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('Value of Sigma');
zlabel('Price of Asian Put Option');

S0=randi([1 300],1,600); M=randi([1 10],1,600);
callp1=zeros(1,length(S0)); putp1=zeros(1,length(S0));
for i=1:length(S0)
     T=1; K=100; r=0.08; sig=0.2;
     
     u1=exp(sig*sqrt(dt));
     d1=exp(-sig*sqrt(dt));
     
     prices_tmp=opt_price(S0(i),K,r,u1,d1,T,M(i),1);
     callp1(i)=prices_tmp;
     prices_tmp=opt_price(S0(i),K,r,u1,d1,T,M(i),-1);
     putp1(i)=prices_tmp;
     
end
figure();
scatter3(S0,M,callp1);
title('Scatter Plot of Initial Asian Option Price with S(0) and M (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('No. of Subintervals (M)');
zlabel('Price of Asian Call Option');
figure();
scatter3(S0,M,putp1);
title('Scatter Plot of Initial Asian Option Price with S(0) and M (Set 1)');
xlabel('Stock Price at t=0 - S(0)');
ylabel('No. of Subintervals (M)');
zlabel('Price of Asian Put Option');

r=0+(0.2-0)*rand(1,600); sig=0.1+(0.3-0.1)*rand(1,600);
callp1=zeros(1,length(r)); putp1=zeros(1,length(r));
for i=1:length(r)
     T=1; K=100; M=10; S0=100;
     
     u1=exp(sig(i)*sqrt(dt));
     d1=exp(-sig(i)*sqrt(dt));
     
     prices_tmp=opt_price(S0,K,r(i),u1,d1,T,M,1);
     callp1(i)=prices_tmp;
     prices_tmp=opt_price(S0,K,r(i),u1,d1,T,M,-1);
     putp1(i)=prices_tmp;
     
end
figure();
scatter3(r,sig,callp1);
title('Scatter Plot of Initial Asian Option Price with r and sigma (Set 1)');
xlabel('Interest Rate (r)');
ylabel('Value of Sigma');
zlabel('Price of Asian Call Option');
figure();
scatter3(r,sig,putp1);
title('Scatter Plot of Initial Asian Option Price with r and sigma (Set 1)');
xlabel('Interest Rate (r)');
ylabel('Value of Sigma');
zlabel('Price of Asian Put Option');

%3-d Plots End


% Backtracking Function for Calculating Asian option prices

function [asian_prices]=opt_price(S0,K,r,u,d,T,M,parity)    %parity = 1 for call and -1 for put
    
    dt=T/M;
    p=(exp(r*dt)-d)/(u - d);
    st_prices=calc_stock(S0,u,d,M);
    s_prices=size(st_prices);

    asian_prices=zeros(s_prices(1),1);
    
    for i=1:s_prices(1)
        newi=i;
        j=s_prices(2);
        avg_calc=0;
        for j=s_prices(2):-1:1
            avg_calc=avg_calc+(st_prices(newi,j)/(M+1));
            newi=ceil(newi/2);
        end
        asian_prices(i)=max((parity*(avg_calc-K)),0);
    end

    while length(asian_prices)>1
        new_prices=[];
        for i=1:2:length(asian_prices)
            new_prices(ceil(i/2))=(p*asian_prices(i+1))+((1-p)*asian_prices(i));
            new_prices(ceil(i/2))=new_prices(ceil(i/2))*exp(-r*dt);
        end
        asian_prices=new_prices;
    end
end

function [stock_prices] = calc_stock(S0,u,d,M)
    stock_prices=zeros(pow2(M),M+1);
    stock_prices(1,1)=S0;
    for j=1:M
        for i=1:(pow2(j-1))
            stock_prices((2*i)-1,j+1)=stock_prices(i,j)*d;
            stock_prices(2*i,j+1)=stock_prices(i,j)*u;
        end
    end
end

%End of the Program
