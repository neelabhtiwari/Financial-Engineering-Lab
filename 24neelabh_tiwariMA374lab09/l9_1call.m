%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g

clear all;

[num] = xlsread('NSEoptiondata.xlsx','29 Dec 11 call');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 41/12;
end

mesh(strike,settle,maturity)
%mesh(maturity,settle)

xlabel('Maturity Price')
ylabel('call Price')
zlabel('Maturity')
hold all;

clear all;

[num] = xlsread('NSEoptiondata.xlsx','30 Jun 11 call');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 35/12;
end

mesh(strike,settle,maturity)
%mesh(maturity,settle)

clear all;

[num] = xlsread('NSEoptiondata.xlsx','30 Dec 10 call');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 29/12;
end

mesh(strike,settle,maturity)
%mesh(maturity,settle)

clear all;

[num] = xlsread('NSEoptiondata.xlsx','24 Jun 10 call');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 23/12;
end

mesh(strike,settle,maturity)
%mesh(maturity,settle)

clear all;


[num] = xlsread('NSEoptiondata.xlsx','31 Dec 09 call');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 17/12;
end


mesh(strike,settle,maturity)
%mesh(maturity,settle)

clear all;

[num] = xlsread('NSEoptiondata.xlsx','25 Jun 09 call');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 11/12;
end


mesh(strike,settle,maturity)
%mesh(maturity,settle)


clear all;

[num] = xlsread('NSEoptiondata.xlsx','26 Mar 09 call');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 8/12;
end

mesh(strike,settle,maturity)
%mesh(maturity,settle)


clear all;

[num] = xlsread('NSEoptiondata.xlsx','25 Dec 08 call');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 5/12;
end

mesh(strike,settle,maturity)
%mesh(maturity,settle)

clear all;

[num] = xlsread('NSEoptiondata.xlsx','25 Sep 08 call');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 2/12;
end

mesh(strike,settle,maturity)
%mesh(maturity,settle)


clear all;

[num] = xlsread('NSEoptiondata.xlsx','28 Aug 08 call');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 1/12;
end


mesh(strike,settle,maturity)
%mesh(maturity,settle)
