clear; clc; format short;

m=[0.1,0.2,0.15];
C=[0.005,-0.010,0.004;
  -0.010,0.040,-0.002;
   0.004,-0.002,0.023];

u=[1,1,1];

wmvp = u*inv(C)/(u*inv(C)*u');
sigmvp = sqrt(wmvp*C*wmvp');
mumvp = m*wmvp';
figure();

plot(sigmvp,mumvp,'o');
hold on

muef=zeros(size(mumvp:0.1:0.5));
sigef=zeros(size(mumvp:0.1:0.5));
j=1;
for i=mumvp:0.005:0.5
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


muef=zeros(size(mumvp:-0.0005:0.005));
sigef=zeros(size(mumvp:-0.0005:0.005));
j=1;
for i=mumvp:-0.0005:0.005
    muef(j)=i;
    
    num = det([1 u*inv(C)*m';i m*inv(C)*m'])*u*inv(C)+det([u*inv(C)*u' 1;m*inv(C)*u' i])*m*inv(C);
    den = det([u*inv(C)*u' u*inv(C)*m';m*inv(C)*u' m*inv(C)*m']);
    w=num/den;
    
    sigef(j)=sqrt(w*C*w');
    j=j+1;
end

plot(sigef,muef,'b');

%For 18 percent risk
i=0.18;
num = det([1 u*inv(C)*m';i m*inv(C)*m'])*u*inv(C)+det([u*inv(C)*u' 1;m*inv(C)*u' i])*m*inv(C);
den = det([u*inv(C)*u' u*inv(C)*m';m*inv(C)*u' m*inv(C)*m']);
w=num/den;

%Market Portfolio 

gw=(m-0.1*u)*inv(C);
gamma=sum(gw);
w=gw/gamma;
mmu=m*w';
msig=sqrt(w*C*w');

hold on
plot(msig,mmu,'*');

x=0:0.005:0.8;
y=0.1+((mmu-0.1)/msig)*x;

hold on
plot(x,y,'g');
legend('Minimum Variance Portfolio','Efficient Frontier and MVL','Continuing MVL','Market Portfolio','Capital Market Line');

%Part f

risk=0.1;
ret=0.1+((mmu-0.1)/msig)*risk;

rf=(ret-mmu)/(0.1-mmu)
(1-rf)*w

risk=0.25;
ret=0.25+((mmu-0.25)/msig)*risk;

rf=(ret-mmu)/(0.25-mmu)
(1-rf)*w

