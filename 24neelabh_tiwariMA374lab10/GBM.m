%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019

function values = GBM(init, mu, sigma, T, dt, str)

if strcmp(str,'Normal')
    no_values = round(T/dt);
    values = zeros(1,no_values);
    values(1) = init;
    for i = 2:no_values
        c = (mu-0.5*sigma^2);
        values(i) = values(i-1)*exp(c*dt + sigma*sqrt(dt)*randn(1));
    end


elseif strcmp(str,'var_reduce')
    
    no_values = round(T/dt);
    values1 = zeros(1,no_values);
    values2 = zeros(1,no_values);
    values1(1) = init;
    values2(1) = init;
    for i = 2:no_values
        c = (mu-0.5*sigma^2);
        values1(i) = values1(i-1)*exp(c*dt + sigma*sqrt(dt)*randn(1));
    end
    
    for i = 2:no_values
        c = (mu-0.5*sigma^2);
        values2(i) = values2(i-1)*exp(c*dt + sigma*sqrt(dt)*randn(1));
    end
       values = (values1+values2)./2;


end

end