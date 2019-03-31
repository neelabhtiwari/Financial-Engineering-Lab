%This code is written by Neelabh Tiwari - 160123024 for MA 374 FE LAB Jan-May 2019

clear
clc
format short

datafile='./BSE/bsedata1.csv';
%read dataset into table
table_data=readtable(datafile);
data_bse = table_data{:,:};
datafile='./NSE/nsedata1.csv';
%read dataset into table
table_data=readtable(datafile);
data_nse = table_data{:,:};

data = [data_bse,data_nse];

% disp(data);
datafile='./NSE/NSE.csv';
%read dataset into table
table_data=readtable(datafile);
nse_index = table_data{:,5};

datafile='./BSE/BSE.csv';
%read dataset into table
table_data=readtable(datafile);
bse_index = table_data{:,5};



bse_index(2:end) = (bse_index(2:end)-bse_index(1:end-1))./bse_index(1:end-1);
nse_index(2:end) = (nse_index(2:end)-nse_index(1:end-1))./nse_index(1:end-1);
data(2:end,:) = (data(2:end,:)-data(1:end-1,:))./data(1:end-1,:);

bse_index(1) = 0;
nse_index(1) = 0;
data(1,:) = 0;
mu_m_nse = mean(nse_index);
sigma_m_nse =sqrt(var(nse_index));

mu_m_bse = mean(bse_index);
sigma_m_bse = sqrt(var(bse_index));

r_f = 0.05;


M = mean(data);
beta_nse = (M-r_f)./(mu_m_nse-r_f);
beta_bse = (M-r_f)./(mu_m_bse-r_f);
disp(beta_nse');
disp(beta_bse');

csvwrite('data.csv',[beta_bse' beta_nse'])

figure, hold on
beta = -1:0.01:1.5;
mu_v_nse = r_f + (mu_m_nse-r_f).*beta;
mu_v_bse = r_f + (mu_m_bse-r_f).*beta;
plot(beta,mu_v_nse);
plot(beta,mu_v_bse);
scatter(1,mu_m_nse,'*');
scatter(1,mu_m_bse,'*');
xlabel('\beta');
ylabel('\mu_v');
title('Security Market lines');
legend('NSE','BSE','NSE INDEX','BSE INDEX');
hold off;

figure
plot(beta,mu_v_bse-mu_v_nse);
xlabel('\beta');
ylabel('\beta_{bse}-\beta_{nse}');
title('Difference in SMLs');