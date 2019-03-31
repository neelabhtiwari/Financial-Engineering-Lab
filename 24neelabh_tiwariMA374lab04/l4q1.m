%This code is written by Neelabh Tiwari - 160123024 for MA 374 FE LAB Jan-May 2019

clear
clc
format short

m=[0.1,0.2,0.15];
C=[0.005,-0.010,0.004;
  -0.010,0.040,-0.002;
   0.004,-0.002,0.023];

u=[1,1,1];

%Part a) and b)

fprintf(' Return - Risk   -   W1    -    W2    -    W3\n');
for i=1:1:100
    ret(i)=i*0.005; 
    y=[ret(i);1];
    M=[m*inv(C)*m',u*inv(C)*m';m*inv(C)*u',u*inv(C)*u'];
    lam=2*inv(M)*y;
    w=(lam(1,1)*m*inv(C)+lam(2,1)*u*inv(C))/2;
    sig(i)=sqrt(w*C*w');
    if(rem(i,10)==0)
        fprintf('  %0.2f   %6.4f    %6.4f    %6.4f     %6.4f  \n',ret(i),sig(i),w(1,1),w(1,2),w(1,3));
    end
end

figure();
plot(sig,ret,'r');
grid on;
title('Markowitz Efficient Frontier of the given data')
xlabel('Value of Risk (\sigma)');
ylabel('Value of Return (\mu)');

figure();
plot(sig,ret,'r');
grid on;
title('Markowitz Efficient Frontier of the given data')
xlabel('Value of Risk (\sigma)');
ylabel('Value of Return (\mu)');

%Part c)

A=u*inv(C)*u';
B=u*inv(C)*m';
V=m*inv(C)*m';
d=A*V-B*B;
sg=0.15;

h1=(2*B+sqrt(4*B*B-4*A*(V-d*sg*sg)))/(2*A);
y=[h1;1];
M=[m*inv(C)*m',u*inv(C)*m';m*inv(C)*u',u*inv(C)*u'];
lam=2*inv(M)*y;
w=(lam(1,1)*m*inv(C)+lam(2,1)*u*inv(C))/2;
sqrt(w*C*w');

fprintf('\nMaximum Return Portfolio for 15 %% risk --\n');
fprintf('Return = %6.4f and Weights : %6.4f  %6.4f  %6.4f\n',h1,w(1,1),w(1,2),w(1,3));

h2=(2*B-sqrt(4*B*B-4*A*(V-d*sg*sg)))/(2*A);
y=[h2;1];
M=[m*inv(C)*m',u*inv(C)*m';m*inv(C)*u',u*inv(C)*u'];
lam=2*inv(M)*y;
w=(lam(1,1)*m*inv(C)+lam(2,1)*u*inv(C))/2;
sqrt(w*C*w');

fprintf('Minimum Return Portfolio for 15 %% risk --\n');
fprintf('Return = %6.4f and Weights : %6.4f  %6.4f  %6.4f\n',h2,w(1,1),w(1,2),w(1,3));
    
%Part d)

y=[0.18;1];
M=[m*inv(C)*m',u*inv(C)*m';m*inv(C)*u',u*inv(C)*u'];
lam=2*inv(M)*y;
w=(lam(1,1)*m*inv(C)+lam(2,1)*u*inv(C))/2;
sig=sqrt(w*C*w');
    
fprintf('\nRisk for 18 %% return = %6.4f %%',sig*100);    
fprintf('\nWeights : %6.4f  %6.4f  %6.4f\n',w(1,1),w(1,2),w(1,3));

%Part e)-1

wm=(m-0.1.*u)*inv(C)/((m-0.1.*u)*inv(C)*u');
um=wm*m';
sigm=sqrt(wm*C*wm');

fprintf('\nFor 10 %% risk-free return --');    
fprintf('\nWeights : %6.4f  %6.4f  %6.4f',wm(1,1),wm(1,2),wm(1,3));
fprintf('\nReturn on market portfolio = %6.4f',um);
fprintf('\nRisk on market portfolio = %6.4f%% (%6.4f)\n',sigm*100,sigm);

%Part e)-2

x=0:0.1:1;
y=0.1+((um-0.1)/sigm)*x;

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


%Part f)

y=0.1+(um-0.1)/sigm*0.1;
rf=(y-um)/(0.1-um);
risked=(1-rf).*wm;

fprintf('\nPortfolio for 10 %% risk --');  
fprintf('\nRisk-Free Asset - %6.4f',rf);
fprintf('\nRisky Assets Weights : %6.4f  %6.4f  %6.4f',risked(1,1),risked(1,2),risked(1,3));


y=0.1+(um-0.1)/sigm*0.25;
rf=(y-um)/(0.1-um);
risked=(1-rf).*wm;

fprintf('\n\nPortfolio for 25 %% risk --');  
fprintf('\nRisk-Free Asset - %6.4f',rf);
fprintf('\nRisky Assets Weights : %6.4f  %6.4f  %6.4f\n\n',risked(1,1),risked(1,2),risked(1,3));









