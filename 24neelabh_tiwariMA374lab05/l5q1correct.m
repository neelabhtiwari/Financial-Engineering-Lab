clear; clc; format short;

figure();

m=[0.1,0.2,0.15];
C=[0.005,-0.010,0.004;
  -0.010,0.040,-0.002;
   0.004,-0.002,0.023];

u=[1,1,1];

wmvp = u*inv(C)/(u*inv(C)*u');
sigmvp = sqrt(wmvp*C*wmvp');
mumvp = m*wmvp';

% plot(sigmvp,mumvp,'o');

muef=zeros(size(mumvp:0.005:0.5));
sigef=zeros(size(mumvp:0.005:0.5));
j=1;
for i=mumvp:0.005:0.5
    muef(j)=i;
    
    num = det([1 u*inv(C)*m';i m*inv(C)*m'])*u*inv(C)+det([u*inv(C)*u' 1;m*inv(C)*u' i])*m*inv(C);
    den = det([u*inv(C)*u' u*inv(C)*m';m*inv(C)*u' m*inv(C)*m']);
    w=num/den;
    
    sigef(j)=sqrt(w*C*w');
    j=j+1;
end

hold on
plot(sigef,muef,'r');
grid on;
title('Markowitz Bullet - Effecient Frontier is the portion in Red')
xlabel('Value of Risk (\sigma)');
ylabel('Value of Return (\mu)');    

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

hold on
plot(sigef,muef,'b');

figure();

m=[0.1,0.2,0.15];
C=[0.005,-0.010,0.004;
  -0.010,0.040,-0.002;
   0.004,-0.002,0.023];

u=[1,1,1];


w1forg2=zeros(size(0:0.001:0.5));
w2forg2=zeros(size(0:0.001:0.5));

muef=zeros(size(0:0.001:0.5));
sigef=zeros(size(0:0.001:0.5));
j=1;
for i=0:0.001:0.5
    muef(j)=i;
    
    num = det([1 u*inv(C)*m';i m*inv(C)*m'])*u*inv(C)+det([u*inv(C)*u' 1;m*inv(C)*u' i])*m*inv(C);
    den = det([u*inv(C)*u' u*inv(C)*m';m*inv(C)*u' m*inv(C)*m']);
    w=num/den;
    
    w1forg2(1,j)=w(1,1);
    w2forg2(1,j)=w(1,2);
    
    sigef(j)=sqrt(w*C*w');
    j=j+1;
end

hold on
plot(sigef,muef,'r');
grid on;
title('Markowitz Bullet')
xlabel('Value of Risk (\sigma)');
ylabel('Value of Return (\mu)');   

%1 and 2
m=[0.1,0.2];
C=[0.005,-0.010;
  -0.010,0.040];

u=[1,1];

muef=zeros(size(0:0.001:0.5));
sigef=zeros(size(0:0.001:0.5));
j=1;
for i=0:0.001:0.5
    muef(j)=i;
    
    num = det([1 u*inv(C)*m';i m*inv(C)*m'])*u*inv(C)+det([u*inv(C)*u' 1;m*inv(C)*u' i])*m*inv(C);
    den = det([u*inv(C)*u' u*inv(C)*m';m*inv(C)*u' m*inv(C)*m']);
    w=num/den;
    
    sigef(j)=sqrt(w*C*w');
    j=j+1;
end

hold on
plot(sigef,muef,'b');

%2 and 3

m=[0.2,0.15];
C=[0.040,-0.002;
   -0.002,0.023];

u=[1,1];

muef=zeros(size(0:0.001:0.5));
sigef=zeros(size(0:0.001:0.5));
j=1;
for i=0:0.001:0.5
    muef(j)=i;
    
    num = det([1 u*inv(C)*m';i m*inv(C)*m'])*u*inv(C)+det([u*inv(C)*u' 1;m*inv(C)*u' i])*m*inv(C);
    den = det([u*inv(C)*u' u*inv(C)*m';m*inv(C)*u' m*inv(C)*m']);
    w=num/den;
    
    sigef(j)=sqrt(w*C*w');
    j=j+1;
end

hold on
plot(sigef,muef,'g');

%1 and 3

m=[0.1,0.15];
C=[0.005,0.004;
   0.004,0.023];

u=[1,1];

muef=zeros(size(0:0.001:0.5));
sigef=zeros(size(0:0.001:0.5));
j=1;
for i=0:0.001:0.5
    muef(j)=i;
    
    num = det([1 u*inv(C)*m';i m*inv(C)*m'])*u*inv(C)+det([u*inv(C)*u' 1;m*inv(C)*u' i])*m*inv(C);
    den = det([u*inv(C)*u' u*inv(C)*m';m*inv(C)*u' m*inv(C)*m']);
    w=num/den;
    
    sigef(j)=sqrt(w*C*w');
    j=j+1;
end

hold on
plot(sigef,muef,'m');

%all 

m=[0.1,0.2,0.15];
C=[0.005,-0.010,0.004;
  -0.010,0.040,-0.002;
   0.004,-0.002,0.023];

u=[1,1,1];

w1=rand(1,10000);
w2=rand(1,10000);
w3=1-w1-w2;

w=[w1' w2' w3'];

w=w(find(min(w,[],2)>=0),:);

mu=[];
sig=[];

for i=1:1:size(w,1)
    mu(i)=m*w(i,:)';
    sig(i)=sqrt(w(i,:)*C*w(i,:)');
end

hold on
scatter(sig,mu,10,[255 218 185]./255);

legend('All 1,2 and 3','Only 1 and 2','Only 2 and 3','Only 1 and 3','No short Selling Feasible Region','location','Northwest');

w1=0:0.001:1;
w2=1-w1;
figure();
plot(w1,w2);
grid on;
xlim([-0.5 1.5]);
ylim([-0.5 1.5]);

w1=0:0.001:1;
w2=zeros(size(w1));
hold on
plot(w1,w2,'r');

w2=0:0.001:1;
w1=zeros(size(w2));
hold on
plot(w1,w2,'b');

hold on
plot(w1forg2,w2forg2,'m');

legend('Only 1 and 2','Only 1 and 3','Only 2 and 3','MVL','location','Northwest');
title('On W1 - W2 Plane')
xlabel('Value of W1');
ylabel('Value of W2'); 
