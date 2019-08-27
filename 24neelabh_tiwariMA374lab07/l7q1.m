%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
%A single function calculate call and put option pricing using BSM model

function [callp,putp]=l7q1(T,K,S,r,sig,t)
    d_1=(log(S/K)+(r+sig^2/2)*(T-t))/(sig*sqrt(T-t));
    d_2=d_1-sig*sqrt(T-t);
    if T==t
        putp=max(K-S,0);
        callp=max(S-K,0);
        return;
    end
    putp=K*exp(-r*(T-t))*normcdf(-1*d_2) - S*normcdf(-1*d_1);
    callp=S*normcdf(d_1)-K*normcdf(d_2)*exp(-r*(T-t));    
end

