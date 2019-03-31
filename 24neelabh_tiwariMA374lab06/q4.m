%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g

bd1=readtable('dbsedata1.csv');
bd=bd1{:,2:end};
nd1=readtable('dnsedata1.csv');
nd=nd1{:,2:end};
bd2=bd;
nd2=nd;

nse_titles=["ASPN","AXBK","BAJA","BPCL","CIPL","COAL","HLL","INFY","PGRD","ZEE","BOB","BOSH","CRSL","DLF","IDBI","JNSP","LTFH","PCJE","TVSM","VODA"];
bse_titles=["AXBK","HDFC","ICBK","ITC","MRTI","RELI","SBI","SUN","TAMO","YESB","ALBK","APLH","CBI","COLG","GAIL","NEST","TMIN","TTCH","VOLT","WHIR"];
linewidth = 1.5;

nd = log(nd(1:end-1,:)./nd(2:end,:));
bd = log(bd(1:end-1,:)./bd(2:end,:));

munse=sum(nd(247:end,:))/3;
sigmanse=sqrt(var(nd(247:end,:)));
mubse=sum(bd(247:end,:))/3;
sigmabse=sqrt(var(bd(247:end,:)));

predict = zeros(1,246);

for i = 1:size(nse_titles,2)
    
    S0=nd2(247,i);
    for j=1:246
        inpower=(munse(i)-(sigmanse(i)*sigmanse(i))/2)*j*(1/246)+sigmanse(i)*normrnd(0,j*(1/246));
        predict(j)=S0*exp(inpower);
    end    
    
    figure(1),hold on
    plot(predict,'Linewidth',linewidth);
    orgplot=flipud(nd2(1:246,i));
    plot(orgplot,'Linewidth',linewidth);
    xlabel('Daily basis');
    ylabel('Prices');
    legend('Predicted','Actual'); 
    hold off;
    title(sprintf("NSE -- %s",nse_titles(i)));
    set(gcf, 'Units', 'Inches', 'Position', [0, 0, 15.25, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
    saveas(gcf,sprintf('NSE_Prediction_%d.png',i));
    clf;
end

predict = zeros(1,246);

for i = 1:size(bse_titles,2)
   
    S0=bd2(247,i);
    for j=1:246
        inpower=(mubse(i)-(sigmabse(i)*sigmabse(i))/2)*j*(1/246)+sigmabse(i)*normrnd(0,j*(1/246));
        predict(j)=S0*exp(inpower);
    end 
    
    figure(1),hold on
    plot(predict,'Linewidth',linewidth);
    orgplot=flipud(bd2(1:246,i));
    plot(orgplot,'Linewidth',linewidth);
    xlabel('Daily basis');
    ylabel('Prices');
    hold off;
    legend('Predicted','Actual'); 
    title(sprintf("BSE -- %s",bse_titles(i)));
    set(gcf, 'Units', 'Inches', 'Position', [0, 0, 15.25, 8], 'PaperUnits', 'Inches', 'PaperSize', [7.25, 9.125])
    saveas(gcf,sprintf('BSE_Prediction_%d.png',i));
    clf;
end
