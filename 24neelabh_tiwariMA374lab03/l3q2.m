%This code is written by Neelabh Tiwari - 160123024 for MA 374 FE LAB Jan-May 2019

clear
clc
format short

So=100; T=1; M=5:5:10; M_new=1:1:15; r=0.08; sigma=0.2; 

for i=1:length(M_new)
    
    dt=T/M_new(i);
    u=exp(sigma*sqrt(dt)+(r-1/2*sigma^2)*dt); 
    d=exp(-sigma*sqrt(dt)+(r-1/2*sigma^2)*dt);  
    p=(exp(r*dt)-d)/(u-d);
       
    [Lookback,Intermediate_values]=Lookback_options(So,r,M_new(i),p,u,d,dt);
    call_1(i)=Lookback(1,1); 
    
    if(M_new(i)==5 || M_new(i)==10 || M_new(i)==15) 
        disp(call_1(i));
    end
        
    if M_new(i)==5
          disp(Intermediate_values) 
    end

end
    
plot(M_new,call_1,'r');   grid on;
title('Plot of initial values of Lookback option vs M');
xlabel('Value of M');
ylabel('Initial value of Lookback option i.e. at t=0');

function [prices_1,Intermediate_values]=Lookback_options(So,r,M,p,u,d,dt)

Lookback=zeros(pow2(M),M+1);
Intermediate_values=zeros(pow2(M),M+1);

Lookback(1,1)=So;

for j=1:M+1
    for i=1:pow2(j-1)                          
        Lookback(2*i-1,j+1)=Lookback(i,j)*u;
        Lookback(2*i,j+1)=Lookback(i,j)*d;
    end
end
    
    prices_1=zeros(pow2(M),1);
    
    for i= 1:pow2(M)

        new_i=i;
        m=Lookback(i,M+1);
            
        for j=M+1:-1:1 
            m=max(Lookback(new_i,j),m);
            new_i=ceil(new_i/2);
        end
        
        prices_1(i)=m-Lookback(i,M+1); 
        Intermediate_values(i,M+1)=prices_1(i);
       
    end
    
    
    j=M; 
    while length(prices_1)>1
        new_prices1=[];
       
        for i=1:2:length(prices_1)
            new_prices1(ceil(i/2))=((1-p)*prices_1(i+1)+p*prices_1(i))*exp(-r*dt);
            Intermediate_values(ceil(i/2),j)=new_prices1(ceil(i/2));
        end
      
      prices_1=new_prices1; 
      j=j-1;
         
    end 
   
end
       