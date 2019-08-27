%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g

T=1;K=1;r=0.05;sig=0.6;

t=0:0.05:1;
s=0:0.05:3.0;
var=0.5:0.1:3;

callp=zeros(size(t,2),size(var,2));
putp=zeros(size(t,2),size(var,2));

% Varying with K
for i=1:size(t,2)
    for j=1:size(var,2)
        [callp(i,j),putp(i,j)]=l7q1(T,var(j),1,r,sig,t(i)); 
    end
end

figure(1)
subplot(2,1,1),hold on
for i = 1:4:size(t,2)
    plot(var,callp(i,:),'Linewidth',1.2);
end
grid on
xlabel('Strike price');
ylabel('Option price');
title('Sensitivity of Call prices with varying K');
legend('t=0','t=0.2','t=0.4','t=0.6','t=0.8','t=1');
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 15.25, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
hold off;

subplot(2,1,2),hold on
for i = 1:4:size(t,2)
   plot(var,putp(i,:),'Linewidth',1.2);
end
grid on
xlabel('Strike Price');
ylabel('Option price');
title('Sensitivity of Put prices with varying K');
legend('t=0','t=0.2','t=0.4','t=0.6','t=0.8','t=1','Location','NorthWest');
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 15.25, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
hold off;
saveas(gcf,'VaryK.png');

figure(5)
surf(t,var,callp');
xlabel('Time');
ylabel('Strike price');
title('Call prices varying K');
saveas(gcf,'surf-call-k.png');


figure(6)
surf(t,var,putp');
xlabel('Time');
ylabel('Strike price');
title('Put prices varying K');
saveas(gcf,'surf-put-k.png');

var=0.01:0.01:0.9;

callp=zeros(size(t,2),size(var,2));
putp=zeros(size(t,2),size(var,2));

% Varying with r
for i=1:size(t,2)
    for j=1:size(var,2)
        [callp(i,j),putp(i,j)]=l7q1(T,K,1,var(j),sig,t(i)); 
    end
end

figure(2)
subplot(2,1,1),hold on
for i = 1:4:size(t,2)
    plot(var,callp(i,:),'Linewidth',1.2);
end
grid on
xlabel('Interest rate');
ylabel('Option price');
title('Sensitivity of Call prices with varying r');
legend('t=0','t=0.2','t=0.4','t=0.6','t=0.8','t=1','location','Northwest');
% legend.Location = "NorthWest";
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 15.25, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
hold off;

subplot(2,1,2),hold on
for i = 1:4:size(t,2)
   plot(var,putp(i,:),'Linewidth',1.2);
end
grid on
xlabel('Interest rate');
ylabel('Option price');
title('Sensitivity of Put prices with varying r');
legend('t=0','t=0.2','t=0.4','t=0.6','t=0.8','t=1');
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 15.25, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
hold off;
saveas(gcf,'Varyr.png');

figure(7)
surf(t,var,callp');
xlabel('Time');
ylabel('Interest rate');
title('Call prices varying interest rate');
saveas(gcf,'surf-call-r.png');


figure(8)
surf(t,var,putp');
xlabel('Time');
ylabel('Interest rate');
title('Put prices varying interest rate');
saveas(gcf,'surf-put-r.png');

var = 0.1:0.1:0.5;

callp = zeros(size(t,2),size(var,2));
putp = zeros(size(t,2),size(var,2));

% Varying with sigma
for i = 1:size(t,2)
    for j = 1:size(var,2)
        [callp(i,j),putp(i,j)] = l7q1(T,K,1,r,var(j),t(i)); 
    end
end

figure(3)
subplot(2,1,1),hold on
for i = 1:4:size(t,2)
    plot(var,callp(i,:),'Linewidth',1.2);
end
grid on
xlabel('Volatility');
ylabel('Option price');
title('Sensitivity of Call prices with varying \sigma');
legend('t=0','t=0.2','t=0.4','t=0.6','t=0.8','t=1','location','Northwest');
% legend.Location = "NorthWest";
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 15.25, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
hold off;

subplot(2,1,2),hold on
for i = 1:4:size(t,2)
   plot(var,putp(i,:),'Linewidth',1.2);
end
grid on
xlabel('Volatility');
ylabel('Option price');
title('Sensitivity of Put prices with varying \sigma');
legend('t=0','t=0.2','t=0.4','t=0.6','t=0.8','t=1','location','Northwest');
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 15.25, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
hold off;
saveas(gcf,'Varysigma.png');


figure(9)
surf(t,var,callp');
xlabel('Time');
ylabel('\sigma');
title('Call prices varying \sigma');
saveas(gcf,'surf-call-sigma.png');


figure(10)
surf(t,var,putp');
xlabel('Time');
ylabel('\sigma');
title('Put prices varying \sigma');
saveas(gcf,'surf-put-sigma.png');


var = 1.1:0.1:3;

callp = zeros(size(t,2),size(var,2));
putp = zeros(size(t,2),size(var,2));

% Varying with Expiry time
for i = 1:size(t,2)
    for j = 1:size(var,2)
        [callp(i,j),putp(i,j)] = l7q1(var(j),K,1,r,sig,t(i)); 
    end
end

figure(4)
subplot(2,1,1),hold on
for i = 1:4:size(t,2)
    plot(var,callp(i,:),'Linewidth',1.2);
end
grid on
xlabel('Expiry time');
ylabel('Option price');
title('Sensitivity of Call prices with varying expiry time');
legend('t=0','t=0.2','t=0.4','t=0.6','t=0.8','t=1','location','SouthEast');
% legend.Location = "NorthWest";
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 15.25, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
hold off;

subplot(2,1,2),hold on
for i = 1:4:size(t,2)
   plot(var,putp(i,:),'Linewidth',1.2);
end
grid on
xlabel('Expiry tme');
ylabel('Option price');
title('Sensitivity of Put prices with varying expiry time');
legend('t=0','t=0.2','t=0.4','t=0.6','t=0.8','t=1','location','SouthEast');
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 15.25, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
hold off;
saveas(gcf,'VaryT.png');

figure(11)
surf(t,var,callp');
xlabel('Time');
ylabel('Expiration time');
title('Call prices varying Expiration time');
saveas(gcf,'surf-call-T.png');


figure(12)
surf(t,var,putp');
xlabel('Time');
ylabel('Expiration time');
title('Put prices varying Expiration time');
saveas(gcf,'surf-put-T.png');
