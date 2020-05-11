%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g

beta = [0.02,0.7,0.06];
mu = [0.7,0.1,0.09];
sigma = [0.02,0.3,0.5];
r_0 = [0.1,0.2,0.02];


% Part-1
T = 1;
t = linspace(0,T,10);
for i = 1:3
    values = zeros(1,10);
    for j = 1:size(t,2)
       temp = cir(beta(i),mu(i),t(j),T,sigma(i),r_0(i));
       values(j) = log(temp)/(t(j)-T);
    end
    figure(i)
    plot(t,values,'-*')
%     xlim([0 1])
    xlabel('t');
    ylabel('r');
    str = sprintf("Yield vs time(t) -- Set:%d",i);
    title(str);
    str = sprintf('Q2Varyt%d.png',i);
    saveas(gca,str)
%     clf();
end

%Part-2

T = linspace(0.1,1,600);
r = 0.1:0.1:1;
t = 0;
for i = 1:1
    figure(4), hold on
    for k = 1:size(r,2)
        values = zeros(1,600);
        for j = 1:size(T,2)
           temp = cir(beta(i),mu(i),t,T(j),sigma(i),r(k));
           values(j) = log(temp)/(t-T(j));
        end
        plot(T,values)
    end
   
    xlabel('T');
    ylabel('r');
    str = sprintf("Yield vs Maturity(T) -- Set:%d",i);
    title(str);
    str = sprintf('Q2VartT%d.png',i);
    saveas(gca,str)
end




function result = cir(beta,mu,t,T,sig,r)
    
    gamma = sqrt(beta^2+2*sig^2);
    x = T-t;
    B = (2*exp(gamma*x)-1)/((gamma+beta)*(exp(gamma*x)-1)+2*gamma);
    A = ((2*gamma*exp((beta+gamma)*(x/2)))/(((gamma+beta)*(exp(gamma*x)-1)+2*gamma)))^(2*beta*mu/(sig^2));
    result = A*exp(-1*B*r);

end
