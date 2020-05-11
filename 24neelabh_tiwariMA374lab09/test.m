clc;
clear all;
s = 4332.95;
r = 0.05;
ret = xlsread('NSEoptiondata.xlsx','nifty');


[num] = xlsread('NSEoptiondata.xlsx','29 Dec 11 put');
[c row] = size(num);


for i = 1:c
    strike(i,1) = num(i,1);
    settle(i,1) = num(i,3);
    maturity(i,1) = 41;
    K = strike(i,1);
    tau = maturity(i,1)/12;
   
    l = maturity(i,1)*21;
    for j = 1:l
        MnBR(j) = ret(j);
    end

    V = 252*var(MnBR);
   
    sg = 0.5;
    err = 1;
    while(err > 0.001)
    
        dp = (log(s/K) + (r + sg*sg/2)*tau)/(sg*sqrt(tau));
        dm = (log(s/K) + (r - sg*sg/2)*tau)/(sg*sqrt(tau));

        put = K*exp(-r*tau)*normcdf(-dm,0,1) - s*normcdf(-dp,0,1) - num(i,3);
        
        PI = 3.1417;      
        sgnew = sg - put*sqrt(2*PI)/(-s*exp(-0.5*dp*dp)*(dp/sg - sqrt(tau)) + K*exp(-r*tau)*exp(-0.5*dm*dm)*(dm/sg + sqrt(tau)) );
        err = abs(sgnew - sg);
        sg = sgnew;
        clear sgnew;
        sg;
    end
    vol(i) = sg;
    his(i) = sqrt(V);
  clear sg;
    
end

plot(vol,maturity)
hold all
plot(his,maturity,'+')