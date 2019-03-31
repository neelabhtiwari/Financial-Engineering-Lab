%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g

bd1=readtable('dbsedata1.csv');
bd=bd1{:,2:end};
bw1=readtable('wbsedata1.csv');
bw=bw1{:,2:end};
bm1=readtable('mbsedata1.csv');
bm=bm1{:,2:end};

nd1=readtable('dnsedata1.csv');
nd=nd1{:,2:end};
nw1=readtable('wnsedata1.csv');
nw=nw1{:,2:end};
nm1=readtable('mnsedata1.csv');
nm=nm1{:,2:end};


nse_titles=["ASPN","AXBK","BAJA","BPCL","CIPL","COAL","HLL","INFY","PGRD","ZEE","BOB","BOSH","CRSL","DLF","IDBI","JNSP","LTFH","PCJE","TVSM","VODA"];
bse_titles=["AXBK","HDFC","ICBK","ITC","MRTI","RELI","SBI","SUN","TAMO","YESB","ALBK","APLH","CBI","COLG","GAIL","NEST","TMIN","TTCH","VOLT","WHIR"];
linewidth = 1.5;

% size(bd)
% size(bw)
% size(bm)
% size(nd)
% size(nw)
% size(nm)

nd = log(nd(1:end-1,:)./nd(2:end,:));
nw = log(nw(1:end-1,:)./nw(2:end,:));
nm = log(nm(1:end-1,:)./nm(2:end,:));

bd = log(bd(1:end-1,:)./bd(2:end,:));
bw = log(bw(1:end-1,:)./bw(2:end,:));
bm = log(bm(1:end-1,:)./bm(2:end,:));

for i = 1:size(nse_titles,2)
   
    temp_data = nd(:,i);
    temp=flipud(temp_data);
    temp_mean = mean(temp_data);
    temp_sd = sqrt(var(temp_data));
    norm_data = (temp_data - temp_mean)./temp_sd;
    figure(1)
    subplot(1,3,1)
    histfit(norm_data,20);
    xlabel('Daily basis');
    ylabel('Normalized log returns');
    subplot(1,3,2)
    temp_data = nw(:,i);
    temp=flipud(temp_data);
    temp_mean = mean(temp_data);
    temp_sd = sqrt(var(temp_data));
    norm_data = (temp_data - temp_mean)./temp_sd;
    histfit(norm_data,20);
    xlabel('Weekly basis');
    ylabel('Normalized log returns');
    title(sprintf("NSE -- Normalized Log returns -- %s",nse_titles(i)));
    subplot(1,3,3)
    temp_data = nm(:,i);
    temp=flipud(temp_data);
    temp_mean = mean(temp_data);
    temp_sd = sqrt(var(temp_data));
    norm_data = (temp_data - temp_mean)./temp_sd;
    histfit(norm_data,20);
    xlabel('Monthly basis');
    ylabel('Normalized log returns');
    set(gcf, 'Units', 'Inches', 'Position', [0, 0, 15.25, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
    saveas(gcf,sprintf('NSE_LogReturn_%d.png',i));
end

for i = 1:size(bse_titles,2)
   
    temp_data = bd(:,i);
    temp=flipud(temp_data);
    temp_mean = mean(temp_data);
    temp_sd = sqrt(var(temp_data));
    norm_data = (temp_data - temp_mean)./temp_sd;
    figure(1)
    subplot(1,3,1)
    histfit(norm_data,20);
    xlabel('Daily basis');
    ylabel('Normalized log returns');
    subplot(1,3,2)
    temp_data = bw(:,i);
    temp=flipud(temp_data);
    temp_mean = mean(temp_data);
    temp_sd = sqrt(var(temp_data));
    norm_data = (temp_data - temp_mean)./temp_sd;
    histfit(norm_data,20);
    xlabel('Weekly basis');
    ylabel('Normalized log returns');
    title(sprintf("BSE -- Normalized Log returns -- %s",bse_titles(i)));
    subplot(1,3,3)
    temp_data = bm(:,i);
    temp=flipud(temp_data);
    temp_mean = mean(temp_data);
    temp_sd = sqrt(var(temp_data));
    norm_data = (temp_data - temp_mean)./temp_sd;
    histfit(norm_data,20);
    xlabel('Monthly basis');
    ylabel('Normalized log returns');
    set(gcf, 'Units', 'Inches', 'Position', [0, 0, 15.25, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
    saveas(gcf,sprintf('BSE_LogReturn_%d.png',i));
end
