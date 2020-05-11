%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g


titles = ['BHEL',string('BOB'),string('Havells'),string('Dabur'),string('MRF'),string('Niftyoptiondata')];
file = readtable('./NSE/nsedata1.csv');
init = file{1,[1,2,7,5,8]};
file = readtable('./NSE/NSE.csv');
init = [init, file{1,2}];

for id = 1:1
% address = './Option_data/BHEL.csv';
address = sprintf('./Option_data/%s.csv',titles(id));
temp = readtable(address);
maturity = daysact(temp{:,2},  temp{:,3});
for_plot = [temp{:,5},maturity,temp{:,[6,8]}];

% figure(1)
% scatter3(for_plot(:,1),for_plot(:,2),for_plot(:,3));
% xlabel('Strike Price');
% ylabel('Maturity');
% zlabel('Call Price');
% title(sprintf("%s",titles(id)));
% str = char(sprintf("3d_Call_%s.png",titles(id)));
% disp(str);
% saveas(gcf,str);
% clf();
% figure(1)
% scatter(for_plot(:,2),for_plot(:,3));
% xlabel('Maturity');
% ylabel('Call Price');
% title(sprintf("%s",titles(id)));
% saveas(gcf,char(sprintf("2d_Call_maturity_%s.png",titles(id))));
% clf();
% figure(1)
% scatter(for_plot(:,1),for_plot(:,3));
% xlabel('Strike Price');
% ylabel('Call Price');
% title(sprintf("%s",titles(id)));
% saveas(gcf,char(sprintf("2d_Call_K_%s.png",titles(id))));
% clf();
% 
% 
% scatter3(for_plot(:,1),for_plot(:,2),for_plot(:,4));
% xlabel('Strike Price');
% ylabel('Maturity');
% zlabel('Put Price');
% title(sprintf("%s",titles(id)));
% saveas(gcf,char(sprintf("3d_Put_%s.png",titles(id))));
% clf();
% figure(1)
% scatter(for_plot(:,2),for_plot(:,4));
% xlabel('Maturity');
% ylabel('Put Price');
% title(sprintf("%s",titles(id)));
% saveas(gcf,char(sprintf("2d_Put_%s.png",titles(id))));
% clf();
% figure(1)
% scatter(for_plot(:,1),for_plot(:,4));
% xlabel('Strike Price');
% ylabel('Put Price');
% title(sprintf("%s",titles(id)));
% saveas(gcf,char(sprintf("2d_Put_K_%s.png",titles(id))));
% clf();

for k = 1:1
    if for_plot(k,2)==for_plot(1,2)
        d1 = @(x) (log(init(id)/for_plot(k,1)) + (r+0.5*x^2)*(for_plot(k,2)))/(x*sqrt(for_plot(k,2)));
        d2 = @(x) (d1-x*sqrt(for_plot(k,2)));
        f = @(x) init(id)*normcdf(d1)-for_plot(k,1)*normcdf(d2)*exp(-1*r*for_plot(k,2));
        imp_vol = fzero(f,0.01); 
    else
        break;
    end
    disp(imp_vol);
end

end

function curr = nr(f)

    curr = 0.1;
    prev = -inf;
    while(norm(curr-prev)>10^(-3))
       prev = curr;
        curr = prev + eval(subs(f,prev)/subs(diff(f),prev));
        disp(curr);
    end

end


