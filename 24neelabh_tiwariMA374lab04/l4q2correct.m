clear; clc; format short;

fl1=csvread('./data.csv',1,1);

fl=zeros(size(fl1,1)-1,size(fl1,2));

fl1(2:end,:)=(fl1(2:end,:)-fl1(1:end-1,:))./fl1(1:end-1,:);

fl=fl1(2:end,:);

mean(fl)

prod=ones(1,size(fl,2));

for i=1:size(fl,1)
    prod(1,:)=prod(1,:).*(fl(i,:)+1);
end


year=1;
prod.^(1/year);

prod=prod-1;

prod
M=prod;
m=M;
C=cov(fl);
u=[1 1 1 1 1 1 1 1 1 1];

wmvp = u*inv(C)/(u*inv(C)*u');
sigmvp = sqrt(wmvp*C*wmvp');
mumvp = m*wmvp';
figure();

plot(sigmvp,mumvp,'o');
hold on

muef=zeros(size(mumvp:0.05:1));
sigef=zeros(size(mumvp:0.05:1));
j=1;

for i=mumvp:0.05:1
    muef(j)=i;
    
    num = det([1 u*inv(C)*m';i m*inv(C)*m'])*u*inv(C)+det([u*inv(C)*u' 1;m*inv(C)*u' i])*m*inv(C);
    den = det([u*inv(C)*u' u*inv(C)*m';m*inv(C)*u' m*inv(C)*m']);
    w=num/den;
    
    sigef(j)=sqrt(w*C*w');
    j=j+1;
end

plot(sigef,muef,'r');
grid on;
title('Markowitz Bullet - Effecient Frontier is the portion in Red')
xlabel('Value of Risk (\sigma)');
ylabel('Value of Return (\mu)');    
hold on

muef=zeros(size(mumvp:-0.05:0));
sigef=zeros(size(mumvp:-0.05:0));
j=1;
for i=mumvp:-0.05:0
    muef(j)=i;
    
    num = det([1 u*inv(C)*m';i m*inv(C)*m'])*u*inv(C)+det([u*inv(C)*u' 1;m*inv(C)*u' i])*m*inv(C);
    den = det([u*inv(C)*u' u*inv(C)*m';m*inv(C)*u' m*inv(C)*m']);
    w=num/den;
    
    sigef(j)=sqrt(w*C*w');
    j=j+1;
end

plot(sigef,muef,'b');

% gw=(m-0.07*u)*inv(C);
% gamma=sum(gw);
% w=gw/gamma;
% mmu=m*w';
% msig=sqrt(w*C*w');
% 
% hold on
% plot(msig,mmu,'*');
% 
% x=0:1:20;
% y=0.07+((mmu-0.07)/msig)*x;
% 
% hold on
% plot(x,y,'g');
% legend('Minimum Variance Portfolio','Efficient Frontier and MVL','Continuing MVL','Market Portfolio','Capital Market Line');
% 
% beta=0:1:25;
% mmu
% plot(beta,0.07+(mmu-0.07)*beta,'r');
