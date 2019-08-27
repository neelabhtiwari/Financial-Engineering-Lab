%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g

T=1;K=1;r=0.05;sig=0.6;

t=0:0.2:1;
s=0:0.05:3.0;

callp=zeros(size(t,2),size(s,2));
putp=zeros(size(t,2),size(s,2));


for i=1:size(t,2)
    for j=1:size(s,2)
        [callp(i,j),putp(i,j)]=l7q1(T,K,s(j),r,sig,t(i)); 
    end
end

figure(1)
surf(t,s,callp');
xlabel('Time');
ylabel('Stock price');
title('Call prices');
saveas(gcf,'Surf-call.png');

figure(2)
surf(t,s,putp');
xlabel('Time');
ylabel('Stock price');
title('Put prices');
saveas(gcf,'Surf-put.png');