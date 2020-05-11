%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g

beta = [5.9,3.9,0.1];
mu = [0.2,0.1,0.4];
sigma = [0.3,0.3,0.11];
r_0 = [0.1,0.2,0.1];

% Part-1
T = 1;
t = linspace(0,T,10);
for i = 1:3
    values = zeros(1,10);
    for j = 1:size(t,2)
       temp = vasicek(beta(i),mu(i),t(j),T,sigma(i),r_0(i));
       values(j) = log(temp)/(t(j)-T);
    end
    figure(i)
    plot(t,values,'-*')
    xlabel('t');
    ylabel('r');
    str = sprintf("Yield vs time(t) -- Set:%d",i);
    title(str);
    str = sprintf('Q1Varyt%d.png',i);
    saveas(gca,str)
    clf();
end

%Part-2

T = linspace(0,1,500);
r = linspace(0.1,0.99,10);
t = 0;
for i = 1:3
    figure(i), hold on
    for k = 1:size(r,2)
        values = zeros(1,500);
        for j = 1:size(T,2)
           temp = vasicek(beta(i),mu(i),t,T(j),sigma(i),r(k));
           values(j) = log(temp)/(t-T(j));
        end
        plot(T,values)
    end
   
    xlabel('T');
    ylabel('r');
    str = sprintf("Yield vs Maturity(T) -- Set:%d",i);
    title(str);
    str = sprintf('Q1VartT%d.png',i);
    saveas(gca,str)
end




function result = vasicek(beta,mu,t,T,sig,r)
    
    a = beta;
    b = beta*mu;
    B = (1-exp(-a*(T-t)))/a;
    A = (B-T-t)*(a*b-0.5*sig*sig)/(a^2) - (sig^2*B^2)/(4*a);
    
    result = exp(A-B*r);

end
