clear
clc

format shortG

Sat0=100;
K=105;
T=5;
r=0.05;
sig=0.3;

fprintf('\nThe Stock price at T=0 is 100, K = 105, T = 5, r = 0.05 and sigma = 0.3\n');

% 'opt_price' is the backtracking function to calculating option prices. 
% It is declared and defined at the end

%          ::: Ques 1 Start :::

M=[1,5,10,20,50,100,200,400];
callprices=zeros(1,length(M));
putprices=zeros(1,length(M));

for i=1:length(M)
    
    dt=T/M(i);
    
    u=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
    d=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
    p=(exp(r*dt)-d)/(u-d);
    
    if d<exp(r*dt) && exp(r*dt)<u
    %    disp('There is no arbitrage possible. Proceeding to calculate option prices');
    else
    %    disp('There is an arbitrage opportunity possible. The program will terminate');
        return;
    end
    
    [call_mat,put_mat]=opt_price(Sat0,K,T,r,sig,M(i),p,u,d,dt);
    
    callprices(i)=call_mat(1,1);
    putprices(i)=put_mat(1,1);
    
end

table=[M;callprices;putprices]';
fprintf('\n            M     Call Price    Put Price\n\n');
disp(table);

%          ::: Ques 1 End :::

%          ::: Ques 2 Start :::

M1a=1:1:400;
M5a=1:5:400;
M1b=100:1:1000;
M5b=100:5:2000;

%For M varying from 1 to 400 with step size 1   M1a=1:1:400

callprices=zeros(1,length(M1a));
putprices=zeros(1,length(M1a));

for i=1:length(M1a)
    
    dt=T/M1a(i);
    
    u=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
    d=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
    p=(exp(r*dt)-d)/(u-d);
    
    if d<exp(r*dt) && exp(r*dt)<u
    %    disp('There is no arbitrage possible. Proceeding to calculate option prices');
    else
    %    disp('There is an arbitrage opportunity possible. The program will terminate');
        return;
    end
    
    [call_mat,put_mat]=opt_price(Sat0,K,T,r,sig,M1a(i),p,u,d,dt);
    
    callprices(i)=call_mat(1,1);
    putprices(i)=put_mat(1,1);
    
end

figure(1)
plot(M1a,callprices,'r');
title('Price of a Call option Vs number of steps in Binomial model framework (Step Size 1)');
xlabel('Number of Subintervals');
ylabel('Price of Call option');
figure(2)
plot(M1a,putprices,'g');
title('Price of a Put option Vs number of steps in Binomial model framework (Step Size 1)');
xlabel('Number of Subintervals');
ylabel('Price of Put option');

%For M varying from 1 to 400 with step size 5  M5a=1:5:400

callprices=zeros(1,length(M5a));
putprices=zeros(1,length(M5a));

for i=1:length(M5a)
    
    dt=T/M5a(i);
    
    u=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
    d=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
    p=(exp(r*dt)-d)/(u-d);
    
    if d<exp(r*dt) && exp(r*dt)<u
    %    disp('There is no arbitrage possible. Proceeding to calculate option prices');
    else
    %    disp('There is an arbitrage opportunity possible. The program will terminate');
        return;
    end
    
    [call_mat,put_mat]=opt_price(Sat0,K,T,r,sig,M5a(i),p,u,d,dt);
    
    callprices(i)=call_mat(1,1);
    putprices(i)=put_mat(1,1);
    
end

figure(3)
plot(M5a,callprices,'r');
title('Price of a Call option Vs number of steps in Binomial model framework (Step Size 5)');
xlabel('Number of Subintervals');
ylabel('Price of Call option');
figure(4)
plot(M5a,putprices,'g');
title('Price of a Put option Vs number of steps in Binomial model framework (Step Size 5)');
xlabel('Number of Subintervals');
ylabel('Price of Put option');

%For M varying from 100 to 1000 with step size 1  M1b=100:1:1000

callprices=zeros(1,length(M1b));
putprices=zeros(1,length(M1b));

for i=1:length(M1b)
    
    dt=T/M1b(i);
    
    u=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
    d=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
    p=(exp(r*dt)-d)/(u-d);
    
    if d<exp(r*dt) && exp(r*dt)<u
    %    disp('There is no arbitrage possible. Proceeding to calculate option prices');
    else
    %    disp('There is an arbitrage opportunity possible. The program will terminate');
        return;
    end
    
    [call_mat,put_mat]=opt_price(Sat0,K,T,r,sig,M1b(i),p,u,d,dt);
    
    callprices(i)=call_mat(1,1);
    putprices(i)=put_mat(1,1);
    
end

figure(5)
plot(M1b,callprices,'r');
title('Price of a Call option Vs number of steps in Binomial model framework (Step Size 1)');
xlabel('Number of Subintervals');
ylabel('Price of Call option');
figure(6)
plot(M1b,putprices,'g');
title('Price of a Put option Vs number of steps in Binomial model framework (Step Size 1)');
xlabel('Number of Subintervals');
ylabel('Price of Put option');

%For M varying from 100 to 2000 with step size 5  M5b=100:5:2000

callprices=zeros(1,length(M5b));
putprices=zeros(1,length(M5b));

for i=1:length(M5b)
    
    dt=T/M5b(i);
    
    u=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
    d=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
    p=(exp(r*dt)-d)/(u-d);
    
    if d<exp(r*dt) && exp(r*dt)<u
    %    disp('There is no arbitrage possible. Proceeding to calculate option prices');
    else
    %    disp('There is an arbitrage opportunity possible. The program will terminate');
        return;
    end
    
    [call_mat,put_mat]=opt_price(Sat0,K,T,r,sig,M5b(i),p,u,d,dt);
    
    callprices(i)=call_mat(1,1);
    putprices(i)=put_mat(1,1);
    
end

figure(7)
plot(M5b,callprices,'r');
title('Price of a Call option Vs number of steps in Binomial model framework (Step Size 5)');
xlabel('Number of Subintervals');
ylabel('Price of Call option');
figure(8)
plot(M5b,putprices,'g');
title('Price of a Put option Vs number of steps in Binomial model framework (Step Size 5)');
xlabel('Number of Subintervals');
ylabel('Price of Put option');

%          ::: Ques 2 End :::

%          ::: Ques 3 Start :::

M=20;

callprices=zeros(1,M);
putprices=zeros(1,M);
 
dt=T/M;
    
u=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
d=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
p=(exp(r*dt)-d)/(u-d);
    
if d<exp(r*dt) && exp(r*dt)<u
%    disp('There is no arbitrage possible. Proceeding to calculate option prices');
  else 
%    disp('There is an arbitrage opportunity possible. The program will terminate');
  return;
end

[call_mat,put_mat]=opt_price(Sat0,K,T,r,sig,M,p,u,d,dt);

t=[0,0.50,1,1.50,3,4.5];
colnum=[1,3,5,7,13,19];


calltab=[call_mat(:,1),call_mat(:,3),call_mat(:,5),call_mat(:,7),call_mat(:,13),call_mat(:,19)];
puttab=[put_mat(:,1),put_mat(:,3),put_mat(:,5),put_mat(:,7),put_mat(:,13),put_mat(:,19)];

disp(calltab);
disp(puttab);

%          ::: Ques 3 End :::

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