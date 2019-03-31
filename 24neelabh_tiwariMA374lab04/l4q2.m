%This code is written by Neelabh Tiwari - 160123024 for MA 374 FE LAB Jan-May 2019

clear
clc
format short

datafile='./data.csv';
data=csvread(datafile,1,1);
m=mean(data);
C=cov(data);

%{
display(data);
display(m);
display(C);
%}

u = [1,1,1,1,1,1,1,1,1,1];

%Part a)

for i=1:1:200
    ret(i)=i*6; 
    y=[ret(i);1];
    M=[m*inv(C)*m',u*inv(C)*m';m*inv(C)*u',u*inv(C)*u'];
    lam=2*inv(M)*y;
    w=(lam(1,1)*m*inv(C)+lam(2,1)*u*inv(C))/2;
    sig(i)=sqrt(w*C*w');
end

figure();
plot(sig,ret,'r');
grid on;
title('Markowitz Efficient Frontier of historical data used')
xlabel('Value of Risk (\sigma)');
ylabel('Value of Return (\mu)');
xlim([0,25]); ylim([0,1200]);

figure();
plot(sig,ret,'r');
grid on;
title('Markowitz Efficient Frontier of the given data')
xlabel('Value of Risk (\sigma)');
ylabel('Value of Return (\mu)');
xlim([0,25]); ylim([0,1200]);

%Part b)

wm=(m-0.07.*u)*inv(C)/((m-0.07.*u)*inv(C)*u');
um=wm*m';
sigm=sqrt(wm*C*wm');

fprintf('\nFor 7 %% risk-free return --\n');    
Weights=wm; display(Weights);
fprintf('\nReturn on market portfolio = %6.4f',um);
fprintf('\nRisk on market portfolio = %6.4f%% (%6.4f)\n\n',sigm*100,sigm);

%Part c)

x=-2:0.1:25;
y=0.07+((um-0.07)/sigm)*x;

hold on
plot(x,y,'g');
grid on ;
title('Capital Market Line and Markowitz Efficient Frontier');
xlabel('Value of Risk (\sigma)');
ylabel('Value of Return (\mu)');
scatter(sigm,um,'*');
legend('Markowitz Efficient Frontier','CML','Market Portfolio');

figure();
plot(x,y,'g');
grid on ;
title('Capital Market Line')
xlabel('Value of Risk (\sigma)');
ylabel('Value of Return (\mu)');


%Part d)

beta=-2:0.1:2;
muv=0.07+(um-0.07).*beta;

figure();
plot(beta,muv);
grid on
title('Security Market Line')
xlabel('Value of Risk (\sigma)');
ylabel('Value of Return (\mu)');


