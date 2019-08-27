%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g

datafile='./BSE/bsedata1.csv';
%read dataset into table
table_data=readtable(datafile);
data_bse = table_data{:,:};
datafile='./NSE/nsedata1.csv';
%read dataset into table
table_data=readtable(datafile);
data_nse = table_data{:,:};

datafile='./BSE/BSE.csv';
table_data=readtable(datafile);
bse_index = table_data{:,5};

datafile='./NSE/NSE.csv';
table_data=readtable(datafile);
nse_index = table_data{:,5};

nse_titles = ["BHEL","BOB",	"Britannia","Colgate","Dabur","Godrej",	"Havells","MRF","Oracle FS","Titan"];
bse_titles = ["Airtel","Asian Paints","Axis bank","Coal India","LT","Reliance","SBI","Tata Motors","Tata steel","Wipro"];

nse_log_returns = log(data_nse(1:19,:)./data_nse(2:20,:));
bse_log_returns = log(data_bse(1:19,:)./data_bse(2:20,:));
nse_index_log_returns = log(nse_index(1:19,:)./nse_index(2:20,:));
bse_index_log_returns = log(bse_index(1:19,:)./bse_index(2:20,:));

nse_vol = sqrt(var(nse_log_returns))/sqrt(20);
bse_vol = sqrt(var(bse_log_returns))/sqrt(20);
nse_index_vol = sqrt(var(nse_index_log_returns))/sqrt(20);
bse_index_vol = sqrt(var(bse_index_log_returns))/sqrt(20);

% disp([nse_vol',bse_vol']);
csvwrite("vol.csv",[nse_vol',bse_vol']);
% disp([nse_index_vol,bse_index_vol]);

% second part

nse_log_returns = log(data_nse(1:124,:)./data_nse(2:125,:));
bse_log_returns = log(data_bse(1:124,:)./data_bse(2:125,:));
nse_index_log_returns = log(nse_index(1:124,:)./nse_index(2:125,:));
bse_index_log_returns = log(bse_index(1:124,:)./bse_index(2:125,:));

nse_vol = sqrt(var(nse_log_returns))/sqrt(125);
bse_vol = sqrt(var(bse_log_returns))/sqrt(125);
nse_index_vol = sqrt(var(nse_index_log_returns))/sqrt(125);
bse_index_vol = sqrt(var(bse_index_log_returns))/sqrt(125);

call_price_nse = zeros(size(data_nse,2),11);
put_price_nse = zeros(size(data_nse,2),11);
call_price_bse = zeros(size(data_bse,2),11);
put_price_bse = zeros(size(data_nse,2),11);

iterator = 0.5:0.1:1.5;
for i = 1:size(data_nse,2)
   
    init = data_nse(1,i);
    r = 0.05;
    sigma = nse_vol(i);
    
    for j = 1:size(iterator,2)
    
        K = iterator(j)*init;
        d1 = (log(init/K) + (r + sigma^2/2)*(125))/(sigma*sqrt(125));
        d2 = d1-sigma*sqrt(125);
        call_price_nse(i,j) = init*normcdf(d1)-K*normcdf(d2)*exp(-r*(125));
        put_price_nse(i,j) = K*exp(-r*(125))*normcdf(-1*d2) - init*normcdf(-1*d1);
    end
    
end

for i = 1:size(data_bse,2)
   
    init = data_bse(1,i);
    r = 0.05;
    sigma = bse_vol(i);
    
    for j = 1:size(iterator,2)
    
        K = iterator(j)*init;
        d1 = (log(init/K) + (r + sigma^2/2)*(125))/(sigma*sqrt(125));
        d2 = d1-sigma*sqrt(125);
        call_price_bse(i,j) = init*normcdf(d1)-K*normcdf(d2)*exp(-r*(125));
        put_price_bse(i,j) = K*exp(-r*(125))*normcdf(-1*d2) - init*normcdf(-1*d1);
    end
    
end

% Third part
t = [1, 20,42,62,83,104,125];
no_stocks = size(data_nse,2);

call_price_nse = zeros(no_stocks+1,size(iterator,2),size(t,2)-1);
put_price_nse = zeros(no_stocks+1,size(iterator,2),size(t,2)-1);

call_price_bse = zeros(no_stocks+1,size(iterator,2),size(t,2)-1);
put_price_bse = zeros(no_stocks+1,size(iterator,2),size(t,2)-1);

sigma = find_vol(data_nse,nse_index,t);

for i = 1:size(sigma,2)
   figure(1)
   plot(t,sigma(:,i));
   xlabel('Length of the period');
   ylabel('Volatilty');
   if (i ==11)
    title('Nifty index');
    saveas(gcf,'nifty_index_vol.png');
   else
       title(nse_titles(i));
       saveas(gcf,sprintf('%s_vol.png',nse_titles(i)));
   end
   clf();
   
end

for i = 1:size(data_nse,2)+1
   
   
    r = 0.05;  
    sig = sigma(:,1);
    for j = 1:size(iterator,2)
        K = iterator(j)*init;
        for k = 1:size(t,2)-1
            
            
            if (i == size(data_nse,2)+1)
                init = nse_index(t(k));
            else
                 init = data_nse(t(k),i);
            end
    
             
            piece1 = log(init/K);
            piece2 = (r + sig(k)^2/2);
            piece3 = sig(k)*sqrt(t(k));
            d1 = (piece1 + piece2*(t(k)))/(piece3);
            d2 = d1-sig(k)*sqrt(t(k));
            temp = init*normcdf(d1)-K*normcdf(d2)*exp(-r*(t(k)));
            call_price_nse(i,j,k) = temp;
            temp = K*exp(-r*(t(k)))*normcdf(-1*d2) - init*normcdf(-1*d1);
            put_price_nse(i,j,k) = temp;
        end
    
    end

end

sigma = find_vol(data_bse,bse_index,t);


for i = 1:size(sigma,2)
   figure(1)
   plot(t,sigma(:,i));
   xlabel('Length of the period');
   ylabel('Volatilty');
   if (i ==11)
    title('Sensex index');
    saveas(gcf,'sensex_index_vol.png');
   else
       title(bse_titles(i));
       saveas(gcf,sprintf('%s_vol.png',bse_titles(i)));
   end
   clf();
   
end


for i = 1:size(data_bse,2)+1
   
   
    r = 0.05;  
    sig = sigma(:,1);
    for j = 1:size(iterator,2)
        K = iterator(j)*init;
        for k = 1:size(t,2)-1
            
            
            if (i == size(data_nse,2)+1)
                init = nse_index(t(k));
            else
                 init = data_nse(t(k),i);
            end
    
             
            piece1 = log(init/K);
            piece2 = (r + sig(k)^2/2);
            piece3 = sig(k)*sqrt(t(k));
            d1 = (piece1 + piece2*(t(k)))/(piece3);
            d2 = d1-sig(k)*sqrt(t(k));
            temp = init*normcdf(d1)-K*normcdf(d2)*exp(-r*(t(k)));
            call_price_bse(i,j,k) = temp;
            temp = K*exp(-r*(t(k)))*normcdf(-1*d2) - init*normcdf(-1*d1);
            put_price_bse(i,j,k) = temp;
        end
    
    end

end


% 
for i = 1:size(data_nse,2)
   
    figure(1)
   subplot(2,1,1),hold on
   for j = 1:size(iterator,2)       
      plot(t(2:end),reshape(call_price_nse(i,j,:),1,size(t,2)-1)); 
   end
   xlabel('Period length');
   ylabel('Price');
   str1 = sprintf('Call Prices of %s',nse_titles(i));
   title(str1);
   box on;
   hold off
    subplot(2,1,2),hold on
   for j = 1:size(iterator,2)       
      plot(t(2:end),reshape(put_price_nse(i,j,:),1,size(t,2)-1)); 
   end
   xlabel('Period length');
   ylabel('Price');
   str = sprintf('Put Prices of %s',nse_titles(i));
   title(str);
   box on;
   hold off
   str2 = sprintf('%s.png',nse_titles(i));
   saveas(gcf,str2);
    clf();
end

for i = 1:size(data_bse,2)
   
    figure(1)
   subplot(2,1,1),hold on
   for j = 1:size(iterator,2)       
      plot(t(2:end),reshape(call_price_bse(i,j,:),1,size(t,2)-1)); 
   end
   xlabel('Period length');
   ylabel('Price');
   str1 = sprintf('Call Prices of %s',bse_titles(i));
   title(str1);
   box on;
   hold off
    subplot(2,1,2),hold on
   for j = 1:size(iterator,2)       
      plot(t(2:end),reshape(put_price_bse(i,j,:),1,size(t,2)-1)); 
   end
   xlabel('Period length');
   ylabel('Price');
   str = sprintf('Put Prices of %s',bse_titles(i));
   title(str);
   box on;
   hold off
   str2 = sprintf('%s.png',bse_titles(i));
   saveas(gcf,str2);
   clf();
    
end

function result = find_vol(a,b,t)

total = horzcat(a,b);
result = zeros(size(t,2)-1,size(total,2));

    for i = 2:size(t,2)
        total_log_returns = log(total(t(i-1):t(i)-1,:)./total(t(i-1)+1:t(i),:));
        result(i,:) = sqrt(var(total_log_returns))/sqrt(t(i)-t(i-1)+1);
    end

end