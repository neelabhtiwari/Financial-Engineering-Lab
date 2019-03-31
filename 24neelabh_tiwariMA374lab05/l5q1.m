%This code is written by Neelabh Tiwari - 160123024 for MA 374 FE LAB Jan-May 2019

clear
clc
format short

M=[0.1,0.2,0.15];
C=[0.005,-0.010,0.004;
  -0.010,0.040,-0.002;
   0.004,-0.002,0.023];
u=[1,1,1];

denom=[u*(C\(u')) u*(C\(M'));
      M*(C\(u')) M*(C\(M'))];
L=u*(C\eye(size(M,2)));
R=M*(C\eye(size(M,2)));
mu=0:0.001:0.5;
w_table=zeros(size(mu,2),size(M,2));
sigma=zeros(1,size(mu,2));

for i=1:size(mu,2)
    temp1=det([1 denom(1,2);
            mu(i) denom(2,2)]);
    temp2=det([denom(1,1) 1;
             denom(2,1) mu(i)]);
    w=(temp1*L+temp2*R)./det(denom);
    w_table(i,:)=w;
    sigma(i)=sqrt(w*C*w');
end

syms x;
denom=[u*(C\(u')) u*(C\(M'));
    M*(C\(u')) M*(C\(M'))];
L=u*(C\eye(size(M,2)));
R=M*(C\eye(size(M,2)));
temp1=det([1 denom(1,2); 
    x denom(2,2)]);
temp2=det([denom(1,1) 1; 
    denom(2,1) x]);
w=(temp1*L+temp2*R)./det(denom);
disp('Weights in terms of mu:');
disp(w);

% Without Short Selling

w1=rand(1,100000);
w2=rand(1,100000);
w3=1-w1-w2;
w=[w1',w2' ,w3'];
w=w(find(min(w,[],2)>=0),:);
mu_extra=M*w';
sigma_extra=zeros(1,size(mu_extra,2));
for i=1:size(mu_extra,2)
    sigma_extra(i)=sqrt(w(i,:)*C*w(i,:)');
end

I=find(min(w_table,[],2)>0);
sigma_nss=[sigma(I),sigma_extra];
mu_nss=[mu(I),mu_extra];


% Consider only 1 & 2
M=[0.1,0.2];
C=[0.005,-0.01;-0.01,0.04];
u=ones(1,size(M,2));

denom=[u*(C\(u')) u*(C\(M'));
    M*(C\(u')) M*(C\(M'))];
L=u*(C\eye(size(M,2)));
R=M*(C\eye(size(M,2)));
mu12=0:0.001:0.5;
sigma12=zeros(1,size(mu12,2));
m12_nss=[];
s12_nss=[];
for i=1:size(mu,2)
    temp1=det([1 denom(1,2); mu12(i) denom(2,2)]);
    temp2=det([denom(1,1) 1; denom(2,1) mu12(i)]);
    w=(temp1*L+temp2*R)./det(denom);
    sigma12(i)=sqrt(w*C*w');
     if(min(w)>0)
       m12_nss=[m12_nss,mu12(i)];
       s12_nss=[s12_nss,sigma12(i)];
    end
end

% Consider only 2 & 3
M=[0.2,0.15];
C=[0.04,-0.002;-0.002,0.023];
u=ones(1,size(M,2));

denom=[u*(C\(u')) u*(C\(M'));
    M*(C\(u')) M*(C\(M'))];
L=u*(C\eye(size(M,2)));
R=M*(C\eye(size(M,2)));
mu23=0:0.001:0.5;
sigma23=zeros(1,size(mu23,2));
m23_nss=[];
s23_nss=[];
for i=1:size(mu,2)
    temp1=det([1 denom(1,2);
        mu23(i) denom(2,2)]);
    temp2=det([denom(1,1) 1;
        denom(2,1) mu23(i)]);
    w=(temp1*L+temp2*R)./det(denom);
    sigma23(i)=sqrt(w*C*w');
     if(min(w)>0)
       m23_nss=[m23_nss,mu23(i)];
       s23_nss=[s23_nss,sigma23(i)];
     end
end

% Consider only 1 & 3
M=[0.1,0.15];
C=[0.005,0.004;0.004,0.023];
u=ones(1,size(M,2));

denom=[u*(C\(u')) u*(C\(M'));
    M*(C\(u')) M*(C\(M'))];
L=u*(C\eye(size(M,2)));
R=M*(C\eye(size(M,2)));
mu13=0:0.001:0.5;
sigma13=zeros(1,size(mu13,2));
m13_nss=[];
s13_nss=[];
for i=1:size(mu,2)
    temp1=det([1 denom(1,2); mu13(i) denom(2,2)]);
    temp2=det([denom(1,1) 1; denom(2,1) mu13(i)]);
    w=(temp1*L+temp2*R)./det(denom);
    sigma13(i)=sqrt(w*C*w');
    if(min(w)>0)
       m13_nss=[m13_nss,mu13(i)];
       s13_nss=[s13_nss,sigma13(i)];
    end
end

figure,hold on
scatter(sigma_nss,mu_nss,10,[255 218 185]./255);
plot(sigma,mu,'b');
plot(sigma12,mu12,'g');
plot(sigma23,mu23,'r');
plot(sigma13,mu13,'k');

xlim([0,0.3]);
ylim([0, 0.25])
xlabel('\sigma');
ylabel('\mu');
grid on
legend('Feasible region','All 1,2 and 3','Only 1 and 2','Only 2 and 3','Only 1 and 3','location','Northwest');
hold off

% weights
figure,hold on
plot(w_table(:,1),w_table(:,2),'r');
to_plot=0:0.01:1;

plot(to_plot,1-to_plot,'linewidth',2);
plot(zeros(1,101),to_plot,'linewidth',2);
plot(to_plot,zeros(1,101),'linewidth',2);
grid on
xlim([-0.5,2]);
ylim([-0.5,1.5]);

xlabel('w_1');
ylabel('w_2');
legend('MVL','Only 1 and 2','Only 2 and 3','Only 1 and 3')
hold off;


coefficients = polyfit(w_table(1:2,1),w_table(1:2,2),1);
fprintf('Line equation: w2 = %f*x + %f\n',coefficients(1),coefficients(2));

