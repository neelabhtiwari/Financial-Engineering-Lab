%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g

clc;
clear all;
s = 4332.95;
r = 0.05;

[num] = xlsread('NSEoptiondata.xlsx','29 Dec 11 put');
[c row] = size(num);


for i = 1:c
    strike(i,1) = num(i,1);
    settle(i,1) = num(i,3);
    maturity(i,1) = 41;
    K = strike(i,1);
    tau = maturity(i,1)/12;
    sg = 0.5;
    err = 1;
    while(err > 0.00001)
    
        dp = (log(s/K) + (r + sg*sg/2)*tau)/(sg*sqrt(tau));
        dm = (log(s/K) + (r - sg*sg/2)*tau)/(sg*sqrt(tau));

        put = K*exp(-r*tau)*normcdf(-dm,0,1) - s*normcdf(-dp,0,1) - num(i,3);
       
        PI = 3.1417;      
        sgnew = sg - put*sqrt(2*PI)/(-s*exp(-0.5*dp*dp)*(dp/sg - sqrt(tau)) + K*exp(-r*tau)*exp(-0.5*dm*dm)*(dm/sg + sqrt(tau)) );
        err = abs(sgnew - sg)
        sg = sgnew;
        clear sgnew;
        sg;
    end
    vol(i) = sg;
  clear sg;
    
end

plot3(vol,strike,maturity,'o')
%plot(strike,settle)
%plot(maturity,settle)
xlabel('Volatility')
ylabel('Stike Price')
zlabel('Maturity')
hold all;


[num] = xlsread('NSEoptiondata.xlsx','30 Jun 11 put');
[c row] = size(num);


for i = 1:c
    strike(i,1) = num(i,1);
    settle(i,1) = num(i,3);
    maturity(i,1) = 35;
    K = strike(i,1);
    tau = maturity(i,1)/12;
    sg = 0.5;
    err = 1;
    while(err > 0.00001)
    
        dp = (log(s/K) + (r + sg*sg/2)*tau)/(sg*sqrt(tau));
        dm = (log(s/K) + (r - sg*sg/2)*tau)/(sg*sqrt(tau));

       put = K*exp(-r*tau)*normcdf(-dm,0,1) - s*normcdf(-dp,0,1) - num(i,3);
        
        
        PI = 3.1417;      
        sgnew = sg - put*sqrt(2*PI)/(s*exp(-0.5*dp*dp)*(-dp/sg + sqrt(tau)) - K*exp(-r*tau)*exp(-0.5*dm*dm)*(-dm/sg - sqrt(tau)) );
        err = abs(sgnew - sg);
        sg = sgnew;
        clear sgnew;
        sg;
    end
    vol(i) = sg;
  clear sg;
    
end

plot3(vol,strike,maturity,'o')
%plot(strike,settle)
%plot(maturity,settle)

[num] = xlsread('NSEoptiondata.xlsx','30 Dec 10 put');
[c row] = size(num);


for i = 1:c
    strike(i,1) = num(i,1);
    settle(i,1) = num(i,3);
    maturity(i,1) = 29;
    K = strike(i,1);
    tau = maturity(i,1)/12;
    sg = 0.5;
    err = 1;
    while(err > 0.00001)
    
        dp = (log(s/K) + (r + sg*sg/2)*tau)/(sg*sqrt(tau));
        dm = (log(s/K) + (r - sg*sg/2)*tau)/(sg*sqrt(tau));

       put = K*exp(-r*tau)*normcdf(-dm,0,1) - s*normcdf(-dp,0,1) - num(i,3);
        
        
        PI = 3.1417;      
        sgnew = sg - put*sqrt(2*PI)/(s*exp(-0.5*dp*dp)*(-dp/sg + sqrt(tau)) - K*exp(-r*tau)*exp(-0.5*dm*dm)*(-dm/sg - sqrt(tau)) );
        err = abs(sgnew - sg);
        sg = sgnew;
        clear sgnew;
        sg;
    end
    vol(i) = sg;
  clear sg;
    
end

plot3(vol,strike,maturity,'O')
%plot(strike,settle)
%plot(maturity,settle)


[num] = xlsread('NSEoptiondata.xlsx','24 Jun 10 put');
[c row] = size(num);


for i = 1:c
    strike(i,1) = num(i,1);
    settle(i,1) = num(i,3);
    maturity(i,1) = 23;
    K = strike(i,1);
    tau = maturity(i,1)/12;
    sg = 0.5;
    err = 1;
    while(err > 0.00001)
    
        dp = (log(s/K) + (r + sg*sg/2)*tau)/(sg*sqrt(tau));
        dm = (log(s/K) + (r - sg*sg/2)*tau)/(sg*sqrt(tau));

       put = K*exp(-r*tau)*normcdf(-dm,0,1) - s*normcdf(-dp,0,1) - num(i,3);
        
        
        PI = 3.1417;      
        sgnew = sg - put*sqrt(2*PI)/(s*exp(-0.5*dp*dp)*(-dp/sg + sqrt(tau)) - K*exp(-r*tau)*exp(-0.5*dm*dm)*(-dm/sg - sqrt(tau)) );
        err = abs(sgnew - sg);
        sg = sgnew;
        clear sgnew;
        sg;
    end
    vol(i) = sg;
  clear sg;
    
end

plot3(vol,strike,maturity,'o')
%plot(strike,settle)
%plot(maturity,settle)


[num] = xlsread('NSEoptiondata.xlsx','31 Dec 09 put');
[c row] = size(num);


for i = 1:c
    strike(i,1) = num(i,1);
    settle(i,1) = num(i,3);
    maturity(i,1) = 17;
    K = strike(i,1);
    tau = maturity(i,1)/12;
    sg = 0.5;
    err = 1;
    while(err > 0.00001)
    
        dp = (log(s/K) + (r + sg*sg/2)*tau)/(sg*sqrt(tau));
        dm = (log(s/K) + (r - sg*sg/2)*tau)/(sg*sqrt(tau));

       put = K*exp(-r*tau)*normcdf(-dm,0,1) - s*normcdf(-dp,0,1) - num(i,3);
        
        
        PI = 3.1417;      
        sgnew = sg - put*sqrt(2*PI)/(s*exp(-0.5*dp*dp)*(-dp/sg + sqrt(tau)) - K*exp(-r*tau)*exp(-0.5*dm*dm)*(-dm/sg - sqrt(tau)) );
        err = abs(sgnew - sg);
        sg = sgnew;
        clear sgnew;
        sg;
    end
    vol(i) = sg;
  clear sg;
    
end

plot3(vol,strike,maturity,'o')
%plot(strike,settle)
%plot(maturity,settle)

[num] = xlsread('NSEoptiondata.xlsx','25 Jun 09 put');
[c row] = size(num);


for i = 1:c
    strike(i,1) = num(i,1);
    settle(i,1) = num(i,3);
    maturity(i,1) = 11;
    K = strike(i,1);
    tau = maturity(i,1)/12;
    sg = 0.5;
    err = 1;
    while(err > 0.00001)
    
        dp = (log(s/K) + (r + sg*sg/2)*tau)/(sg*sqrt(tau));
        dm = (log(s/K) + (r - sg*sg/2)*tau)/(sg*sqrt(tau));

       put = K*exp(-r*tau)*normcdf(-dm,0,1) - s*normcdf(-dp,0,1) - num(i,3);
        
        
        PI = 3.1417;      
        sgnew = sg - put*sqrt(2*PI)/(s*exp(-0.5*dp*dp)*(-dp/sg + sqrt(tau)) - K*exp(-r*tau)*exp(-0.5*dm*dm)*(-dm/sg - sqrt(tau)) );
        err = abs(sgnew - sg);
        sg = sgnew;
        clear sgnew;
        sg;
    end
    vol(i) = sg;
  clear sg;
    
end

plot3(vol,strike,maturity,'o')
%plot(strike,settle)
%plot(maturity,settle)

[num] = xlsread('NSEoptiondata.xlsx','26 Mar 09 put');
[c row] = size(num);


for i = 1:c
    strike(i,1) = num(i,1);
    settle(i,1) = num(i,3);
    maturity(i,1) = 8;
    K = strike(i,1);
    tau = maturity(i,1)/12;
    sg = 0.5;
    err = 1;
    while(err > 0.00001)
    
        dp = (log(s/K) + (r + sg*sg/2)*tau)/(sg*sqrt(tau));
        dm = (log(s/K) + (r - sg*sg/2)*tau)/(sg*sqrt(tau));

       put = K*exp(-r*tau)*normcdf(-dm,0,1) - s*normcdf(-dp,0,1) - num(i,3);
        
        
        PI = 3.1417;      
        sgnew = sg - put*sqrt(2*PI)/(s*exp(-0.5*dp*dp)*(-dp/sg + sqrt(tau)) - K*exp(-r*tau)*exp(-0.5*dm*dm)*(-dm/sg - sqrt(tau)) );
        err = abs(sgnew - sg);
        sg = sgnew;
        clear sgnew;
        sg;
    end
    vol(i) = sg;
  clear sg;
    
end

plot3(vol,strike,maturity,'o')
%plot(strike,settle)
%plot(maturity,settle)

[num] = xlsread('NSEoptiondata.xlsx','25 Dec 08 put');
[c row] = size(num);


for i = 1:c
    strike(i,1) = num(i,1);
    settle(i,1) = num(i,3);
    maturity(i,1) = 5;
    K = strike(i,1);
    tau = maturity(i,1)/12;
    sg = 0.5;
    err = 1;
    while(err > 0.00001)
    
        dp = (log(s/K) + (r + sg*sg/2)*tau)/(sg*sqrt(tau));
        dm = (log(s/K) + (r - sg*sg/2)*tau)/(sg*sqrt(tau));

       put = K*exp(-r*tau)*normcdf(-dm,0,1) - s*normcdf(-dp,0,1) - num(i,3);
        
        
        PI = 3.1417;      
        sgnew = sg - put*sqrt(2*PI)/(s*exp(-0.5*dp*dp)*(-dp/sg + sqrt(tau)) - K*exp(-r*tau)*exp(-0.5*dm*dm)*(-dm/sg - sqrt(tau)) );
        err = abs(sgnew - sg);
        sg = sgnew;
        clear sgnew;
        sg;
    end
    vol(i) = sg;
  clear sg;
    
end

plot3(vol,strike,maturity,'o')
%plot(strike,settle)
%plot(maturity,settle)

[num] = xlsread('NSEoptiondata.xlsx','25 Sep 08 put');
[c row] = size(num);


for i = 1:c
    strike(i,1) = num(i,1);
    settle(i,1) = num(i,3);
    maturity(i,1) = 2;
    K = strike(i,1);
    tau = maturity(i,1)/12;
    sg = 0.5;
    err = 1;
    while(err > 0.00001)
    
        dp = (log(s/K) + (r + sg*sg/2)*tau)/(sg*sqrt(tau));
        dm = (log(s/K) + (r - sg*sg/2)*tau)/(sg*sqrt(tau));

       put = K*exp(-r*tau)*normcdf(-dm,0,1) - s*normcdf(-dp,0,1) - num(i,3);
        
        
        PI = 3.1417;      
        sgnew = sg - put*sqrt(2*PI)/(s*exp(-0.5*dp*dp)*(-dp/sg + sqrt(tau)) - K*exp(-r*tau)*exp(-0.5*dm*dm)*(-dm/sg - sqrt(tau)) );
        err = abs(sgnew - sg);
        sg = sgnew;
        clear sgnew;
        sg;
    end
    vol(i) = sg;
  clear sg;
    
end

plot3(vol,strike,maturity,'o')
%plot(strike,settle)
%plot(maturity,settle)

[num] = xlsread('NSEoptiondata.xlsx','28 Aug 08 put');
[c row] = size(num);

for i = 1:c
    strike(i,1) = num(i,1);
    settle(i,1) = num(i,3);
    maturity(i,1) = 1;
    K = strike(i,1);
    tau = maturity(i,1)/12;    
    sg = 0.5;
    err = 1;
    while(err > 0.00001)
    
        dp = (log(s/K) + (r + sg*sg/2)*tau)/(sg*sqrt(tau));
        dm = (log(s/K) + (r - sg*sg/2)*tau)/(sg*sqrt(tau));

        put = K*exp(-r*tau)*normcdf(-dm,0,1) - s*normcdf(-dp,0,1) - num(i,3);
                
        PI = 3.1417;      
        sgnew = sg - put*sqrt(2*PI)/(s*exp(-0.5*dp*dp)*(-dp/sg + sqrt(tau)) - K*exp(-r*tau)*exp(-0.5*dm*dm)*(-dm/sg - sqrt(tau)) );
        err = abs(sgnew - sg);
        sg = sgnew;
        clear sgnew;
        sg;
    end
    vol(i) = sg;
  clear sg;
    
end

plot3(vol,strike,maturity,'o')
%plot(strike,settle)
%plot(maturity,settle)
