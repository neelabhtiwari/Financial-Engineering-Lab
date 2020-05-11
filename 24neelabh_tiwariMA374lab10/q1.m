%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g

init = 100;
r = 0.05;
mu = 0.1;
sigma = 0.2;
T = 0.5; % Six month period
dt = 0.001;
paths = 10;
values = zeros(T/dt,paths);
K = 105;

str = 'Normal';

for i=1:paths
values(:,i) = GBM(init, mu, sigma, T, dt, str);
end

% check for correctness
% mean(values(end,:))
% var(values(end,:))


figure(1), hold on
for i=1:paths
plot([0:dt:T-dt],values(:,i))
end
xlabel('t');
ylabel('Price');
title('In real world');
saveas(gcf,'real_world.png');


for i=1:paths
values(:,i) = GBM(init, r, sigma, T, dt, str);
end


% 
% mean(values(end,:))
% var(values(end,:))


figure(2), hold on
for i=1:paths
plot([0:dt:T-dt],values(:,i))
end
xlabel('t');
ylabel('Price');
title('In risk-free world');
saveas(gcf,'risk_free_world.png');


K = [90,105,110];
paths = 100;
for i=1:size(K,2)
    
    call_price = 0;
    put_price = 0;
    for k=1:paths
        S = GBM(init, r, sigma, T, dt, str);
        call_price = call_price + max(((sum(S)/(T/dt))-K(i)),0);
        put_price = put_price + max((K(i)-(sum(S)/(T/dt))),0);
    end

    cp = (call_price/paths)*exp(-r*T);
    pp = (put_price/paths)*exp(-r*T);
        


    fprintf("Price of call option with strike price: %d is %f\n",K(i),cp);
    fprintf("Price of put option with strike price: %d is %f\n",K(i),pp);
    
end

init = 100;
r = 0.05;
mu = 0.1;
sigma = 0.2;
T = 0.5; % Six month period
dt = 0.001;
paths = 10;
K = 105;


%%% Vary init
var = 80:0.5:120;
paths = 100;
cp = zeros(1,size(var,2));
pp = zeros(1,size(var,2));
for i=1:size(var,2)
    
%     var(i)
    
    call_price = 0;
    put_price = 0;
    for k=1:paths
        S = GBM(var(i), r, sigma, T, dt, str);
        call_price = call_price + max(((sum(S)/(T/dt))-K),0);
        put_price = put_price + max((K-(sum(S)/(T/dt))),0);
    end

    cp(i) = (call_price/paths)*exp(-r*T);
    pp(i) = (put_price/paths)*exp(-r*T);

    
end

figure(1)
subplot(2,1,1)
plot(var,cp)
xlabel('Initial Stock price');
ylabel('Call Price');

subplot(2,1,2)
plot(var,pp)
xlabel('Initial Stock price');
ylabel('Put Price');
saveas(gcf, 'vary_init.png')


%%% Vary K
var = 80:0.5:120;
paths = 100;
cp = zeros(1,size(var,2));
pp = zeros(1,size(var,2));
for i=1:size(var,2)
    
%     var(i) 
    
    call_price = 0;
    put_price = 0;
    for k=1:paths
        S = GBM(init, r, sigma, T, dt, str);
        call_price = call_price + max(((sum(S)/(T/dt))-var(i)),0);
        put_price = put_price + max((var(i)-(sum(S)/(T/dt))),0);
    end

    cp(i) = (call_price/paths)*exp(-r*T);
    pp(i) = (put_price/paths)*exp(-r*T);
    

    
end

figure(1)
subplot(2,1,1)
plot(var,cp)
xlabel('Strike Price');
ylabel('Call Price');

subplot(2,1,2)
plot(var,pp)
xlabel('Strike Price');
ylabel('Put Price');
saveas(gcf, 'vary_K.png')



%%% vary r
var = 0.01:0.01:0.9;
paths = 500;
cp = zeros(1,size(var,2));
pp = zeros(1,size(var,2));
for i=1:size(var,2)
    
%     var(i)
    
    call_price = 0;
    put_price = 0;
    for k=1:paths
        S = GBM(init, var(i), sigma, T, dt, str);
        call_price = call_price + max(((sum(S)/(T/dt))-K),0);
        put_price = put_price + max((K-(sum(S)/(T/dt))),0);
    end

    cp(i) = (call_price/paths)*exp(-var(i)*T);
    pp(i)= (put_price/paths)*exp(-var(i)*T);
    
end

figure(1)
subplot(2,1,1)
plot(var,cp)
xlabel('Risk-free rate');
ylabel('Call Price');

subplot(2,1,2)
plot(var,pp)
xlabel('Risk-free rate');
ylabel('Put Price');
saveas(gcf, 'vary_r.png')

%%% Vary sigma
var = 0.01:0.01:0.9;
paths = 500;
cp = zeros(1,size(var,2));
pp = zeros(1,size(var,2));
for i=1:size(var,2)
    
%     var(i)
    
    call_price = 0;
    put_price = 0;
    for k=1:paths
        S = GBM(init, r, var(i), T, dt, str);
        call_price = call_price + max(((sum(S)/(T/dt))-K),0);
        put_price = put_price + max((K-(sum(S)/(T/dt))),0);
    end

    cp(i) = (call_price/paths)*exp(-r*T);
    pp(i)= (put_price/paths)*exp(-r*T);
    
end

figure(1)
subplot(2,1,1)
plot(var,cp)
xlabel('Volatility');
ylabel('Call Price');

subplot(2,1,2)
plot(var,pp)
xlabel('Volatility');
ylabel('Put Price');
saveas(gcf, 'vary_sigma.png')

%%% Vary T

var = 0.01:0.05:0.9;
paths = 2000;
cp = zeros(1,size(var,2));
pp = zeros(1,size(var,2));
for i=1:size(var,2)
    
%     var(i)
    
    call_price = 0;
    put_price = 0;
    for k=1:paths
        S = GBM(init, r, sigma, var(i), dt, str);
        call_price = call_price + max(((sum(S)/(var(i)/dt))-K),0);
        put_price = put_price + max((K-(sum(S)/(var(i)/dt))),0);
    end

    cp(i) = (call_price/paths)*exp(-r*var(i));
    pp(i)= (put_price/paths)*exp(-r*var(i));
    
end

figure(1)
subplot(2,1,1)
plot(var,cp)
xlabel('Maturity');
ylabel('Call Price');

subplot(2,1,2)
plot(var,pp)
xlabel('Maturity');
ylabel('Put Price');
saveas(gcf, 'vary_T.png')


