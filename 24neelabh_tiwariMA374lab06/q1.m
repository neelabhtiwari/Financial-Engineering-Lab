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

for i = 1:size(nse_titles,2)
    temp = nd(:,i);
    temp=flipud(temp);
    str = sprintf('NSE -- %s',nse_titles(i));
    figure(1)
    subplot(1,3,1)
    plot(temp,'Linewidth',linewidth);
    xlabel('Daily basis');
    ylabel('Price');
    grid on
    subplot(1,3,2)
    temp=nw(:,i);
    temp=flipud(temp);
    plot(temp,'Linewidth',linewidth);
    xlabel('Weekly basis');
    ylabel('Price');
    title(str);
    grid on
    subplot(1,3,3)
    temp=nm(:,i);
    temp=flipud(temp);
    plot(temp,'Linewidth',linewidth);
    xlabel('Monthly basis');
    ylabel('Price');
    grid on
    str = sprintf('NSE_data_%d.png',i);
    set(gcf, 'Units', 'Inches', 'Position', [0, 0, 20, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
    saveas(gcf,str);
end

for i = 1:size(bse_titles,2)
    temp = bd(:,i);
    temp=flipud(temp);
    str = sprintf('BSE -- %s',bse_titles(i));
    figure(1)
    subplot(1,3,1)
    plot(temp,'Linewidth',linewidth);
    xlabel('Daily basis');
    ylabel('Price');
    grid on
    subplot(1,3,2)
    temp = bw(:,i);
    temp=flipud(temp);
    plot(temp,'Linewidth',linewidth);
    xlabel('Weekly basis');
    ylabel('Price');
    title(str);
    grid on
    subplot(1,3,3)
    temp = bm(:,i);
    temp=flipud(temp);
    plot(temp,'Linewidth',linewidth);
    xlabel('Monthly basis');
    ylabel('Price');
    grid on
    str = sprintf('BSE_data_%d.png',i);
    set(gcf, 'Units', 'Inches', 'Position', [0, 0, 15.25, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
    saveas(gcf,str);
end

