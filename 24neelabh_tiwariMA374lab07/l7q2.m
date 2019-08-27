%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g

T=1;K=1;r=0.05;sig=0.6;

t=0:0.2:1;
s=0:0.05:3.0;

callp=zeros(length(t),length(s));
putp=zeros(length(t),length(s));


for i=1:length(t)
    for j=1:length(s)
        [callp(i,j),putp(i,j)]=l7q1(T,K,s(j),r,sig,t(i)); 
    end
end

subplot(2,1,1),hold on
for i = 1:length(t)
    plot(s,callp(i,:));
end
grid on
xlabel('Stock price');
ylabel('Option price');
title('Call prices');
legend('t=0','t=0.2','t=0.4','t=0.6','t=0.8','t=1','location','Northwest');
hold off;

subplot(2,1,2),hold on
for i = 1:length(t)
   plot(s,putp(i,:));
end
grid on
xlabel('Stock price');
ylabel('Option price');
title('Put prices');
legend('t=0','t=0.2','t=0.4','t=0.6','t=0.8','t=1');
hold off;
saveas(gcf,'2d.png');

figure(2)
stem3(t,s,callp');
xlabel('Time');
ylabel('Stock price');
title('Call prices');
saveas(gcf,'3d-Call.png');
figure(3)
stem3(t,s,putp');
xlabel('Time');
ylabel('Stock price');
title('Put prices');
saveas(gcf,'3d-Put.png');
